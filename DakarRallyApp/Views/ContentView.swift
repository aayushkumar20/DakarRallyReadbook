import SwiftUI
import CoreLocation

public enum DakarViewMode: String, CaseIterable {
    case split = "SPLIT"
    case unik4 = "UNIK4 GPS"
    case roadbook = "ROADBOOK"
    case appleMap = "APPLE MAP"
}

public struct ContentView: View {
    @StateObject private var locationService = LocationService()
    @State private var polylineCoordinates: [CLLocationCoordinate2D] = []
    @State private var viewMode: DakarViewMode = .split
    @State private var showRoutePlanner: Bool = false
    @State private var showLexicon: Bool = false
    @State private var showRemote: Bool = true
    
    public var body: some View {
        VStack(spacing: 0) {
            // Top Cockpit Bar
            HStack(spacing: 8) {
                // Official Dakar Tuareg Brand Logo
                DakarLogoView(size: 26, showText: true)
                
                Spacer()
                
                // View Mode Picker
                HStack(spacing: 2) {
                    ForEach(DakarViewMode.allCases, id: \.self) { mode in
                        Button(action: { viewMode = mode }) {
                            Text(mode.rawValue)
                                .font(.system(size: 9, weight: .black))
                                .foregroundColor(viewMode == mode ? .black : .white)
                                .padding(.horizontal, 6)
                                .padding(.vertical, 4)
                                .background(viewMode == mode ? Color(red: 1.0, green: 0.92, blue: 0.15) : Color(red: 0.2, green: 0.2, blue: 0.25))
                                .cornerRadius(4)
                        }
                    }
                }
                
                // Route Search Button
                Button(action: { showRoutePlanner = true }) {
                    Image(systemName: "arrow.triangle.turn.up.right.diamond.fill")
                        .font(.system(size: 14))
                        .foregroundColor(.white)
                        .padding(5)
                        .background(Color.blue)
                        .cornerRadius(4)
                }
                
                // Lexicon Reference Button
                Button(action: { showLexicon = true }) {
                    Image(systemName: "book.fill")
                        .font(.system(size: 14))
                        .foregroundColor(.white)
                        .padding(5)
                        .background(Color.orange)
                        .cornerRadius(4)
                }
            }
            .padding(.horizontal, 8)
            .padding(.vertical, 6)
            .background(Color(red: 0.08, green: 0.08, blue: 0.1))
            
            // Simulation Active Warning Banner
            if locationService.telemetry.isSimulating {
                HStack {
                    Image(systemName: "play.circle.fill")
                        .foregroundColor(.black)
                    Text("DAKAR RACE SIMULATION ACTIVE — \(Int(locationService.telemetry.currentSpeedKmh)) KM/H")
                        .font(.system(size: 10, weight: .black))
                        .foregroundColor(.black)
                    Spacer()
                    Button(action: { locationService.stopSimulation() }) {
                        Text("STOP")
                            .font(.system(size: 9, weight: .black))
                            .foregroundColor(.white)
                            .padding(.horizontal, 6)
                            .padding(.vertical, 2)
                            .background(Color.black)
                            .cornerRadius(3)
                    }
                }
                .padding(.horizontal, 10)
                .padding(.vertical, 4)
                .background(Color(red: 1.0, green: 0.92, blue: 0.15))
            }
            
            // MAIN VIEWPORT CONTENT
            Group {
                switch viewMode {
                case .split:
                    VStack(spacing: 0) {
                        Unik4GPSView(locationService: locationService)
                            .frame(maxHeight: 250)
                        
                        Divider().background(Color.black)
                        
                        RoadbookListView(locationService: locationService)
                    }
                    
                case .unik4:
                    ScrollView {
                        VStack(spacing: 8) {
                            Unik4GPSView(locationService: locationService)
                            
                            // Map Preview underneath
                            AppleMapViewRepresentable(
                                locationService: locationService,
                                polylineCoordinates: polylineCoordinates,
                                mapType: .hybrid
                            )
                            .frame(height: 280)
                            .border(Color.black, width: 2)
                            .padding(8)
                        }
                    }
                    
                case .roadbook:
                    RoadbookListView(locationService: locationService)
                    
                case .appleMap:
                    ZStack(alignment: .top) {
                        AppleMapViewRepresentable(
                            locationService: locationService,
                            polylineCoordinates: polylineCoordinates,
                            mapType: .hybrid
                        )
                        .edgesIgnoringSafeArea(.all)
                        
                        // Floating Unik4 Minimal HUD
                        VStack {
                            HStack {
                                VStack(alignment: .leading, spacing: 2) {
                                    Text("ODO \(String(format: "%.2f", locationService.telemetry.totalOdoKM)) km")
                                        .font(.system(size: 16, weight: .black, design: .monospaced))
                                        .foregroundColor(.white)
                                    Text("CAP \(Int(locationService.telemetry.currentHeadingDegrees))°")
                                        .font(.system(size: 12, weight: .black, design: .monospaced))
                                        .foregroundColor(Color(red: 1.0, green: 0.92, blue: 0.15))
                                }
                                .padding(8)
                                .background(Color.black.opacity(0.85))
                                .cornerRadius(6)
                                
                                Spacer()
                                
                                VStack(alignment: .trailing, spacing: 2) {
                                    Text("SPEED \(Int(locationService.telemetry.currentSpeedKmh)) km/h")
                                        .font(.system(size: 16, weight: .black, design: .monospaced))
                                        .foregroundColor(.white)
                                    Text("DTW \(String(format: "%.2f", locationService.telemetry.distanceToWaypointKM)) km")
                                        .font(.system(size: 12, weight: .black, design: .monospaced))
                                        .foregroundColor(.cyan)
                                }
                                .padding(8)
                                .background(Color.black.opacity(0.85))
                                .cornerRadius(6)
                            }
                            .padding(8)
                            Spacer()
                        }
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            // BOTTOM REMOTE CONTROL
            if showRemote {
                RemoteControlView(locationService: locationService)
            }
        }
        .onAppear {
            locationService.requestPermissions()
            // Default load Inca Stage 01 (Screenshot 4)
            let (stage, coords) = AppleMapKitRouteEngine.loadIncaStage01()
            locationService.setStage(stage)
            self.polylineCoordinates = coords
        }
        .sheet(isPresented: $showRoutePlanner) {
            RoutePlannerSheet(locationService: locationService, polylineCoordinates: $polylineCoordinates)
        }
        .sheet(isPresented: $showLexicon) {
            LexiconReferenceSheet()
        }
    }
}
