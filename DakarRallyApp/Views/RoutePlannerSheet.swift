import SwiftUI
import MapKit

public struct RoutePlannerSheet: View {
    @ObservedObject var locationService: LocationService
    @Binding var polylineCoordinates: [CLLocationCoordinate2D]
    @Environment(\.dismiss) var dismiss
    
    @State private var fromQuery: String = "Current Location"
    @State private var toQuery: String = "Pisco Dunes, Peru"
    @State private var isCalculating: Bool = false
    @State private var errorMessage: String? = nil
    
    public init(locationService: LocationService, polylineCoordinates: Binding<[CLLocationCoordinate2D]>) {
        self.locationService = locationService
        self._polylineCoordinates = polylineCoordinates
    }
    
    public var body: some View {
        NavigationView {
            Form {
                Section(header: Text("RALLY ROUTE PLANNER (POINT A TO POINT B)")) {
                    HStack {
                        Image(systemName: "circle.circle.fill")
                            .foregroundColor(.green)
                        TextField("Point A (Departure)", text: $fromQuery)
                    }
                    
                    HStack {
                        Image(systemName: "mappin.circle.fill")
                            .foregroundColor(.red)
                        TextField("Point B (Destination)", text: $toQuery)
                    }
                    
                    Button(action: calculateCustomRoute) {
                        HStack {
                            Spacer()
                            if isCalculating {
                                ProgressView()
                                    .padding(.trailing, 8)
                            }
                            Text("CALCULATE & GENERATE ROADBOOK")
                                .font(.system(size: 13, weight: .black))
                                .foregroundColor(.white)
                            Spacer()
                        }
                        .padding(.vertical, 8)
                        .background(Color.orange)
                        .cornerRadius(8)
                    }
                    .disabled(isCalculating)
                }
                
                if let error = errorMessage {
                    Section {
                        Text(error)
                            .foregroundColor(.red)
                            .font(.caption)
                    }
                }
                
                Section(header: Text("DAKAR RALLY OFFICIAL STAGE PRESETS")) {
                    Button(action: loadIncaStage) {
                        VStack(alignment: .leading, spacing: 4) {
                            Text("INCA STAGE 01 (PERU DUNES)")
                                .font(.system(size: 14, weight: .black))
                                .foregroundColor(.primary)
                            Text("Exact 100% replica from Dakar official roadbook (Screenshot 4). Pisco sand dunes, WPC, WPS, CAP 286°, CAP 182°.")
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                    }
                    
                    Button(action: loadEmptyQuarterStage) {
                        VStack(alignment: .leading, spacing: 4) {
                            Text("DAKAR 2025 STAGE 5 (EMPTY QUARTER)")
                                .font(.system(size: 14, weight: .black))
                                .foregroundColor(.primary)
                            Text("Exact replica from Unik4 memo (Screenshot 1). Shubaytah dunes, notes 12-16, DZ 50 speed control zone, CP2.")
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                    }
                }
                
                Section(header: Text("REAL-TIME RACE CONTROLS")) {
                    Button(action: {
                        if locationService.telemetry.isSimulating {
                            locationService.stopSimulation()
                        } else {
                            locationService.startSimulation(coordinates: polylineCoordinates, speedMultiplier: 2.0)
                        }
                        dismiss()
                    }) {
                        HStack {
                            Image(systemName: locationService.telemetry.isSimulating ? "pause.fill" : "play.fill")
                            Text(locationService.telemetry.isSimulating ? "STOP RACE SIMULATION" : "START RACE SIMULATION (DRIVE ROUTE)")
                                .font(.system(size: 12, weight: .black))
                        }
                        .foregroundColor(locationService.telemetry.isSimulating ? .red : .blue)
                    }
                    
                    Button(action: {
                        locationService.startLiveTracking()
                        dismiss()
                    }) {
                        HStack {
                            Image(systemName: "location.fill")
                            Text("USE LIVE DEVICE GPS & CORE LOCATION")
                                .font(.system(size: 12, weight: .black))
                        }
                        .foregroundColor(.green)
                    }
                }
            }
            .navigationTitle("Dakar Navigation")
            .navigationBarItems(trailing: Button("Done") { dismiss() })
        }
    }
    
    private func loadIncaStage() {
        let (stage, coords) = AppleMapKitRouteEngine.loadIncaStage01()
        locationService.setStage(stage)
        polylineCoordinates = coords
        dismiss()
    }
    
    private func loadEmptyQuarterStage() {
        let (stage, coords) = AppleMapKitRouteEngine.loadEmptyQuarterStage()
        locationService.setStage(stage)
        polylineCoordinates = coords
        dismiss()
    }
    
    private func calculateCustomRoute() {
        isCalculating = true
        errorMessage = nil
        
        Task {
            do {
                // Determine source coordinates
                var sourceCoord = CLLocationCoordinate2D(latitude: locationService.telemetry.currentLatitude, longitude: locationService.telemetry.currentLongitude)
                
                if fromQuery.lowercased() != "current location" && !fromQuery.isEmpty {
                    let fromItems = try await AppleMapKitRouteEngine.shared.searchLocation(query: fromQuery)
                    guard let first = fromItems.first?.placemark.coordinate else {
                        throw NSError(domain: "Planner", code: 404, userInfo: [NSLocalizedDescriptionKey: "Could not find Point A: \(fromQuery)"])
                    }
                    sourceCoord = first
                }
                
                // Determine destination coordinates
                let toItems = try await AppleMapKitRouteEngine.shared.searchLocation(query: toQuery)
                guard let destCoord = toItems.first?.placemark.coordinate else {
                    throw NSError(domain: "Planner", code: 404, userInfo: [NSLocalizedDescriptionKey: "Could not find Point B: \(toQuery)"])
                }
                
                let (generatedStage, coords) = try await AppleMapKitRouteEngine.shared.generateRoadbook(
                    from: sourceCoord,
                    to: destCoord,
                    stageTitle: "\(fromQuery.uppercased()) TO \(toQuery.uppercased())"
                )
                
                await MainActor.run {
                    self.polylineCoordinates = coords
                    self.locationService.setStage(generatedStage)
                    self.isCalculating = false
                    self.dismiss()
                }
            } catch {
                await MainActor.run {
                    self.errorMessage = error.localizedDescription
                    self.isCalculating = false
                }
            }
        }
    }
}
