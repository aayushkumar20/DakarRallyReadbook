import SwiftUI

public struct Unik4GPSView: View {
    @ObservedObject var locationService: LocationService
    
    public init(locationService: LocationService) {
        self.locationService = locationService
    }
    
    public var body: some View {
        VStack(spacing: 0) {
            // UNIK4 Rugged Hardware Bezel Top Banner
            HStack {
                Text("ERTF UNIK4")
                    .font(.system(size: 11, weight: .black, design: .monospaced))
                    .foregroundColor(Color(red: 1.0, green: 0.92, blue: 0.15))
                Spacer()
                Text("RALLYE RAID GPS - FIA 2025")
                    .font(.system(size: 10, weight: .bold))
                    .foregroundColor(.gray)
                Spacer()
                // Power Indicator
                Circle()
                    .fill(locationService.telemetry.isGpsLocked ? Color.green : Color.red)
                    .frame(width: 8, height: 8)
            }
            .padding(.horizontal, 10)
            .padding(.vertical, 4)
            .background(Color(red: 0.12, green: 0.12, blue: 0.14))
            
            // SCREEN TOP STATUS BAR (Screenshot 1: Ecran général de navigation)
            HStack(alignment: .center, spacing: 6) {
                // Bell (Satellite lock) & Power plug
                HStack(spacing: 4) {
                    Image(systemName: "bell.fill")
                        .font(.system(size: 12))
                        .foregroundColor(locationService.telemetry.isGpsLocked ? .black : .orange)
                    Image(systemName: "powerplug.fill")
                        .font(.system(size: 12))
                        .foregroundColor(.black)
                }
                .padding(.horizontal, 4)
                
                // Speed: e.g. 78 km/h
                VStack(alignment: .leading, spacing: -2) {
                    Text("Vitesse")
                        .font(.system(size: 8, weight: .medium))
                        .foregroundColor(.secondary)
                    HStack(alignment: .firstTextBaseline, spacing: 1) {
                        Text("\(Int(locationService.telemetry.currentSpeedKmh))")
                            .font(.system(size: 20, weight: .black, design: .monospaced))
                        Text("km/h")
                            .font(.system(size: 8, weight: .bold))
                    }
                }
                .frame(minWidth: 55)
                
                Spacer()
                
                // Validated waypoints count badge (e.g. 12 🟩)
                VStack(spacing: 1) {
                    HStack(spacing: 2) {
                        Text("\(locationService.telemetry.validatedWaypointsCount)")
                            .font(.system(size: 14, weight: .black, design: .monospaced))
                        Image(systemName: "checkmark.square.fill")
                            .foregroundColor(.green)
                            .font(.system(size: 12))
                    }
                    Text("VALIDÉS")
                        .font(.system(size: 7, weight: .bold))
                        .foregroundColor(.secondary)
                }
                
                Divider().frame(height: 25)
                
                // Target Waypoint # and Name (e.g. WPT 13 | B1)
                VStack(spacing: -1) {
                    HStack(spacing: 4) {
                        Text("WPT \(locationService.telemetry.targetWaypointNumber)")
                            .font(.system(size: 11, weight: .black))
                        Text(locationService.telemetry.targetWaypointCode)
                            .font(.system(size: 12, weight: .black, design: .monospaced))
                            .foregroundColor(.blue)
                    }
                    Text("WAYPOINT VISÉ")
                        .font(.system(size: 7, weight: .bold))
                        .foregroundColor(.secondary)
                }
                
                Spacer()
                
                // Cap suivi (Current heading e.g. 94° GPS)
                VStack(spacing: -1) {
                    Text("\(Int(locationService.telemetry.currentHeadingDegrees))°")
                        .font(.system(size: 18, weight: .black, design: .monospaced))
                        .foregroundColor(.black)
                        .padding(.horizontal, 6)
                        .padding(.vertical, 1)
                        .background(Color(red: 1.0, green: 0.92, blue: 0.15))
                        .border(Color.black, width: 1.2)
                    Text("CAP GPS")
                        .font(.system(size: 7, weight: .black))
                        .foregroundColor(.black)
                }
            }
            .padding(.horizontal, 8)
            .padding(.vertical, 6)
            .background(Color.white)
            .border(Color.black, width: 1.5)
            
            // DUAL TRIPMASTERS / ODOS (ODO total & ODO partiel)
            HStack(spacing: 0) {
                // Left: ODO TOTAL (e.g. 29.82 km)
                VStack(alignment: .leading, spacing: 2) {
                    Text("ODO total")
                        .font(.system(size: 10, weight: .black))
                        .foregroundColor(Color.blue)
                    Text(String(format: "%.2f", locationService.telemetry.totalOdoKM))
                        .font(.system(size: 38, weight: .black, design: .monospaced))
                        .foregroundColor(.black)
                        .minimumScaleFactor(0.7)
                        .lineLimit(1)
                }
                .padding(.horizontal, 10)
                .padding(.vertical, 4)
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Divider().frame(width: 2).background(Color.black)
                
                // Right: ODO PARTIEL (e.g. 0.71 km)
                VStack(alignment: .leading, spacing: 2) {
                    HStack {
                        Text("ODO partiel")
                            .font(.system(size: 10, weight: .black))
                            .foregroundColor(Color.blue)
                        Spacer()
                        Button(action: { locationService.resetPartialOdo() }) {
                            Text("RST")
                                .font(.system(size: 9, weight: .black))
                                .foregroundColor(.white)
                                .padding(.horizontal, 4)
                                .padding(.vertical, 2)
                                .background(Color.red)
                                .cornerRadius(3)
                        }
                    }
                    Text(String(format: "%.2f", locationService.telemetry.partialOdoKM))
                        .font(.system(size: 38, weight: .black, design: .monospaced))
                        .foregroundColor(.black)
                        .minimumScaleFactor(0.7)
                        .lineLimit(1)
                }
                .padding(.horizontal, 10)
                .padding(.vertical, 4)
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .background(Color(red: 0.94, green: 0.95, blue: 0.97))
            .border(Color.black, width: 1.5)
            
            // SPEED ZONE LIMIT (DZ-FZ) & WAYPOINT STEERING GUIDANCE (Screenshot 1 Bottom)
            HStack(spacing: 8) {
                // Speed Limit Warning (DZ-FZ)
                if let limit = locationService.telemetry.activeSpeedLimit {
                    HStack(spacing: 4) {
                        Image(systemName: "exclamationmark.triangle.fill")
                            .foregroundColor(locationService.telemetry.isSpeedExceeded ? .red : .yellow)
                            .font(.system(size: 18))
                        VStack(spacing: -1) {
                            Text("\(Int(locationService.telemetry.currentSpeedKmh))")
                                .font(.system(size: 16, weight: .black))
                                .foregroundColor(locationService.telemetry.isSpeedExceeded ? .red : .black)
                            Text("MAX \(limit)")
                                .font(.system(size: 8, weight: .bold))
                                .foregroundColor(.red)
                        }
                    }
                    .padding(.horizontal, 6)
                    .padding(.vertical, 4)
                    .background(locationService.telemetry.isSpeedExceeded ? Color.red.opacity(0.2) : Color.white)
                    .border(Color.red, width: 2)
                }
                
                // Steering Arrow Pointer towards Waypoint (Relative deviation)
                HStack(spacing: 6) {
                    Image(systemName: "arrow.up")
                        .font(.system(size: 22, weight: .black))
                        .foregroundColor(.blue)
                        .rotationEffect(.degrees(locationService.telemetry.relativeBearingDegrees))
                    
                    VStack(alignment: .leading, spacing: -2) {
                        Text("CTW (Cap visé)")
                            .font(.system(size: 8, weight: .bold))
                            .foregroundColor(.secondary)
                        Text("\(Int(locationService.telemetry.capToWaypointDegrees))°")
                            .font(.system(size: 16, weight: .black, design: .monospaced))
                            .foregroundColor(.black)
                            .padding(.horizontal, 4)
                            .background(Color(red: 1.0, green: 0.92, blue: 0.15))
                    }
                }
                
                Spacer()
                
                // DTW (Distance to Waypoint)
                VStack(alignment: .trailing, spacing: -2) {
                    Text("DTW (Distance)")
                        .font(.system(size: 8, weight: .bold))
                        .foregroundColor(.blue)
                    HStack(alignment: .firstTextBaseline, spacing: 2) {
                        Text(String(format: "%.2f", locationService.telemetry.distanceToWaypointKM))
                            .font(.system(size: 20, weight: .black, design: .monospaced))
                            .foregroundColor(.blue)
                        Text("km")
                            .font(.system(size: 9, weight: .bold))
                            .foregroundColor(.blue)
                    }
                }
            }
            .padding(.horizontal, 10)
            .padding(.vertical, 6)
            .background(Color.white)
            .border(Color.black, width: 1.5)
            
            // LIVE GPS TELEMETRY STATUS BAR (Latitude, Longitude, Altitude, Pitch)
            HStack(spacing: 12) {
                // Coordinates
                HStack(spacing: 4) {
                    Text("GPS:")
                        .font(.system(size: 9, weight: .black))
                        .foregroundColor(.gray)
                    Text(String(format: "%.4f°, %.4f°", locationService.telemetry.currentLatitude, locationService.telemetry.currentLongitude))
                        .font(.system(size: 9, weight: .bold, design: .monospaced))
                        .foregroundColor(.white)
                }
                
                Spacer()
                
                // Elevation & Pitch
                HStack(spacing: 6) {
                    Text("ALT:")
                        .font(.system(size: 9, weight: .black))
                        .foregroundColor(.gray)
                    Text("\(Int(locationService.telemetry.currentAltitudeMeters))m")
                        .font(.system(size: 9, weight: .bold, design: .monospaced))
                        .foregroundColor(Color(red: 1.0, green: 0.92, blue: 0.15))
                    
                    Text("SLOPE:")
                        .font(.system(size: 9, weight: .black))
                        .foregroundColor(.gray)
                    Text(String(format: "%.1f°", locationService.telemetry.currentPitchDegrees))
                        .font(.system(size: 9, weight: .bold, design: .monospaced))
                        .foregroundColor(.white)
                }
            }
            .padding(.horizontal, 10)
            .padding(.vertical, 4)
            .background(Color(red: 0.15, green: 0.15, blue: 0.17))
        }
        .background(Color.black)
        .border(Color.black, width: 2)
    }
}
