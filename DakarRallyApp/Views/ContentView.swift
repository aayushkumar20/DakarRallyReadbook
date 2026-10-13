import SwiftUI
import CoreLocation
import MapKit
public enum DakarViewMode: String, CaseIterable {
    case split = "SPLIT"
    case unik4 = "UNIK4 GPS"
    case roadbook = "ROADBOOK"
    case appleMap = "APPLE MAP"
}
public struct ContentView: View {
    @StateObject private var locationService = LocationService()
    @ObservedObject private var localization = LocalizationManager.shared
    @State private var polylineCoordinates: [CLLocationCoordinate2D] = []
    @State private var viewMode: DakarViewMode = .split
    @State private var showRoutePlanner: Bool = false
    @State private var showLexicon: Bool = false
    @State private var showLanguagePicker: Bool = false
    @State private var showRemote: Bool = true
    @State private var selectedMapType: MKMapType = .hybrid
    public var body: some View {
        GeometryReader { geo in
            let isUnfoldedOrWide = geo.size.width >= 620 || geo.size.width > geo.size.height
            let isCompact = geo.size.width < 430
            VStack(spacing: 0) {
                HStack(spacing: isCompact ? 4 : 8) {
                    DakarLogoView(size: isCompact ? 22 : 26, showText: !isCompact)
                    Spacer(minLength: 2)
                    HStack(spacing: 2) {
                        ForEach(DakarViewMode.allCases, id: \.self) { mode in
                            Button(action: { viewMode = mode }) {
                                Text(modeLabel(for: mode, isCompact: isCompact))
                                    .font(.system(size: isCompact ? 8.5 : 9, weight: .black))
                                    .lineLimit(1)
                                    .minimumScaleFactor(0.7)
                                    .foregroundColor(viewMode == mode ? .black : .white)
                                    .padding(.horizontal, isCompact ? 5 : 7)
                                    .padding(.vertical, 5)
                                    .background(viewMode == mode ? Color(red: 1.0, green: 0.92, blue: 0.15) : Color(red: 0.2, green: 0.2, blue: 0.25))
                                    .cornerRadius(4)
                            }
                        }
                    }
                    Button(action: { showLanguagePicker = true }) {
                        Text(localization.currentLanguage.flag)
                            .font(.system(size: isCompact ? 11 : 13))
                            .padding(4)
                            .background(Color(red: 0.2, green: 0.2, blue: 0.25))
                            .cornerRadius(4)
                    }
                    Button(action: { showRoutePlanner = true }) {
                        Image(systemName: "arrow.triangle.turn.up.right.diamond.fill")
                            .font(.system(size: isCompact ? 12 : 14))
                            .foregroundColor(.white)
                            .padding(5)
                            .background(Color.blue)
                            .cornerRadius(4)
                    }
                    Button(action: { showLexicon = true }) {
                        Image(systemName: "book.fill")
                            .font(.system(size: isCompact ? 12 : 14))
                            .foregroundColor(.white)
                            .padding(5)
                            .background(Color.orange)
                            .cornerRadius(4)
                    }
                }
                .padding(.horizontal, 6)
                .padding(.vertical, 5)
                .background(Color(red: 0.08, green: 0.08, blue: 0.1))
                if locationService.telemetry.isSimulating {
                    HStack {
                        Image(systemName: "play.circle.fill")
                            .foregroundColor(.black)
                        Text("\(localization.localized("start_simulation")) — \(Int(locationService.telemetry.currentSpeedKmh)) KM/H")
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
                Group {
                    switch viewMode {
                    case .split:
                        if isUnfoldedOrWide {
                            HStack(spacing: 0) {
                                VStack(spacing: 0) {
                                    ScrollView {
                                        Unik4GPSView(locationService: locationService)
                                    }
                                    if showRemote {
                                        RemoteControlView(locationService: locationService)
                                    }
                                }
                                .frame(width: geo.size.width * 0.48)
                                Divider().background(Color.black)
                                RoadbookListView(locationService: locationService)
                                    .frame(width: geo.size.width * 0.52)
                            }
                        } else {
                            VStack(spacing: 0) {
                                Unik4GPSView(locationService: locationService)
                                    .frame(maxHeight: 250)
                                Divider().background(Color.black)
                                RoadbookListView(locationService: locationService)
                            }
                        }
                    case .unik4:
                        if isUnfoldedOrWide {
                            HStack(spacing: 0) {
                                VStack(spacing: 0) {
                                    ScrollView {
                                        Unik4GPSView(locationService: locationService)
                                    }
                                    if showRemote {
                                        RemoteControlView(locationService: locationService)
                                    }
                                }
                                .frame(width: geo.size.width * 0.48)
                                Divider().background(Color.black)
                                AppleMapViewRepresentable(
                                    locationService: locationService,
                                    polylineCoordinates: polylineCoordinates,
                                    mapType: .hybrid
                                )
                                .frame(width: geo.size.width * 0.52)
                            }
                        } else {
                            ScrollView {
                                VStack(spacing: 8) {
                                    Unik4GPSView(locationService: locationService)
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
                        }
                    case .roadbook:
                        RoadbookListView(locationService: locationService)
                    case .appleMap:
                        ZStack(alignment: .top) {
                            AppleMapViewRepresentable(
                                locationService: locationService,
                                polylineCoordinates: polylineCoordinates,
                                mapType: selectedMapType
                            )
                            .edgesIgnoringSafeArea(.all)
                            VStack(spacing: 6) {
                                HStack {
                                    VStack(alignment: .leading, spacing: 2) {
                                        Text("ODO \(String(format: "%.2f", locationService.telemetry.totalOdoKM)) km")
                                            .font(.system(size: 16, weight: .black, design: .monospaced))
                                            .foregroundColor(.white)
                                        Text("\(localization.localized("cap_gps")) \(Int(locationService.telemetry.currentHeadingDegrees))°")
                                            .font(.system(size: 12, weight: .black, design: .monospaced))
                                            .foregroundColor(Color(red: 1.0, green: 0.92, blue: 0.15))
                                    }
                                    .padding(8)
                                    .background(Color.black.opacity(0.85))
                                    .cornerRadius(6)
                                    Spacer()
                                    Button(action: { locationService.toggleSpeedUnit() }) {
                                        VStack(alignment: .trailing, spacing: 2) {
                                            Text("\(localization.localized("vitesse").uppercased()) \(Int(locationService.telemetry.currentSpeedInUnit)) \(locationService.telemetry.speedUnit.label)")
                                                .font(.system(size: 15, weight: .black, design: .monospaced))
                                                .foregroundColor(.white)
                                            Text("DTW \(String(format: "%.2f", locationService.telemetry.distanceToWaypointKM)) km")
                                                .font(.system(size: 12, weight: .black, design: .monospaced))
                                                .foregroundColor(.cyan)
                                        }
                                    }
                                    .padding(8)
                                    .background(Color.black.opacity(0.85))
                                    .cornerRadius(6)
                                }
                                HStack(spacing: 4) {
                                    Button(localization.localized("satellite")) { selectedMapType = .satellite }
                                        .font(.system(size: 9, weight: .black))
                                        .foregroundColor(selectedMapType == .satellite ? .black : .white)
                                        .padding(.horizontal, 8)
                                        .padding(.vertical, 5)
                                        .background(selectedMapType == .satellite ? Color(red: 1.0, green: 0.92, blue: 0.15) : Color.black.opacity(0.85))
                                        .cornerRadius(4)
                                    Button(localization.localized("terrain")) { selectedMapType = .hybrid }
                                        .font(.system(size: 9, weight: .black))
                                        .foregroundColor(selectedMapType == .hybrid ? .black : .white)
                                        .padding(.horizontal, 8)
                                        .padding(.vertical, 5)
                                        .background(selectedMapType == .hybrid ? Color(red: 1.0, green: 0.92, blue: 0.15) : Color.black.opacity(0.85))
                                        .cornerRadius(4)
                                    Button(localization.localized("streets")) { selectedMapType = .standard }
                                        .font(.system(size: 9, weight: .black))
                                        .foregroundColor(selectedMapType == .standard ? .black : .white)
                                        .padding(.horizontal, 8)
                                        .padding(.vertical, 5)
                                        .background(selectedMapType == .standard ? Color(red: 1.0, green: 0.92, blue: 0.15) : Color.black.opacity(0.85))
                                        .cornerRadius(4)
                                    Spacer()
                                    Text("\(localization.localized("chrono")) \(locationService.telemetry.formattedElapsedTime)")
                                        .font(.system(size: 10, weight: .black, design: .monospaced))
                                        .foregroundColor(Color(red: 1.0, green: 0.92, blue: 0.15))
                                        .padding(.horizontal, 6)
                                        .padding(.vertical, 4)
                                        .background(Color.black.opacity(0.85))
                                        .cornerRadius(4)
                                }
                                Spacer()
                            }
                            .padding(8)
                        }
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                if showRemote && !isUnfoldedOrWide {
                    RemoteControlView(locationService: locationService)
                }
            }
        }
        .onAppear {
            locationService.requestPermissions()
            locationService.startLiveTracking()
            if !localization.hasSelectedLanguage {
                showLanguagePicker = true
            }
        }
        .sheet(isPresented: $showLanguagePicker) {
            LanguageSelectionSheet()
        }
        .sheet(isPresented: $showRoutePlanner) {
            RoutePlannerSheet(locationService: locationService, polylineCoordinates: $polylineCoordinates)
        }
        .sheet(isPresented: $showLexicon) {
            LexiconReferenceSheet()
        }
    }
    private func modeLabel(for mode: DakarViewMode, isCompact: Bool) -> String {
        if isCompact {
            switch mode {
            case .split: return "SPLIT"
            case .unik4: return "UNIK4"
            case .roadbook: return "BOOK"
            case .appleMap: return "MAP"
            }
        } else {
            switch mode {
            case .split: return localization.localized("split")
            case .unik4: return localization.localized("unik4")
            case .roadbook: return localization.localized("roadbook")
            case .appleMap: return localization.localized("apple_map")
            }
        }
    }
}
