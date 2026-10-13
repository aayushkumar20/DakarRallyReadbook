import SwiftUI
import MapKit
public struct RoutePlannerSheet: View {
    @ObservedObject var locationService: LocationService
    @Binding var polylineCoordinates: [CLLocationCoordinate2D]
    @Environment(\.dismiss) var dismiss
    @State private var fromQuery: String = ""
    @State private var toQuery: String = ""
    @State private var isCalculating: Bool = false
    @State private var errorMessage: String? = nil
    @State private var availableRoutes: [RallyRouteOption] = []
    @State private var selectedRouteIndex: Int = 0
    @State private var resolvedSourceCoord: CLLocationCoordinate2D? = nil
    @State private var resolvedDestCoord: CLLocationCoordinate2D? = nil
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
                        TextField("Point A (Departure or empty for GPS)", text: $fromQuery)
                    }
                    HStack {
                        Image(systemName: "mappin.circle.fill")
                            .foregroundColor(.red)
                        TextField("Point B (Destination)", text: $toQuery)
                    }
                    Button(action: findAlternativeRoutes) {
                        HStack {
                            Spacer()
                            if isCalculating {
                                ProgressView()
                                    .padding(.trailing, 8)
                            }
                            Text("FIND ALL ALTERNATIVE ROUTES")
                                .font(.system(size: 13, weight: .black))
                                .foregroundColor(.white)
                            Spacer()
                        }
                        .padding(.vertical, 8)
                        .background(Color.blue)
                        .cornerRadius(8)
                    }
                    .disabled(isCalculating || toQuery.trimmingCharacters(in: .whitespaces).isEmpty)
                }
                if !availableRoutes.isEmpty {
                    Section(header: Text("SELECT PREFERRED ROUTE (ALTERNATE PATHS)")) {
                        ForEach(availableRoutes.indices, id: \.self) { idx in
                            let opt = availableRoutes[idx]
                            HStack {
                                VStack(alignment: .leading, spacing: 3) {
                                    Text(opt.name)
                                        .font(.system(size: 13, weight: .black))
                                        .foregroundColor(selectedRouteIndex == idx ? .orange : .primary)
                                    Text("\(String(format: "%.1f", opt.distanceKM)) km • Approx \(Int(opt.expectedDurationMinutes)) min")
                                        .font(.system(size: 11))
                                        .foregroundColor(.secondary)
                                }
                                Spacer()
                                if selectedRouteIndex == idx {
                                    Image(systemName: "checkmark.circle.fill")
                                        .foregroundColor(.orange)
                                        .font(.system(size: 20))
                                } else {
                                    Image(systemName: "circle")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 20))
                                }
                            }
                            .contentShape(Rectangle())
                            .onTapGesture {
                                selectedRouteIndex = idx
                            }
                        }
                        Button(action: generateSelectedRoadbook) {
                            HStack {
                                Spacer()
                                Text("⚡ GENERATE ROADBOOK FOR SELECTED ROUTE")
                                    .font(.system(size: 13, weight: .black))
                                    .foregroundColor(.white)
                                Spacer()
                            }
                            .padding(.vertical, 10)
                            .background(Color.orange)
                            .cornerRadius(8)
                        }
                    }
                }
                if let error = errorMessage {
                    Section {
                        Text(error)
                            .foregroundColor(.red)
                            .font(.caption)
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
            .navigationTitle("Dakar Route Planner")
            .navigationBarItems(trailing: Button("Done") { dismiss() })
        }
    }
    private func findAlternativeRoutes() {
        isCalculating = true
        errorMessage = nil
        availableRoutes = []
        Task {
            do {
                var sourceCoord = CLLocationCoordinate2D(latitude: locationService.telemetry.currentLatitude, longitude: locationService.telemetry.currentLongitude)
                if !fromQuery.trimmingCharacters(in: .whitespaces).isEmpty && fromQuery.lowercased() != "current location" {
                    let fromItems = try await AppleMapKitRouteEngine.shared.searchLocation(query: fromQuery)
                    guard let first = fromItems.first?.placemark.coordinate else {
                        throw NSError(domain: "Planner", code: 404, userInfo: [NSLocalizedDescriptionKey: "Could not find Point A: \(fromQuery)"])
                    }
                    sourceCoord = first
                }
                let toItems = try await AppleMapKitRouteEngine.shared.searchLocation(query: toQuery)
                guard let destCoord = toItems.first?.placemark.coordinate else {
                    throw NSError(domain: "Planner", code: 404, userInfo: [NSLocalizedDescriptionKey: "Could not find Point B: \(toQuery)"])
                }
                let options = try await AppleMapKitRouteEngine.shared.calculateAlternativeRoutes(from: sourceCoord, to: destCoord)
                await MainActor.run {
                    self.resolvedSourceCoord = sourceCoord
                    self.resolvedDestCoord = destCoord
                    self.availableRoutes = options
                    self.selectedRouteIndex = 0
                    self.isCalculating = false
                }
            } catch {
                await MainActor.run {
                    self.errorMessage = error.localizedDescription
                    self.isCalculating = false
                }
            }
        }
    }
    private func generateSelectedRoadbook() {
        guard let source = resolvedSourceCoord, let dest = resolvedDestCoord else { return }
        isCalculating = true
        Task {
            do {
                let fromTitle = fromQuery.isEmpty ? "CURRENT GPS" : fromQuery.uppercased()
                let toTitle = toQuery.uppercased()
                let (generatedStage, coords) = try await AppleMapKitRouteEngine.shared.generateRoadbook(
                    from: source,
                    to: dest,
                    stageTitle: "\(fromTitle) TO \(toTitle)",
                    routeIndex: selectedRouteIndex
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
