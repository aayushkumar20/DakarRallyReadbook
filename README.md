# 🏁 Dakar Rally ERTF Unik4 & FIA Digital Roadbook Navigation System

An authentic, 1:1 replica of the **Dakar Rally ERTF Unik4 GPS Navigation Instrument Cluster** and the official **FIA Dakar Digital Roadbook (3-Column layout with Tulip diagrams, CAP bearings, FIA symbol lexicon, and co-driver biffage)**, built with Apple MapKit and CoreLocation.

---

## 🌟 Key Features

### 1. ERTF Unik4 GPS Rallye Raid Replica (Screenshot 1)
- **Status Bar**: Live speed in km/h, satellite reception bell (`🔔`), battery/power status, validated waypoints count (`12 🟩`), target waypoint ID (`WPT 13 | B1`), and yellow compass CAP bearing box (`94° GPS`).
- **Dual Tripmasters / Odometers**:
  - `ODO total`: High-contrast bold LCD display (e.g. `29.82 km`), calibrated with `+0.10` / `-0.10` keys.
  - `ODO partiel`: High-contrast bold LCD display (e.g. `0.71 km`), resettable with the `TRIP RST` key.
- **DZ-FZ Speed Control Zone**:
  - Visual speed limit warning badge (`⚠️ 48 / MAX 50`).
  - Automatic buzzer / sound alarm when overspeeding in DZ zones.
- **Active Navigation Guidance**:
  - `CTW` (Cap to Waypoint): Bearing angle directly pointing to target waypoint.
  - Dynamic Steering Needle: Rotates relative to current vehicle heading to guide steering.
  - `DTW` (Distance to Waypoint): Distance in km countdown to waypoint.
  - Live GPS Coordinates: `Latitude`, `Longitude`, `Altitude (m)`, and `Slope Inclination (°)`.

### 2. FIA Digital Roadbook 3-Column Layout (Screenshots 1 & 4)
- **Column 1 — Distances**:
  - Total cumulative ODO (top large bold).
  - Partial distance (bottom).
  - Note sequence badge (`[1]`, `[2]`, `[12]`).
  - Waypoint type circles (`START`, `FINISH`, `WPC`, `WPS`, `WPM`, `DZ`, `FZ`, `CP`).
- **Column 2 — Diagramme Tulipe (Vector Tracks)**:
  - Vector trajectory arrows with forks, bends, hairpins, and crossroads.
  - Dashed track lines for off-track / hors-piste (`HP`).
  - Highlighted yellow box for compass heading (`CAP 87°`, `CAP 108°`, `CAP 286°`, etc.).
  - Contextual terrain text (`PLATEAU`, `SA`, `250m`, `TRACKS`).
- **Column 3 — Notes & FIA Symbol Lexicon**:
  - Dangers: `!` (Danger 1), `!!` (Danger 2), `!!!` (Danger 3).
  - Speed limits: Red circle `30`, `50`, finish slash.
  - Dakar terrain codes: `HP`, `SA`, `DN`, `DN L1`, `RIO`, `ORNI`, `OND`, `COMP`, `FOSS`, `PP`.
- **Co-driver Biffage**:
  - Automatic diagonal strikethrough slash across passed and validated notes, identical to Dakar co-drivers.
  - Tap any note to toggle biffage manually.

### 3. Apple MapKit & Live Navigation
- Full Apple Maps integration (`MKMapView` / `MapKit`).
- Satellite / Hybrid imagery for realistic desert rally raid experience.
- Real-time Point A to Point B routing: Calculates shortest rally distance between any two locations worldwide, extracts maneuvers, and dynamically compiles an authentic Dakar Roadbook!
- Preloaded official Dakar special stages:
  - **Inca Stage 01 (Peru Dunes)** — 100% replica from Dakar official roadbook (Screenshot 4).
  - **Dakar 2025 Stage 5 (Empty Quarter Chrono 48H)** — 100% replica from Unik4 memo (Screenshot 1).
  - **Al Ula to Yanbu Canyons**.
- Live GPS tracking via `CoreLocation` & `CLHeading`.
- Race Simulator: Simulated driving mode (1x, 2x, 5x) for testing without needing to physically drive.

### 4. Dakar ERTF Télécommande (Remote Control)
- `ESC`: Red button.
- `OK`: Green button (validates waypoint / toggles biffage).
- `STN`: Yellow button (Sentinel overtake horn alarm).
- `TRIP RST`: Magenta button (resets partial odometer).
- `+0.10` / `-0.10`: Calibrates total odometer.
- `NOTE +` / `NOTE -`: Advances or rewinds active roadbook note.

### 5. FIA Symbol Lexicon Dictionary (Screenshots 2 & 3)
- Built-in searchable lexicon covering all official Dakar symbols across Tracks, Elements, Areas, Safety, Waypoints, Directions, Electric, and Specificities with French & English descriptions.

---

## 🚀 Running the Project

### 📱 Native iOS App (Xcode / Swift / SwiftUI)
The project includes a ready-to-run Xcode project `DakarRallyApp.xcodeproj` built for iOS 17+.

```bash
# Open directly in Xcode
open DakarRallyApp.xcodeproj
```
Select your iOS Simulator (e.g. iPhone 17 or iPad) or plugged-in iPhone and hit **Run (⌘R)**.

To build via CLI:
```bash
xcodebuild -project DakarRallyApp.xcodeproj -scheme DakarRallyApp -destination 'platform=iOS Simulator,name=iPhone 17' build CODE_SIGN_IDENTITY="" CODE_SIGNING_REQUIRED=NO
```

### 💻 Web / Browser Companion
Run the interactive web version locally:
```bash
python3 -m http.server 8088 --directory web
```
Then visit `http://localhost:8088` in your browser.