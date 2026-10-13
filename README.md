# 🏁 Dakar Rally ERTF Unik4 & FIA Digital Roadbook Navigation System

An authentic replica of the **Dakar Rally ERTF Unik4 GPS Navigation Instrument Cluster** and the official **FIA Dakar Digital Roadbook (3-Column layout with Tulip diagrams, CAP bearings, FIA symbol lexicon, and co-driver biffage)**, built with Apple MapKit and CoreLocation.

---

## 🌟 Key Features

### 1. ERTF Unik4 GPS Rallye Raid Instrument
- **Status Bar**: Live speed in km/h or mph with unit toggle, satellite reception bell, battery/power status, validated waypoints count, target waypoint ID, and yellow compass CAP bearing box.
- **Dual Tripmasters / Odometers**:
  - `ODO total`: High-contrast bold LCD display, calibrated with `+0.10` / `-0.10` keys.
  - `ODO partiel`: High-contrast bold LCD display, resettable with the `TRIP RST` key.
- **Competition Chronometer & Speed Telemetry**:
  - `CHRONO`: Live elapsed race timer.
  - `V_MOY`: Average speed.
  - `V_MAX`: Maximum top speed reached.
  - `ETA FINISH`: Estimated arrival calculation.
- **DZ-FZ Speed Control Zone**:
  - Visual speed limit warning badge (`⚠️ MAX 50`).
  - Automatic buzzer / sound alarm when overspeeding in DZ zones.
- **Active Navigation Guidance**:
  - `CTW` (Cap to Waypoint): Bearing angle directly pointing to target waypoint.
  - Dynamic Steering Needle: Rotates relative to current vehicle heading to guide steering.
  - `DTW` (Distance to Waypoint): Distance in km countdown to waypoint.
  - Live GPS Coordinates: `Latitude`, `Longitude`, `Altitude (m)`, and `Slope Inclination (°)`.

### 2. FIA Digital Roadbook 3-Column Layout
- **Column 1 — Distances**:
  - Total cumulative ODO.
  - Partial distance.
  - Note sequence badge.
  - Waypoint type indicators (`START`, `FINISH`, `WPC`, `WPS`, `WPM`, `DZ`, `FZ`, `CP`).
- **Column 2 — Diagramme Tulipe (Vector Tracks)**:
  - Vector trajectory arrows with forks, bends, hairpins, and crossroads.
  - Shaded dune landform contours and crossing dune ridges.
  - Dashed track lines for off-track / hors-piste (`HP`).
  - Secondary branch annotations (e.g. `G^D`).
  - Highlighted yellow box for compass heading (`CAP`).
- **Column 3 — Notes & FIA Symbol Lexicon**:
  - Dangers: `!` (Danger 1), `!!` (Danger 2), `!!!` (Danger 3).
  - Downhill / uphill slope arrows.
  - Speed limits: Red circle `30`, `50`, finish slash.
  - Dakar terrain codes: `HP`, `SA`, `DN`, `DN L1`, `RIO`, `ORNI`, `OND`, `COMP`, `FOSS`, `PP`.
- **Co-driver Biffage**:
  - Automatic diagonal strikethrough slash across passed and validated notes, identical to Dakar co-drivers.
  - Tap any note to toggle biffage manually.

### 3. Apple MapKit & Live Alternative Route Planning
- Full Apple Maps integration (`MKMapView` / `MapKit`) supporting Satellite, Terrain (relief/contour), and Streets layers.
- Real-time Point A to Point B routing: Calculates multiple alternative paths (Route 1, Route 2, Route 3) with distance and travel time.
- Select preferred path and generate the complete Dakar Roadbook for that specific route.
- Live GPS tracking via `CoreLocation` & `CLHeading`.
- Race Simulator: Simulated driving mode (1x, 2x, 5x) for testing anywhere in the world.

### 4. International Multi-Language Localization
- Full localization supporting 10 languages:
  - English (`en`)
  - Français (`fr`)
  - Español (`es`)
  - العربية (`ar`)
  - Português (`pt`)
  - Deutsch (`de`)
  - Italiano (`it`)
  - हिन्दी (`hi`)
  - 日本語 (`ja`)
  - 中文 (`zh`)
- Dedicated language picker modal on launch and accessible at any time from the cockpit header.

### 5. Dakar ERTF Télécommande (Remote Control)
- `ESC`: Red button.
- `OK`: Green button (validates waypoint / toggles biffage).
- `STN`: Yellow button (Sentinel overtake horn alarm).
- `TRIP RST`: Magenta button (resets partial odometer).
- `+0.10` / `-0.10`: Calibrates total odometer.
- `NOTE +` / `NOTE -`: Advances or rewinds active roadbook note.

### 6. Automated CI/CD & IPA Build Pipeline
- GitHub Actions workflow (`.github/workflows/ci.yml`) automatically:
  - Validates code quality and syntax.
  - Builds and archives the iOS application on macOS runners.
  - Packages and exports the unsigned `.ipa` binary artifact for download.
  - Deploys the interactive web companion directly to GitHub Pages.

---

## 🚀 Running the Project

### 📱 Native iOS App (Xcode / Swift / SwiftUI)
The project includes an Xcode configuration built for iOS 17+.

```bash
xcodegen generate
open DakarRallyApp.xcodeproj
```

To build via CLI:
```bash
xcodebuild -project DakarRallyApp.xcodeproj -scheme DakarRallyApp -destination 'platform=iOS Simulator,name=iPhone 17' build CODE_SIGN_IDENTITY="" CODE_SIGNING_REQUIRED=NO
```

### 💻 Web / Browser Companion & GitHub Pages
Run locally:
```bash
python3 -m http.server 8088 --directory web
```
Visit `http://localhost:8088`.
When pushed to GitHub, the site is deployed directly to GitHub Pages.