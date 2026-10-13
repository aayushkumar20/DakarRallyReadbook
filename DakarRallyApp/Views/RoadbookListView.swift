import SwiftUI

public struct RoadbookListView: View {
    @ObservedObject var locationService: LocationService
    
    public init(locationService: LocationService) {
        self.locationService = locationService
    }
    
    public var body: some View {
        VStack(spacing: 0) {
            // Roadbook Stage Header (Screenshot 4: Inca stage 01 | DST: 163 km WP: 56 CP: 2)
            if let stage = locationService.activeStage {
                HStack {
                    Text(stage.title)
                        .font(.system(size: 14, weight: .black))
                        .textCase(.uppercase)
                    Spacer()
                    HStack(spacing: 8) {
                        Text("DST: \(String(format: "%.1f", stage.totalDistanceKM)) km")
                            .font(.system(size: 11, weight: .bold, design: .monospaced))
                        Text("WP: \(stage.waypointCount)")
                            .font(.system(size: 11, weight: .bold, design: .monospaced))
                        Text("CP: \(stage.controlPointCount)")
                            .font(.system(size: 11, weight: .bold, design: .monospaced))
                    }
                }
                .padding(.horizontal, 10)
                .padding(.vertical, 6)
                .background(Color.white)
                .border(Color.black, width: 2)
            }
            
            // Notes List ScrollView
            ScrollViewReader { proxy in
                ScrollView {
                    LazyVStack(spacing: 0) {
                        if let stage = locationService.activeStage {
                            ForEach(stage.notes) { note in
                                RoadbookRowView(
                                    note: note,
                                    isCurrent: note.id == locationService.telemetry.targetWaypointNumber,
                                    onTap: {
                                        locationService.toggleBiffage(for: note.id - 1)
                                    }
                                )
                                .id(note.id)
                            }
                        } else {
                            VStack(spacing: 8) {
                                Text("NO STAGE LOADED")
                                    .font(.headline)
                                    .foregroundColor(.secondary)
                                Text("Select or generate a route to view the digital roadbook.")
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                            }
                            .padding(.vertical, 40)
                        }
                    }
                }
                .onChange(of: locationService.telemetry.currentNoteIndex) { newIndex in
                    if let stage = locationService.activeStage, stage.notes.indices.contains(newIndex) {
                        withAnimation {
                            proxy.scrollTo(stage.notes[newIndex].id, anchor: .center)
                        }
                    }
                }
            }
        }
        .background(Color(red: 0.95, green: 0.95, blue: 0.95))
    }
}

public struct RoadbookRowView: View {
    public let note: RoadbookNote
    public let isCurrent: Bool
    public let onTap: () -> Void
    
    public var body: some View {
        ZStack {
            // Main 3-column row
            HStack(spacing: 0) {
                // COLUMN 1: DISTANCE (Total ODO, Partial ODO, Note # Badge, Validation Badge)
                VStack(alignment: .trailing, spacing: 0) {
                    // Total ODO (Top bold)
                    Text(String(format: "%.2f", note.totalKM))
                        .font(.system(size: 24, weight: .black, design: .monospaced))
                        .foregroundColor(.black)
                        .padding(.top, 4)
                        .padding(.trailing, 6)
                    
                    Spacer()
                    
                    // Note Sequence Badge + Partial ODO
                    HStack(alignment: .bottom, spacing: 4) {
                        // Black sequence box e.g. [12]
                        Text("\(note.id)")
                            .font(.system(size: 12, weight: .black))
                            .foregroundColor(.white)
                            .padding(.horizontal, 6)
                            .padding(.vertical, 2)
                            .background(isCurrent ? Color.blue : Color.black)
                            .cornerRadius(2)
                        
                        // Partial ODO
                        Text(String(format: "%.2f", note.partialKM))
                            .font(.system(size: 15, weight: .bold, design: .monospaced))
                            .foregroundColor(.black)
                    }
                    .padding(.bottom, 4)
                    .padding(.trailing, 6)
                }
                .frame(width: 105, height: 95)
                .background(isCurrent ? Color(red: 0.9, green: 0.95, blue: 1.0) : Color.white)
                .border(Color.black, width: 1.5)
                
                // COLUMN 2: TULIP DIAGRAM (Vector arrow & CAP heading in yellow)
                TulipVectorView(tulip: note.tulip, isHighlighted: isCurrent, noteId: note.id)
                    .frame(width: 110, height: 95)
                    .border(Color.black, width: 1.5)
                
                // COLUMN 3: FIA LEXICON & DANGERS (!, !!, !!!, DZ, FZ, TERRAIN)
                FIASymbolView(
                    danger: note.danger,
                    speedLimit: note.speedLimit,
                    waypointType: note.waypointType,
                    lexiconCodes: note.lexiconCodes,
                    textComment: note.textComment
                )
                .frame(maxWidth: .infinity, maxHeight: 95)
                .border(Color.black, width: 1.5)
            }
            .contentShape(Rectangle())
            .onTapGesture {
                onTap()
            }
            
            // BIFFAGE OVERLAY (Diagonal Strikethrough Line when note is crossed out / validated)
            if note.isBiffed {
                GeometryReader { geo in
                    Path { path in
                        path.move(to: CGPoint(x: 0, y: geo.size.height))
                        path.addLine(to: CGPoint(x: geo.size.width, y: 0))
                    }
                    .stroke(Color.black.opacity(0.85), lineWidth: 3.5)
                }
                .allowsHitTesting(false)
            }
        }
        .frame(height: 95)
        .overlay(
            Rectangle()
                .stroke(isCurrent ? Color.blue : Color.clear, lineWidth: 3)
        )
    }
}
