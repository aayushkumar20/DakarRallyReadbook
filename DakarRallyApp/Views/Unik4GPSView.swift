import SwiftUI
public struct Unik4GPSView: View {
    @ObservedObject var locationService: LocationService
    public init(locationService: LocationService) {
        self.locationService = locationService
    }
    public var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 6) {
                Text("🇫🇷")
                    .font(.system(size: 14))
                Text("MEMO GPS UNIK4 RALLYE RAID")
                    .font(.system(size: 10, weight: .black, design: .monospaced))
                    .foregroundColor(Color(red: 1.0, green: 0.92, blue: 0.15))
                Spacer()
                Text("AUTO/CAMION")
                    .font(.system(size: 9, weight: .bold))
                    .foregroundColor(.white)
                Circle()
                    .fill(locationService.telemetry.isGpsLocked ? Color.green : Color.red)
                    .frame(width: 8, height: 8)
                    .shadow(color: .green, radius: 2)
            }
            .padding(.horizontal, 10)
            .padding(.vertical, 4)
            .background(Color(red: 0.10, green: 0.10, blue: 0.12))
            HStack(alignment: .center, spacing: 6) {
                HStack(spacing: 4) {
                    Image(systemName: "bell.fill")
                        .font(.system(size: 12))
                        .foregroundColor(locationService.telemetry.isGpsLocked ? .black : .orange)
                    Image(systemName: "powerplug.fill")
                        .font(.system(size: 12))
                        .foregroundColor(.black)
                }
                .padding(.horizontal, 4)
                Button(action: { locationService.toggleSpeedUnit() }) {
                    VStack(alignment: .leading, spacing: -2) {
                        Text("Vitesse")
                            .font(.system(size: 8, weight: .medium))
                            .foregroundColor(.secondary)
                        HStack(alignment: .firstTextBaseline, spacing: 1) {
                            Text("\(Int(locationService.telemetry.currentSpeedInUnit))")
                                .font(.system(size: 22, weight: .black, design: .monospaced))
                                .foregroundColor(.black)
                            Text(locationService.telemetry.speedUnit.label)
                                .font(.system(size: 8, weight: .black))
                                .foregroundColor(.blue)
                        }
                    }
                }
                .frame(minWidth: 58)
                Spacer()
                VStack(spacing: 1) {
                    HStack(spacing: 2) {
                        Text("\(locationService.telemetry.validatedWaypointsCount)")
                            .font(.system(size: 15, weight: .black, design: .monospaced))
                        Image(systemName: "checkmark.square.fill")
                            .foregroundColor(.green)
                            .font(.system(size: 12))
                    }
                    Text("VALIDÉS")
                        .font(.system(size: 7, weight: .bold))
                        .foregroundColor(.secondary)
                }
                Divider().frame(height: 25)
                VStack(spacing: -1) {
                    HStack(spacing: 4) {
                        Text("WPT \(locationService.telemetry.targetWaypointNumber)")
                            .font(.system(size: 11, weight: .black))
                        Text(locationService.telemetry.targetWaypointCode)
                            .font(.system(size: 13, weight: .black, design: .monospaced))
                            .foregroundColor(.blue)
                    }
                    Text("POINT VISÉ")
                        .font(.system(size: 7, weight: .bold))
                        .foregroundColor(.secondary)
                }
                Spacer()
                VStack(spacing: -1) {
                    Text("\(Int(locationService.telemetry.currentHeadingDegrees))°")
                        .font(.system(size: 19, weight: .black, design: .monospaced))
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
            .padding(.vertical, 5)
            .background(Color.white)
            .border(Color.black, width: 1.5)
            HStack(spacing: 0) {
                VStack(alignment: .leading, spacing: 1) {
                    Text("ODO total")
                        .font(.system(size: 10, weight: .black))
                        .foregroundColor(Color.blue)
                    Text(String(format: "%.2f", locationService.telemetry.totalOdoKM))
                        .font(.system(size: 40, weight: .black, design: .monospaced))
                        .foregroundColor(.black)
                        .minimumScaleFactor(0.7)
                        .lineLimit(1)
                }
                .padding(.horizontal, 10)
                .padding(.vertical, 3)
                .frame(maxWidth: .infinity, alignment: .leading)
                Divider().frame(width: 2).background(Color.black)
                VStack(alignment: .leading, spacing: 1) {
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
                        .font(.system(size: 40, weight: .black, design: .monospaced))
                        .foregroundColor(.black)
                        .minimumScaleFactor(0.7)
                        .lineLimit(1)
                }
                .padding(.horizontal, 10)
                .padding(.vertical, 3)
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .background(Color(red: 0.94, green: 0.95, blue: 0.97))
            .border(Color.black, width: 1.5)
            HStack(spacing: 8) {
                HStack(spacing: 3) {
                    Image(systemName: "stopwatch.fill")
                        .font(.system(size: 9))
                        .foregroundColor(Color(red: 1.0, green: 0.92, blue: 0.15))
                    VStack(alignment: .leading, spacing: -1) {
                        Text("CHRONO")
                            .font(.system(size: 7, weight: .black))
                            .foregroundColor(.gray)
                        Text(locationService.telemetry.formattedElapsedTime)
                            .font(.system(size: 11, weight: .black, design: .monospaced))
                            .foregroundColor(.white)
                    }
                }
                Divider().frame(height: 18).background(Color.gray)
                VStack(alignment: .leading, spacing: -1) {
                    Text("V_MOY")
                        .font(.system(size: 7, weight: .black))
                        .foregroundColor(.gray)
                    Text(String(format: "%.1f %@", locationService.telemetry.averageSpeedInUnit, locationService.telemetry.speedUnit.label))
                        .font(.system(size: 10, weight: .bold, design: .monospaced))
                        .foregroundColor(Color(red: 1.0, green: 0.92, blue: 0.15))
                }
                Divider().frame(height: 18).background(Color.gray)
                VStack(alignment: .leading, spacing: -1) {
                    Text("V_MAX")
                        .font(.system(size: 7, weight: .black))
                        .foregroundColor(.gray)
                    Text("\(Int(locationService.telemetry.maxSpeedInUnit)) \(locationService.telemetry.speedUnit.label)")
                        .font(.system(size: 10, weight: .bold, design: .monospaced))
                        .foregroundColor(.white)
                }
                Spacer()
                VStack(alignment: .trailing, spacing: -1) {
                    Text("ETA FINISH")
                        .font(.system(size: 7, weight: .black))
                        .foregroundColor(.gray)
                    Text(locationService.telemetry.formattedETA)
                        .font(.system(size: 10, weight: .bold, design: .monospaced))
                        .foregroundColor(.cyan)
                }
                if locationService.telemetry.penaltySeconds > 0 {
                    Text("+\(locationService.telemetry.penaltySeconds)s")
                        .font(.system(size: 8, weight: .black))
                        .foregroundColor(.white)
                        .padding(.horizontal, 4)
                        .padding(.vertical, 2)
                        .background(Color.red)
                        .cornerRadius(3)
                }
            }
            .padding(.horizontal, 10)
            .padding(.vertical, 4)
            .background(Color(red: 0.08, green: 0.08, blue: 0.10))
            .border(Color.black, width: 1.5)
            HStack(spacing: 8) {
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
                    .padding(.vertical, 3)
                    .background(locationService.telemetry.isSpeedExceeded ? Color.red.opacity(0.2) : Color.white)
                    .border(Color.red, width: 2)
                }
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
                VStack(alignment: .trailing, spacing: -2) {
                    Text("DTW (Distance)")
                        .font(.system(size: 8, weight: .bold))
                        .foregroundColor(.blue)
                    HStack(alignment: .firstTextBaseline, spacing: 2) {
                        Text(String(format: "%.2f", locationService.telemetry.distanceToWaypointKM))
                            .font(.system(size: 22, weight: .black, design: .monospaced))
                            .foregroundColor(.blue)
                        Text("km")
                            .font(.system(size: 9, weight: .bold))
                            .foregroundColor(.blue)
                    }
                }
            }
            .padding(.horizontal, 10)
            .padding(.vertical, 5)
            .background(Color.white)
            .border(Color.black, width: 1.5)
            HStack {
                Text("NEXT \(String(format: "%.2f", locationService.telemetry.distanceToWaypointKM))")
                    .font(.system(size: 9, weight: .black, design: .monospaced))
                Spacer()
                Text(locationService.activeStage?.stageCode ?? "DAKAR SPECIAL STAGE")
                    .font(.system(size: 8.5, weight: .bold))
                    .foregroundColor(.secondary)
                Spacer()
                Text("Cap \(Int(locationService.telemetry.capToWaypointDegrees))°")
                    .font(.system(size: 9, weight: .black, design: .monospaced))
            }
            .padding(.horizontal, 10)
            .padding(.vertical, 3)
            .background(Color(red: 0.95, green: 0.95, blue: 0.95))
            .border(Color.black, width: 1)
            HStack(spacing: 12) {
                HStack(spacing: 4) {
                    Text("GPS:")
                        .font(.system(size: 9, weight: .black))
                        .foregroundColor(.gray)
                    Text(String(format: "%.4f°, %.4f°", locationService.telemetry.currentLatitude, locationService.telemetry.currentLongitude))
                        .font(.system(size: 9, weight: .bold, design: .monospaced))
                        .foregroundColor(.white)
                }
                Spacer()
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
            .padding(.vertical, 3)
            .background(Color(red: 0.14, green: 0.14, blue: 0.16))
        }
        .background(Color.black)
        .border(Color.black, width: 2)
    }
}
