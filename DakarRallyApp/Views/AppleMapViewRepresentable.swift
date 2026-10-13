import SwiftUI
import MapKit

public struct AppleMapViewRepresentable: UIViewRepresentable {
    @ObservedObject var locationService: LocationService
    public var polylineCoordinates: [CLLocationCoordinate2D]
    public var mapType: MKMapType = .hybrid
    
    public init(locationService: LocationService, polylineCoordinates: [CLLocationCoordinate2D], mapType: MKMapType = .hybrid) {
        self.locationService = locationService
        self.polylineCoordinates = polylineCoordinates
        self.mapType = mapType
    }
    
    public func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    public func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        mapView.mapType = mapType
        mapView.showsUserLocation = false // We draw our custom rally car marker with heading cone
        mapView.showsCompass = true
        mapView.showsScale = true
        return mapView
    }
    
    public func updateUIView(_ uiView: MKMapView, context: Context) {
        context.coordinator.parent = self
        
        // Update map type if changed
        if uiView.mapType != mapType {
            uiView.mapType = mapType
        }
        
        // Update Polyline
        context.coordinator.updatePolyline(on: uiView, coordinates: polylineCoordinates)
        
        // Update Waypoint Annotations
        context.coordinator.updateAnnotations(on: uiView, stage: locationService.activeStage)
        
        // Update Car Marker & Camera
        let carCoord = CLLocationCoordinate2D(
            latitude: locationService.telemetry.currentLatitude,
            longitude: locationService.telemetry.currentLongitude
        )
        if CLLocationCoordinate2DIsValid(carCoord) && carCoord.latitude != 0 {
            context.coordinator.updateCarAnnotation(on: uiView, coordinate: carCoord, heading: locationService.telemetry.currentHeadingDegrees)
        }
    }
    
    public class Coordinator: NSObject, MKMapViewDelegate {
        var parent: AppleMapViewRepresentable
        private var currentPolyline: MKPolyline?
        private var carAnnotation: RallyCarAnnotation?
        private var hasCenteredInitially = false
        
        init(_ parent: AppleMapViewRepresentable) {
            self.parent = parent
        }
        
        func updatePolyline(on mapView: MKMapView, coordinates: [CLLocationCoordinate2D]) {
            guard coordinates.count > 1 else { return }
            
            if let existing = currentPolyline {
                mapView.removeOverlay(existing)
            }
            
            let polyline = MKPolyline(coordinates: coordinates, count: coordinates.count)
            currentPolyline = polyline
            mapView.addOverlay(polyline)
            
            if !hasCenteredInitially {
                hasCenteredInitially = true
                let rect = polyline.boundingMapRect
                mapView.setVisibleMapRect(rect, edgePadding: UIEdgeInsets(top: 40, left: 40, bottom: 40, right: 40), animated: false)
            }
        }
        
        func updateAnnotations(on mapView: MKMapView, stage: DakarStage?) {
            guard let stage = stage else { return }
            
            // Only add if not already present
            let existingWpts = mapView.annotations.compactMap { $0 as? DakarWaypointAnnotation }
            if existingWpts.count != stage.notes.count {
                mapView.removeAnnotations(existingWpts)
                
                let newAnnotations = stage.notes.map { note in
                    DakarWaypointAnnotation(note: note)
                }
                mapView.addAnnotations(newAnnotations)
            }
        }
        
        func updateCarAnnotation(on mapView: MKMapView, coordinate: CLLocationCoordinate2D, heading: Double) {
            if let car = carAnnotation {
                car.coordinate = coordinate
                car.heading = heading
                if let view = mapView.view(for: car) as? RallyCarAnnotationView {
                    view.updateHeading(heading)
                }
            } else {
                let car = RallyCarAnnotation(coordinate: coordinate, heading: heading)
                carAnnotation = car
                mapView.addAnnotation(car)
                
                // Center on car initially
                let region = MKCoordinateRegion(center: coordinate, latitudinalMeters: 1500, longitudinalMeters: 1500)
                mapView.setRegion(region, animated: true)
            }
        }
        
        // MARK: - MKMapViewDelegate
        public func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
            if let polyline = overlay as? MKPolyline {
                let renderer = MKPolylineRenderer(polyline: polyline)
                renderer.strokeColor = UIColor(red: 1.0, green: 0.35, blue: 0.0, alpha: 0.95) // Dakar Neon Orange
                renderer.lineWidth = 6
                renderer.lineCap = .round
                renderer.lineJoin = .round
                return renderer
            }
            return MKOverlayRenderer(overlay: overlay)
        }
        
        public func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
            if let car = annotation as? RallyCarAnnotation {
                let identifier = "RallyCarView"
                var view = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? RallyCarAnnotationView
                if view == nil {
                    view = RallyCarAnnotationView(annotation: car, reuseIdentifier: identifier)
                } else {
                    view?.annotation = car
                }
                view?.updateHeading(car.heading)
                return view
            }
            
            if let wpt = annotation as? DakarWaypointAnnotation {
                let identifier = "DakarWptView"
                var view = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKMarkerAnnotationView
                if view == nil {
                    view = MKMarkerAnnotationView(annotation: wpt, reuseIdentifier: identifier)
                    view?.canShowCallout = true
                } else {
                    view?.annotation = wpt
                }
                
                view?.glyphText = "\(wpt.note.id)"
                view?.markerTintColor = wptColor(for: wpt.note)
                return view
            }
            
            return nil
        }
        
        private func wptColor(for note: RoadbookNote) -> UIColor {
            if note.waypointType == .start { return .systemGreen }
            if note.waypointType == .finish { return .black }
            if note.danger == .danger2 || note.danger == .danger3 { return .systemRed }
            if note.waypointType == .dz { return .systemOrange }
            if note.waypointType == .cp { return .systemPurple }
            return UIColor(red: 1.0, green: 0.8, blue: 0.0, alpha: 1.0)
        }
    }
}

// Custom Car & Heading Annotation
public class RallyCarAnnotation: NSObject, MKAnnotation {
    @objc dynamic public var coordinate: CLLocationCoordinate2D
    public var heading: Double
    
    init(coordinate: CLLocationCoordinate2D, heading: Double) {
        self.coordinate = coordinate
        self.heading = heading
        super.init()
    }
}

public class RallyCarAnnotationView: MKAnnotationView {
    private let arrowImageView = UIImageView()
    
    override init(annotation: MKAnnotation?, reuseIdentifier: String?) {
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
        frame = CGRect(x: 0, y: 0, width: 36, height: 36)
        
        arrowImageView.frame = bounds
        arrowImageView.contentMode = .scaleAspectFit
        arrowImageView.image = UIImage(systemName: "location.north.circle.fill")?.withTintColor(
            UIColor(red: 0.0, green: 0.7, blue: 1.0, alpha: 1.0),
            renderingMode: .alwaysOriginal
        )
        addSubview(arrowImageView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateHeading(_ heading: Double) {
        let radians = heading * .pi / 180.0
        arrowImageView.transform = CGAffineTransform(rotationAngle: CGFloat(radians))
    }
}

// Custom Dakar Waypoint Annotation
public class DakarWaypointAnnotation: NSObject, MKAnnotation {
    public let note: RoadbookNote
    public var coordinate: CLLocationCoordinate2D { note.coordinate }
    public var title: String? { "Note #\(note.id) (\(note.totalKM) km)" }
    public var subtitle: String? { "CAP: \(note.tulip.headingCAP)° | \(note.textComment)" }
    
    init(note: RoadbookNote) {
        self.note = note
        super.init()
    }
}
