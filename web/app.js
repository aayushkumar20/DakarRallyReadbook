/* DAKAR RALLY ERTF UNIK4 & DIGITAL ROADBOOK CORE ENGINE */

// FIA Dakar Symbol Lexicon (Screenshots 2 & 3)
const FIA_LEXICON = [
  // TRACKS
  { code: "2X", en: "Dual carriageway", fr: "2 voies", cat: "tracks" },
  { code: "RD", en: "Road", fr: "Route", cat: "tracks" },
  { code: "P", en: "Track", fr: "Piste", cat: "tracks" },
  { code: "HP", en: "Off track (Hors-piste)", fr: "Hors-piste", cat: "tracks" },
  { code: "G^D", en: "Big track", fr: "Grande piste", cat: "tracks" },
  { code: "PP", en: "Main track", fr: "Piste principale", cat: "tracks" },
  { code: "PS", en: "Winding track", fr: "Piste sinueuse", cat: "tracks" },
  { code: "PPS", en: "Winding main track", fr: "Piste principale sinueuse", cat: "tracks" },

  // ELEMENTS
  { code: "UB", en: "Under bridge", fr: "Sous pont", cat: "elements" },
  { code: "OB", en: "Over bridge", fr: "Sur pont", cat: "elements" },
  { code: "CL", en: "Fence", fr: "Clôture", cat: "elements" },
  { code: "BAR", en: "Gate barrier", fr: "Barrière", cat: "elements" },
  { code: "NCB", en: "No cattle passage", fr: "Passage bétail interdit", cat: "elements" },
  { code: "AF", en: "Animal fence", fr: "Clôture bétail", cat: "elements" },
  { code: "BIDON", en: "Barrel", fr: "Fût", cat: "elements" },
  { code: "MAIS", en: "House", fr: "Maison", cat: "elements" },
  { code: "RUIN", en: "Ruin", fr: "Ruine", cat: "elements" },
  { code: "PNEU", en: "Tire", fr: "Pneu", cat: "elements" },
  { code: "CIT", en: "Water tank", fr: "Citerne", cat: "elements" },
  { code: "BAT", en: "Buildings", fr: "Bâtiments", cat: "elements" },
  { code: "CF", en: "Rail road", fr: "Voie ferrée", cat: "elements" },

  // AREAS
  { code: "START", en: "Start", fr: "Départ", cat: "areas" },
  { code: "FINISH", en: "Finish", fr: "Arrivée", cat: "areas" },
  { code: "ESSENCE", en: "Petrol station", fr: "Station essence", cat: "areas" },
  { code: "CLOCK", en: "Clock", fr: "Horloge", cat: "areas" },
  { code: "VIL", en: "Village", fr: "Village", cat: "areas" },
  { code: "ZS", en: "Sensitive zone", fr: "Zone sensible", cat: "areas" },

  // SAFETY
  { code: "SL30", en: "Speed limit 30", fr: "Limitation 30", cat: "safety" },
  { code: "SL50", en: "Speed limit 50", fr: "Limitation 50", cat: "safety" },
  { code: "END_SL", en: "Finish speed limit zone", fr: "Fin limitation", cat: "safety" },
  { code: "!", en: "Danger 1", fr: "Danger 1", cat: "safety" },
  { code: "!!", en: "Danger 2", fr: "Danger 2", cat: "safety" },
  { code: "!!!", en: "Danger 3", fr: "Danger 3", cat: "safety" },
  { code: "DZ", en: "Start speed zone", fr: "Début zone vitesse", cat: "safety" },
  { code: "FZ", en: "Finish speed zone", fr: "Fin zone vitesse", cat: "safety" },

  // WAYPOINTS
  { code: "PC", en: "PC", fr: "Poste de contrôle", cat: "waypoints" },
  { code: "WPE", en: "Waypoint eclipse", fr: "Point éclipse", cat: "waypoints" },
  { code: "WPS", en: "Waypoint safety", fr: "Point sécurité", cat: "waypoints" },
  { code: "WPM", en: "Waypoint masked", fr: "Point masqué", cat: "waypoints" },
  { code: "WPC", en: "Waypoint control", fr: "Point contrôle", cat: "waypoints" },
  { code: "CP", en: "Checkpoint", fr: "Contrôle de passage", cat: "waypoints" },

  // DIRECTIONS
  { code: "PAN", en: "Panels", fr: "Panneaux", cat: "directions" },
  { code: "UPHILL", en: "Uphill", fr: "Montée", cat: "directions" },
  { code: "DOWNHILL", en: "Downhill", fr: "Descente", cat: "directions" },
  { code: "VERS", en: "Towards", fr: "Vers", cat: "directions" },
  { code: "DS", en: "In", fr: "Dans", cat: "directions" },
  { code: "IMP", en: "Imperative", fr: "Impératif", cat: "directions" },
  { code: "QT", en: "Leave", fr: "Quitter", cat: "directions" },
  { code: "RP", en: "To take", fr: "Reprendre", cat: "directions" },
  { code: "TDSPP", en: "Keep straight on main track", fr: "Tout droit sur piste principale", cat: "directions" },

  // SPECIFICITIES & TERRAIN
  { code: "MONT", en: "Mountain", fr: "Montagne", cat: "specificities" },
  { code: "ROCH", en: "Rock / Rocks", fr: "Rocher", cat: "specificities" },
  { code: "SA", en: "Sand", fr: "Sable", cat: "specificities" },
  { code: "CAIL", en: "Stones", fr: "Cailloux", cat: "specificities" },
  { code: "DN", en: "Dunes", fr: "Dunes", cat: "specificities" },
  { code: "DN L1", en: "Dunes Level 1", fr: "Dunes niveau 1", cat: "specificities" },
  { code: "DN L2", en: "Dunes Level 2", fr: "Dunes niveau 2", cat: "specificities" },
  { code: "DNT", en: "Small dune", fr: "Petite dune", cat: "specificities" },
  { code: "RIV", en: "River", fr: "Rivière", cat: "specificities" },
  { code: "RIO", en: "Dry riverbed / Oued", fr: "Rio sec / Oued", cat: "specificities" },
  { code: "ORNI", en: "Ruts", fr: "Ornières", cat: "specificities" },
  { code: "OND", en: "Undulation", fr: "Ondulation", cat: "specificities" },
  { code: "COMP", en: "Compression", fr: "Compression", cat: "specificities" },
  { code: "FOSS", en: "Ditch", fr: "Fossé", cat: "specificities" },
  { code: "E3", en: "Narrow", fr: "Étroit", cat: "specificities" },
  { code: "SER", en: "Tight", fr: "Serré", cat: "specificities" }
];

// Sound Synthesizer via Web Audio API
class DakarAudioEngine {
  constructor() {
    this.ctx = null;
  }
  init() {
    if (!this.ctx) {
      const AudioContext = window.AudioContext || window.webkitAudioContext;
      this.ctx = new AudioContext();
    }
    if (this.ctx.state === 'suspended') {
      this.ctx.resume();
    }
  }
  playWaypointChirp() {
    this.init();
    const osc = this.ctx.createOscillator();
    const gain = this.ctx.createGain();
    osc.type = 'triangle';
    osc.frequency.setValueAtTime(1400, this.ctx.currentTime);
    osc.frequency.exponentialRampToValueAtTime(2200, this.ctx.currentTime + 0.12);
    gain.gain.setValueAtTime(0.4, this.ctx.currentTime);
    gain.gain.exponentialRampToValueAtTime(0.01, this.ctx.currentTime + 0.12);
    osc.connect(gain);
    gain.connect(this.ctx.destination);
    osc.start();
    osc.stop(this.ctx.currentTime + 0.12);
  }
  playSentinelAlarm() {
    this.init();
    const now = this.ctx.currentTime;
    for (let i = 0; i < 2; i++) {
      const osc = this.ctx.createOscillator();
      const gain = this.ctx.createGain();
      osc.type = 'sawtooth';
      osc.frequency.setValueAtTime(880, now + i * 0.15);
      gain.gain.setValueAtTime(0.3, now + i * 0.15);
      gain.gain.exponentialRampToValueAtTime(0.01, now + (i + 1) * 0.14);
      osc.connect(gain);
      gain.connect(this.ctx.destination);
      osc.start(now + i * 0.15);
      osc.stop(now + (i + 1) * 0.14);
    }
  }
  playOverspeedBuzzer() {
    this.init();
    const osc = this.ctx.createOscillator();
    const gain = this.ctx.createGain();
    osc.type = 'square';
    osc.frequency.setValueAtTime(440, this.ctx.currentTime);
    gain.gain.setValueAtTime(0.25, this.ctx.currentTime);
    gain.gain.exponentialRampToValueAtTime(0.01, this.ctx.currentTime + 0.08);
    osc.connect(gain);
    gain.connect(this.ctx.destination);
    osc.start();
    osc.stop(this.ctx.currentTime + 0.08);
  }
}

const audio = new DakarAudioEngine();

// App State
const state = {
  currentStage: null,
  routeCoordinates: [],
  currentNoteIndex: 0,
  telemetry: {
    speedKmh: 78,
    headingDeg: 94,
    latitude: -14.0745,
    longitude: -75.7410,
    altitudeM: 428,
    slopeDeg: 2.4,
    totalOdoKM: 29.82,
    partialOdoKM: 0.71,
    validatedCount: 12,
    targetWptNum: 13,
    targetWptName: "B1",
    dtwKM: 0.11,
    ctwDeg: 32,
    relativeBearingDeg: 5,
    activeSpeedLimit: null,
    isSpeedExceeded: false,
    isSimulating: false,
    simSpeedMult: 2.0
  },
  map: null,
  carMarker: null,
  routePolyline: null,
  wptMarkers: []
};

// PRESET STAGES
const PRESETS = {
  // Screenshot 4 Exact Replica: Inca stage 01
  inca: {
    title: "INCA STAGE 01",
    totalDistanceKM: 163.0,
    waypointCount: 56,
    controlPointCount: 2,
    coordinates: [
      [-14.0678, -75.7286],
      [-14.0745, -75.7410],
      [-14.0950, -75.7480],
      [-14.1200, -75.7550],
      [-14.1500, -75.7620],
      [-14.1900, -75.7700]
    ],
    notes: [
      {
        id: 1,
        totalKM: 0.00,
        partialKM: 0.00,
        cap: 270,
        turnType: "offTrackLeft",
        isOffTrack: true,
        wptType: "START",
        wptName: "DSS 01",
        danger: 1,
        speedLimit: null,
        lexicon: ["START", "HP", "SA", "!", "DN"],
        text: "HP SA ! DN\nFOLLOW TRACES",
        lat: -14.0678,
        lon: -75.7286,
        alt: 412,
        isBiffed: true
      },
      {
        id: 2,
        totalKM: 1.34,
        partialKM: 1.34,
        cap: 286,
        turnType: "slightRight",
        isOffTrack: true,
        wptType: "WPC",
        wptName: "WPC 2",
        danger: 2,
        speedLimit: null,
        lexicon: ["WPC", "!!", "OND", "FOSS"],
        text: "WPC !! ONDULATION",
        lat: -14.0745,
        lon: -75.7410,
        alt: 428,
        isBiffed: false
      },
      {
        id: 3,
        totalKM: 4.88,
        partialKM: 3.53,
        cap: 182,
        turnType: "slightLeft",
        isOffTrack: true,
        wptType: "WPS",
        wptName: "WPS 3",
        danger: 0,
        speedLimit: null,
        lexicon: ["WPS", "OND"],
        text: "WPS ONDULATIONS",
        lat: -14.0950,
        lon: -75.7480,
        alt: 445,
        isBiffed: false
      },
      {
        id: 4,
        totalKM: 7.58,
        partialKM: 2.70,
        cap: 160,
        turnType: "straight",
        isOffTrack: true,
        wptType: "WPM",
        wptName: "WPM 4",
        danger: 0,
        speedLimit: null,
        lexicon: ["DN", "SA"],
        text: "CAP 160° SUR DUNES",
        lat: -14.1200,
        lon: -75.7550,
        alt: 460,
        isBiffed: false
      },
      {
        id: 5,
        totalKM: 11.20,
        partialKM: 3.62,
        cap: 120,
        turnType: "right",
        isOffTrack: false,
        wptType: "CP",
        wptName: "CP 1",
        danger: 1,
        speedLimit: null,
        lexicon: ["CP", "!", "PP", "SER"],
        text: "REPRENDRE PISTE PRINCIPALE SERREE !",
        lat: -14.1500,
        lon: -75.7620,
        alt: 485,
        isBiffed: false
      },
      {
        id: 6,
        totalKM: 15.80,
        partialKM: 4.60,
        cap: 95,
        turnType: "straight",
        isOffTrack: false,
        wptType: "FINISH",
        wptName: "ASS FINISH",
        danger: 0,
        speedLimit: 30,
        lexicon: ["FINISH", "FZ"],
        text: "ARRIVEE SPECIALE (ASS)",
        lat: -14.1900,
        lon: -75.7700,
        alt: 510,
        isBiffed: false
      }
    ]
  },

  // Screenshot 1 Exact Replica: Memo GPS Unik4 2024 / Empty Quarter
  emptyQuarter: {
    title: "DAKAR 2025 STAGE 5 (EMPTY QUARTER)",
    totalDistanceKM: 456.74,
    waypointCount: 38,
    controlPointCount: 4,
    coordinates: [
      [22.4500, 53.9800],
      [22.4720, 54.0150],
      [22.4890, 54.0450],
      [22.5120, 54.0800],
      [22.5350, 54.1200],
      [22.5600, 54.1650]
    ],
    notes: [
      {
        id: 12,
        totalKM: 29.11,
        partialKM: 2.25,
        cap: 87,
        turnType: "slightRight",
        isOffTrack: true,
        wptType: "WPM",
        wptName: "WPT 12",
        danger: 0,
        speedLimit: null,
        lexicon: ["ET", "DN L1", "SA"],
        text: "PLATEAU SA ET DN L1",
        lat: 22.4500,
        lon: 53.9800,
        alt: 120,
        isBiffed: true
      },
      {
        id: 13,
        totalKM: 31.02,
        partialKM: 1.91,
        cap: 108,
        turnType: "slightRight",
        isOffTrack: true,
        wptType: "WPC",
        wptName: "B1",
        danger: 0,
        speedLimit: null,
        lexicon: ["WPC", "DN L1"],
        text: "SUR DUNES NIVEAU 1 - CAP 108°",
        lat: 22.4720,
        lon: 54.0150,
        alt: 145,
        isBiffed: false
      },
      {
        id: 14,
        totalKM: 32.85,
        partialKM: 1.83,
        cap: 158,
        turnType: "right",
        isOffTrack: false,
        wptType: "WPM",
        wptName: "WPT 14",
        danger: 0,
        speedLimit: null,
        lexicon: ["PP", "P"],
        text: "/TRACKS SUR GRAND PLATEAU",
        lat: 22.4890,
        lon: 54.0450,
        alt: 130,
        isBiffed: false
      },
      {
        id: 15,
        totalKM: 34.94,
        partialKM: 2.09,
        cap: 188,
        turnType: "slightRight",
        isOffTrack: false,
        wptType: "CP",
        wptName: "CP2",
        danger: 0,
        speedLimit: null,
        lexicon: ["CP", "PP"],
        text: "250m /TRACKS - POINT CONTROLE 2",
        lat: 22.5120,
        lon: 54.0800,
        alt: 125,
        isBiffed: false
      },
      {
        id: 16,
        totalKM: 49.61,
        partialKM: 0.12,
        cap: 32,
        turnType: "slightRight",
        isOffTrack: false,
        wptType: "DZ",
        wptName: "DZ 50",
        danger: 1,
        speedLimit: 50,
        lexicon: ["DZ", "SL50", "VIL"],
        text: "DEBUT ZONE VITESSE MAX 50 KM/H",
        lat: 22.5350,
        lon: 54.1200,
        alt: 110,
        isBiffed: false
      },
      {
        id: 17,
        totalKM: 50.50,
        partialKM: 0.89,
        cap: 90,
        turnType: "sharpRight",
        isOffTrack: false,
        wptType: "FZ",
        wptName: "FZ",
        danger: 0,
        speedLimit: null,
        lexicon: ["FZ", "END_SL"],
        text: "FIN ZONE VITESSE - ALLURE LIBRE",
        lat: 22.5600,
        lon: 54.1650,
        alt: 115,
        isBiffed: false
      }
    ]
  }
};

// INITIALIZATION
window.addEventListener('DOMContentLoaded', () => {
  initMap();
  setupUIEventListeners();
  loadStage(PRESETS.inca);
});

// MAP INITIALIZATION
function initMap() {
  const mapElem = document.getElementById('satelliteMap');
  if (!mapElem) return;

  state.map = L.map('satelliteMap', {
    zoomControl: false,
    attributionControl: false
  }).setView([-14.0745, -75.7410], 13);

  // Satellite imagery tile layer (High-res Esri World Imagery)
  state.satelliteLayer = L.tileLayer('https://server.arcgisonline.com/ArcGIS/rest/services/World_Imagery/MapServer/tile/{z}/{y}/{x}', {
    maxZoom: 18
  }).addTo(state.map);

  // Custom Car Marker with Direction Cone
  const carIcon = L.divIcon({
    className: 'rally-car-icon-container',
    html: `<div id="carHeadingCone" style="width: 32px; height: 32px; display:flex; align-items:center; justify-content:center; transform: rotate(94deg);">
             <svg width="32" height="32" viewBox="0 0 32 32">
               <polygon points="16,2 26,28 16,22 6,28" fill="#00E676" stroke="#000" stroke-width="2"/>
               <circle cx="16" cy="16" r="3" fill="#FFE500"/>
             </svg>
           </div>`,
    iconSize: [32, 32],
    iconAnchor: [16, 16]
  });

  state.carMarker = L.marker([-14.0745, -75.7410], { icon: carIcon }).addTo(state.map);
}

// LOAD STAGE INTO APP
function loadStage(stageData) {
  state.currentStage = stageData;
  state.routeCoordinates = stageData.coordinates;
  state.currentNoteIndex = 1; // target note 2 initially

  // Update Roadbook Header
  document.getElementById('rbStageTitle').textContent = stageData.title;
  document.getElementById('rbMetaDst').textContent = `DST: ${stageData.totalDistanceKM} km`;
  document.getElementById('rbMetaWp').textContent = `WP: ${stageData.waypointCount}`;
  document.getElementById('rbMetaCp').textContent = `CP: ${stageData.controlPointCount}`;

  // Render Roadbook Table Rows
  renderRoadbookTable(stageData.notes);

  // Render Map Polyline & Waypoints
  renderMapRoute(stageData.coordinates, stageData.notes);

  // Update Cockpit Telemetry
  updateTelemetry();
}

// RENDER ROADBOOK TABLE (Screenshots 1 & 4 layout)
function renderRoadbookTable(notes) {
  const tbody = document.getElementById('roadbookBody');
  tbody.innerHTML = '';

  notes.forEach((note, idx) => {
    const tr = document.createElement('tr');
    tr.className = `note-row ${note.isBiffed ? 'biffed' : ''} ${idx === state.currentNoteIndex ? 'active' : ''}`;
    tr.id = `noteRow_${note.id}`;
    tr.onclick = () => toggleNoteBiffage(idx);

    // Col 1: Distance (Total, Partial, Note #)
    const tdDist = document.createElement('td');
    tdDist.className = 'col-distance';
    tdDist.innerHTML = `
      <div class="cell-distance">
        <div class="total-distance-box">${note.totalKM.toFixed(2)}</div>
        <div class="partial-distance-row">
          <span class="note-badge-seq">${note.id}</span>
          <span class="partial-distance-num">${note.partialKM.toFixed(2)}</span>
        </div>
      </div>
    `;

    // Col 2: SVG Tulip Diagram
    const tdTulip = document.createElement('td');
    tdTulip.className = 'col-tulip';
    tdTulip.innerHTML = `
      <div class="cell-tulip">
        ${generateTulipSVG(note)}
        ${note.cap ? `<div class="tulip-cap-badge">${note.cap}°</div>` : ''}
      </div>
    `;

    // Col 3: FIA Lexicon & Dangers
    const tdLex = document.createElement('td');
    tdLex.className = 'col-lexicon';
    tdLex.innerHTML = `
      <div class="cell-lexicon">
        <div class="lex-row-top">
          ${renderWptStamp(note.wptType)}
          ${note.speedLimit ? `<div class="speed-circle">${note.speedLimit}</div>` : ''}
          ${note.danger > 0 ? `<div class="danger-marks">${"!".repeat(note.danger)}</div>` : ''}
        </div>
        <div class="lex-codes-tags">
          ${note.lexicon.map(c => `<span class="lex-tag ${c.toLowerCase().replace(/[^a-z0-9]/g, '')}">${c}</span>`).join('')}
        </div>
        <div class="instruction-text">${note.text}</div>
      </div>
    `;

    tr.appendChild(tdDist);
    tr.appendChild(tdTulip);
    tr.appendChild(tdLex);
    tbody.appendChild(tr);
  });
}

// GENERATE SVG TULIP DIAGRAM (Accurate Dakar track vectors matching Screenshot 4)
function generateTulipSVG(note) {
  const isOffTrack = note.isOffTrack;
  const dashAttr = isOffTrack ? 'stroke-dasharray="6,4"' : '';
  const turn = note.turnType || 'straight';

  let pathD = 'M 90,86 L 90,52';
  let arrowHead = '';

  switch (turn) {
    case 'straight':
      pathD = 'M 90,86 L 90,20';
      arrowHead = '<polygon points="90,12 85,24 95,24" fill="#000" />';
      break;
    case 'slightRight':
      pathD = 'M 90,86 L 90,52 Q 95,38 140,24';
      arrowHead = '<polygon points="146,20 134,22 142,32" fill="#000" />';
      break;
    case 'right':
      pathD = 'M 90,86 L 90,52 Q 105,52 145,52';
      arrowHead = '<polygon points="152,52 140,46 140,58" fill="#000" />';
      break;
    case 'sharpRight':
      pathD = 'M 90,86 L 90,52 Q 140,50 130,75';
      arrowHead = '<polygon points="126,82 124,70 136,74" fill="#000" />';
      break;
    case 'slightLeft':
    case 'offTrackLeft':
      pathD = 'M 90,86 L 90,52 Q 85,38 40,24';
      arrowHead = '<polygon points="34,20 38,32 46,22" fill="#000" />';
      break;
    case 'left':
      pathD = 'M 90,86 L 90,52 Q 75,52 35,52';
      arrowHead = '<polygon points="28,52 40,46 40,58" fill="#000" />';
      break;
    default:
      pathD = 'M 90,86 L 90,20';
      arrowHead = '<polygon points="90,12 85,24 95,24" fill="#000" />';
  }

  // Landmark overlays from Screenshot 4
  let extraLandmarks = '';
  if (note.id === 1) {
    // START circle + Clock circle beside branching arrow
    extraLandmarks = `
      <circle cx="115" cy="46" r="10" stroke="#000" stroke-width="1.5" fill="#FFF"/>
      <text x="115" y="49" font-size="5" font-weight="900" text-anchor="middle">START</text>
      <circle cx="140" cy="46" r="9" stroke="#000" stroke-width="1.5" fill="#FFF"/>
      <line x1="140" y1="46" x2="140" y2="40" stroke="#000" stroke-width="1.5"/>
      <line x1="140" y1="46" x2="145" y2="46" stroke="#000" stroke-width="1.5"/>
    `;
  } else if (note.id === 2) {
    // Stepped terrace diagram from Note 2
    extraLandmarks = `
      <path d="M 105,35 L 115,35 L 115,25 L 125,25 L 125,15" stroke="#000" stroke-width="1.8" fill="none"/>
      <line x1="130" y1="28" x2="145" y2="38" stroke="#000" stroke-width="1.5"/>
      <line x1="135" y1="36" x2="150" y2="46" stroke="#000" stroke-width="1.5"/>
    `;
  }

  return `
    <svg class="tulip-svg" viewBox="0 0 180 98">
      <!-- Background white box -->
      <rect width="180" height="98" fill="#FFF" />
      <!-- Incoming track -->
      <path d="${pathD}" fill="none" stroke="#000" stroke-width="3.8" ${dashAttr} />
      <!-- Arrow Head -->
      ${arrowHead}
      <!-- Landmarks -->
      ${extraLandmarks}
    </svg>
  `;
}

function renderWptStamp(type) {
  if (!type) return '';
  switch (type) {
    case 'START': return '<div class="wpt-stamp">START</div>';
    case 'FINISH': return '<div class="wpt-stamp">FINISH</div>';
    case 'WPC': return '<div class="wpt-stamp">WPC</div>';
    case 'WPS': return '<div class="wpt-stamp">WPS</div>';
    case 'WPM': return '<div class="wpt-stamp">WPM</div>';
    case 'DZ': return '<div class="wpt-stamp dz">DZ</div>';
    case 'FZ': return '<div class="wpt-stamp">FZ</div>';
    case 'CP': return '<div class="wpt-stamp cp">CP</div>';
    default: return '';
  }
}

// RENDER MAP POLYLINE & WAYPOINT MARKERS
function renderMapRoute(coords, notes) {
  if (!state.map) return;

  // Clear existing polyline & markers
  if (state.routePolyline) state.map.removeLayer(state.routePolyline);
  state.wptMarkers.forEach(m => state.map.removeLayer(m));
  state.wptMarkers = [];

  // Draw vibrant Dakar neon route line
  state.routePolyline = L.polyline(coords, {
    color: '#FF6D00',
    weight: 5,
    opacity: 0.95,
    smoothFactor: 1
  }).addTo(state.map);

  // Add custom markers for notes
  notes.forEach(note => {
    const marker = L.circleMarker([note.lat, note.lon], {
      radius: 7,
      fillColor: note.wptType === 'START' ? '#00E676' : note.wptType === 'FINISH' ? '#000' : '#FFE500',
      color: '#000',
      weight: 2,
      fillOpacity: 1
    }).bindPopup(`<b>Note #${note.id}</b><br>${note.text}`).addTo(state.map);
    state.wptMarkers.push(marker);
  });

  state.map.fitBounds(state.routePolyline.getBounds(), { padding: [50, 50] });
}

// TOGGLE NOTE BIFFAGE
function toggleNoteBiffage(index) {
  if (!state.currentStage || !state.currentStage.notes[index]) return;
  const note = state.currentStage.notes[index];
  note.isBiffed = !note.isBiffed;

  const row = document.getElementById(`noteRow_${note.id}`);
  if (row) {
    row.classList.toggle('biffed', note.isBiffed);
  }
}

// UPDATE COCKPIT & TELEMETRY
function updateTelemetry() {
  const t = state.telemetry;

  document.getElementById('telemetrySpeed').textContent = Math.round(t.speedKmh);
  document.getElementById('telemetryHeading').textContent = `${Math.round(t.headingDeg)}°`;
  document.getElementById('telemetryOdoTotal').textContent = t.totalOdoKM.toFixed(2);
  document.getElementById('telemetryOdoPartiel').textContent = t.partialOdoKM.toFixed(2);
  document.getElementById('telemetryValidated').textContent = t.validatedCount;
  document.getElementById('telemetryWptNum').textContent = t.targetWptNum;
  document.getElementById('telemetryWptName').textContent = t.targetWptName;
  document.getElementById('telemetryDtw').textContent = t.dtwKM.toFixed(2);
  document.getElementById('telemetryCtw').textContent = `${Math.round(t.ctwDeg)}°`;
  document.getElementById('telemetryCoords').textContent = `${t.latitude.toFixed(4)}° N, ${t.longitude.toFixed(4)}° W`;
  document.getElementById('telemetryAlt').textContent = `${Math.round(t.altitudeM)} m`;
  document.getElementById('telemetrySlope').textContent = `${t.slopeDeg > 0 ? '+' : ''}${t.slopeDeg.toFixed(1)}°`;

  const nextElem = document.getElementById('telemNextDist');
  if (nextElem) nextElem.textContent = `NEXT ${t.dtwKM.toFixed(2)}`;
  const footCap = document.getElementById('telemFootCap');
  if (footCap) footCap.textContent = `Cap ${Math.round(t.ctwDeg)}°`;

  // Rotate CTW Steering Arrow
  const arrow = document.getElementById('steeringArrow');
  if (arrow) {
    arrow.style.transform = `rotate(${t.relativeBearingDeg}deg)`;
  }

  // Rotate Car Marker on Map
  const cone = document.getElementById('carHeadingCone');
  if (cone) {
    cone.style.transform = `rotate(${t.headingDeg}deg)`;
  }
  if (state.carMarker) {
    state.carMarker.setLatLng([t.latitude, t.longitude]);
  }

  // Speed Zone Alert Display
  const alertBox = document.getElementById('speedZoneAlert');
  if (t.activeSpeedLimit) {
    alertBox.style.display = 'flex';
    document.getElementById('zoneCurSpeed').textContent = Math.round(t.speedKmh);
    document.getElementById('zoneMaxLimit').textContent = `MAX ${t.activeSpeedLimit}`;
    if (t.speedKmh > t.activeSpeedLimit) {
      alertBox.style.background = 'rgba(211, 47, 47, 0.3)';
      audio.playOverspeedBuzzer();
    } else {
      alertBox.style.background = 'rgba(211, 47, 47, 0.1)';
    }
  } else {
    alertBox.style.display = 'none';
  }
}

// REAL-TIME RACE SIMULATION ENGINE
let simInterval = null;
let simProgress = 0;

function startSimulation() {
  if (!state.routeCoordinates || state.routeCoordinates.length < 2) return;
  state.telemetry.isSimulating = true;
  document.getElementById('simBanner').style.display = 'flex';

  simInterval = setInterval(() => {
    simProgress += 0.008 * state.telemetry.simSpeedMult;
    if (simProgress >= state.routeCoordinates.length - 1) {
      simProgress = 0; // loop
    }

    const curIdx = Math.floor(simProgress);
    const nextIdx = Math.min(curIdx + 1, state.routeCoordinates.length - 1);
    const frac = simProgress - curIdx;

    const p1 = state.routeCoordinates[curIdx];
    const p2 = state.routeCoordinates[nextIdx];

    const lat = p1[0] + (p2[0] - p1[0]) * frac;
    const lon = p1[1] + (p2[1] - p1[1]) * frac;

    // Calculate heading from p1 to p2
    const heading = calculateBearing(p1[0], p1[1], p2[0], p2[1]);
    state.telemetry.latitude = lat;
    state.telemetry.longitude = lon;
    state.telemetry.headingDeg = heading;
    state.telemetry.speedKmh = (75 + Math.sin(simProgress * 10) * 15) * state.telemetry.simSpeedMult;
    state.telemetry.altitudeM = 420 + Math.sin(simProgress * 5) * 45;
    state.telemetry.slopeDeg = Math.sin(simProgress * 8) * 4;

    const deltaKM = (state.telemetry.speedKmh / 3600) * 0.2;
    state.telemetry.totalOdoKM += deltaKM;
    state.telemetry.partialOdoKM += deltaKM;

    // Check target note distance
    if (state.currentStage && state.currentStage.notes[state.currentNoteIndex]) {
      const targetNote = state.currentStage.notes[state.currentNoteIndex];
      const distM = getDistanceMeters(lat, lon, targetNote.lat, targetNote.lon);
      state.telemetry.dtwKM = distM / 1000;
      state.telemetry.ctwDeg = calculateBearing(lat, lon, targetNote.lat, targetNote.lon);

      let diff = state.telemetry.ctwDeg - state.telemetry.headingDeg;
      while (diff > 180) diff -= 360;
      while (diff < -180) diff += 360;
      state.telemetry.relativeBearingDeg = diff;

      // Waypoint validated radius (45 meters)
      if (distM < 60 && !targetNote.isBiffed) {
        targetNote.isBiffed = true;
        state.telemetry.validatedCount++;
        audio.playWaypointChirp();

        const row = document.getElementById(`noteRow_${targetNote.id}`);
        if (row) row.classList.add('biffed');

        // Advance to next note
        if (state.currentNoteIndex < state.currentStage.notes.length - 1) {
          state.currentNoteIndex++;
          state.telemetry.partialOdoKM = 0;
          const nextNote = state.currentStage.notes[state.currentNoteIndex];
          state.telemetry.targetWptNum = nextNote.id;
          state.telemetry.targetWptName = nextNote.wptName || `WPT ${nextNote.id}`;
          state.telemetry.activeSpeedLimit = nextNote.speedLimit;

          // Scroll roadbook to active row
          const nextRow = document.getElementById(`noteRow_${nextNote.id}`);
          if (nextRow) {
            document.querySelectorAll('.note-row').forEach(r => r.classList.remove('active'));
            nextRow.classList.add('active');
            nextRow.scrollIntoView({ behavior: 'smooth', block: 'center' });
          }
        }
      }
    }

    updateTelemetry();
  }, 200);
}

function stopSimulation() {
  if (simInterval) clearInterval(simInterval);
  simInterval = null;
  state.telemetry.isSimulating = false;
  document.getElementById('simBanner').style.display = 'none';
}

function calculateBearing(lat1, lon1, lat2, lon2) {
  const dLon = (lon2 - lon1) * Math.PI / 180;
  const y = Math.sin(dLon) * Math.cos(lat2 * Math.PI / 180);
  const x = Math.cos(lat1 * Math.PI / 180) * Math.sin(lat2 * Math.PI / 180) -
            Math.sin(lat1 * Math.PI / 180) * Math.cos(lat2 * Math.PI / 180) * Math.cos(dLon);
  const deg = (Math.atan2(y, x) * 180 / Math.PI + 360) % 360;
  return deg;
}

function getDistanceMeters(lat1, lon1, lat2, lon2) {
  const R = 6371e3;
  const φ1 = lat1 * Math.PI / 180;
  const φ2 = lat2 * Math.PI / 180;
  const Δφ = (lat2 - lat1) * Math.PI / 180;
  const Δλ = (lon2 - lon1) * Math.PI / 180;
  const a = Math.sin(Δφ/2) * Math.sin(Δφ/2) +
            Math.cos(φ1) * Math.cos(φ2) *
            Math.sin(Δλ/2) * Math.sin(Δλ/2);
  const c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a));
  return R * c;
}

// REAL DEVICE GPS & ORIENTATION SUPPORT
let geoWatchId = null;

function enableLiveDeviceGPS() {
  if (!navigator.geolocation) {
    alert("Geolocation is not supported by your browser.");
    return;
  }
  stopSimulation();

  geoWatchId = navigator.geolocation.watchPosition(
    pos => {
      const lat = pos.coords.latitude;
      const lon = pos.coords.longitude;
      const speedKmh = pos.coords.speed ? Math.max(0, pos.coords.speed * 3.6) : 0;
      const heading = pos.coords.heading !== null && !isNaN(pos.coords.heading) ? pos.coords.heading : state.telemetry.headingDeg;
      const alt = pos.coords.altitude || state.telemetry.altitudeM;

      state.telemetry.latitude = lat;
      state.telemetry.longitude = lon;
      state.telemetry.speedKmh = speedKmh;
      state.telemetry.headingDeg = heading;
      state.telemetry.altitudeM = alt;

      updateTelemetry();
    },
    err => {
      console.warn("GPS watchPosition error:", err);
    },
    { enableHighAccuracy: true, maximumAge: 1000, timeout: 5000 }
  );

  if (window.DeviceOrientationEvent) {
    window.addEventListener('deviceorientation', evt => {
      if (evt.alpha !== null && !isNaN(evt.alpha)) {
        state.telemetry.headingDeg = 360 - evt.alpha;
        updateTelemetry();
      }
    });
  }
}

// SETUP UI EVENT LISTENERS
function setupUIEventListeners() {
  // Mode Buttons (SPLIT, UNIK4, ROADBOOK, MAP)
  document.querySelectorAll('.mode-btn').forEach(btn => {
    btn.onclick = () => {
      document.querySelectorAll('.mode-btn').forEach(b => b.classList.remove('active'));
      btn.classList.add('active');
      const mode = btn.dataset.mode;
      document.body.className = `mode-${mode}`;
      if (state.map) setTimeout(() => state.map.invalidateSize(), 200);
    };
  });

  // Télécommande Buttons (Screenshot 1)
  document.getElementById('keyOk').onclick = () => {
    toggleNoteBiffage(state.currentNoteIndex);
  };
  document.getElementById('keyStn').onclick = () => {
    audio.playSentinelAlarm();
  };
  document.getElementById('keyTripRst').onclick = () => {
    state.telemetry.partialOdoKM = 0.0;
    updateTelemetry();
  };
  document.getElementById('btnQuickRst').onclick = () => {
    state.telemetry.partialOdoKM = 0.0;
    updateTelemetry();
  };
  document.getElementById('keyOdoPlus').onclick = () => {
    state.telemetry.totalOdoKM += 0.10;
    updateTelemetry();
  };
  document.getElementById('keyOdoMinus').onclick = () => {
    state.telemetry.totalOdoKM = Math.max(0, state.telemetry.totalOdoKM - 0.10);
    updateTelemetry();
  };
  document.getElementById('keyNoteNext').onclick = () => {
    if (state.currentStage && state.currentNoteIndex < state.currentStage.notes.length - 1) {
      state.currentNoteIndex++;
      selectCurrentNote(state.currentNoteIndex);
    }
  };
  document.getElementById('keyNotePrev').onclick = () => {
    if (state.currentNoteIndex > 0) {
      state.currentNoteIndex--;
      selectCurrentNote(state.currentNoteIndex);
    }
  };

  function selectCurrentNote(idx) {
    const note = state.currentStage.notes[idx];
    state.telemetry.targetWptNum = note.id;
    state.telemetry.targetWptName = note.wptName || `WPT ${note.id}`;
    state.telemetry.activeSpeedLimit = note.speedLimit;
    document.querySelectorAll('.note-row').forEach(r => r.classList.remove('active'));
    const row = document.getElementById(`noteRow_${note.id}`);
    if (row) {
      row.classList.add('active');
      row.scrollIntoView({ behavior: 'smooth', block: 'center' });
    }
    updateTelemetry();
  }

  // Simulation Controls
  document.getElementById('btnToggleSim').onclick = () => {
    if (state.telemetry.isSimulating) {
      stopSimulation();
    } else {
      startSimulation();
    }
  };
  document.getElementById('btnStopSim').onclick = () => stopSimulation();
  document.querySelectorAll('.sim-speed-btn').forEach(btn => {
    btn.onclick = () => {
      document.querySelectorAll('.sim-speed-btn').forEach(b => b.classList.remove('active'));
      btn.classList.add('active');
      state.telemetry.simSpeedMult = parseFloat(btn.dataset.speed);
    };
  });

  // Modals & Presets
  document.getElementById('btnOpenPlanner').onclick = () => {
    document.getElementById('routeModal').style.display = 'flex';
  };
  document.getElementById('btnCloseRouteModal').onclick = () => {
    document.getElementById('routeModal').style.display = 'none';
  };
  document.getElementById('btnLoadInca').onclick = () => {
    loadStage(PRESETS.inca);
    document.getElementById('routeModal').style.display = 'none';
  };
  document.getElementById('btnLoadEmptyQuarter').onclick = () => {
    loadStage(PRESETS.emptyQuarter);
    document.getElementById('routeModal').style.display = 'none';
  };

  // Lexicon Modal
  document.getElementById('btnOpenLexicon').onclick = () => {
    document.getElementById('lexiconModal').style.display = 'flex';
    renderLexiconGrid('all');
  };
  document.getElementById('btnCloseLexiconModal').onclick = () => {
    document.getElementById('lexiconModal').style.display = 'none';
  };
  document.querySelectorAll('.lex-cat-btn').forEach(btn => {
    btn.onclick = () => {
      document.querySelectorAll('.lex-cat-btn').forEach(b => b.classList.remove('active'));
      btn.classList.add('active');
      renderLexiconGrid(btn.dataset.cat);
    };
  });

  // Calculate Custom Route (Point A to Point B)
  document.getElementById('btnCalculateRoute').onclick = () => {
    const fromVal = document.getElementById('inputPointA').value;
    const toVal = document.getElementById('inputPointB').value;
    calculatePointAToB(fromVal, toVal);
  };
}

// POPULATE FIA LEXICON GRID (Screenshots 2 & 3)
function renderLexiconGrid(category) {
  const container = document.getElementById('lexiconGrid');
  container.innerHTML = '';
  const filtered = category === 'all' ? FIA_LEXICON : FIA_LEXICON.filter(item => item.cat === category);

  filtered.forEach(item => {
    const card = document.createElement('div');
    card.className = 'lexicon-card-item';
    card.innerHTML = `
      <div class="lex-item-code">${item.code}</div>
      <div class="lex-item-names">
        <span class="lex-name-en">${item.en}</span>
        <span class="lex-name-fr">${item.fr}</span>
      </div>
    `;
    container.appendChild(card);
  });
}

// REAL POINT A TO POINT B ROUTING WITH LIVE ROADBOOK GENERATION
async function calculatePointAToB(fromQuery, toQuery) {
  const btn = document.getElementById('btnCalculateRoute');
  btn.textContent = 'GENERATING ROADBOOK...';

  try {
    // 1. Geocode both locations using OpenStreetMap Nominatim
    const [fromGeo, toGeo] = await Promise.all([
      fetch(`https://nominatim.openstreetmap.org/search?format=json&q=${encodeURIComponent(fromQuery)}`).then(r => r.json()),
      fetch(`https://nominatim.openstreetmap.org/search?format=json&q=${encodeURIComponent(toQuery)}`).then(r => r.json())
    ]);

    if (!fromGeo.length || !toGeo.length) {
      alert("Location not found. Please try another address or city name.");
      btn.textContent = '⚡ CALCULATE & GENERATE ROADBOOK';
      return;
    }

    const startLat = parseFloat(fromGeo[0].lat);
    const startLon = parseFloat(fromGeo[0].lon);
    const endLat = parseFloat(toGeo[0].lat);
    const endLon = parseFloat(toGeo[0].lon);

    // 2. Fetch Driving Route from OSRM Directions
    const routeUrl = `https://router.project-osrm.org/route/v1/driving/${startLon},${startLat};${endLon},${endLat}?overview=full&geometries=geojson&steps=true`;
    const routeRes = await fetch(routeUrl).then(r => r.json());

    if (!routeRes.routes || !routeRes.routes.length) {
      alert("No route found between the points.");
      btn.textContent = '⚡ CALCULATE & GENERATE ROADBOOK';
      return;
    }

    const route = routeRes.routes[0];
    const coords = route.geometry.coordinates.map(c => [c[1], c[0]]);

    // 3. Convert Turn-by-Turn Steps into Dakar Roadbook Notes
    const notes = [];
    let runningDistKM = 0.0;
    let noteId = 1;

    // START NOTE
    notes.push({
      id: noteId++,
      totalKM: 0.00,
      partialKM: 0.00,
      cap: Math.round(calculateBearing(coords[0][0], coords[0][1], coords[1][0], coords[1][1])),
      turnType: "straight",
      isOffTrack: false,
      wptType: "START",
      wptName: "DSS DEPART",
      danger: 0,
      speedLimit: 50,
      lexicon: ["START", "DZ", "PP"],
      text: "DEPART SS - FOLLOW TRACES",
      lat: coords[0][0],
      lon: coords[0][1],
      alt: 350,
      isBiffed: false
    });

    // STEP NOTES
    route.legs[0].steps.forEach((step, idx) => {
      if (step.distance < 40) return; // ignore micro-turns
      const stepKM = step.distance / 1000;
      runningDistKM += stepKM;

      const stepLoc = [step.maneuver.location[1], step.maneuver.location[0]];
      const cap = Math.round(calculateBearing(coords[Math.min(idx * 2, coords.length - 2)][0], coords[Math.min(idx * 2, coords.length - 2)][1], stepLoc[0], stepLoc[1]));

      let turnType = "straight";
      if (step.maneuver.modifier) {
        const mod = step.maneuver.modifier;
        if (mod.includes("right")) turnType = mod.includes("slight") ? "slightRight" : "right";
        else if (mod.includes("left")) turnType = mod.includes("slight") ? "slightLeft" : "left";
      }

      const danger = (turnType === "right" || turnType === "left") ? 1 : 0;
      let wptType = (noteId % 4 === 0) ? "WPC" : (noteId % 3 === 0) ? "WPS" : "WPM";
      let speedLim = null;
      let lexList = ["PP"];

      if (step.name && (step.name.toLowerCase().includes("village") || step.name.toLowerCase().includes("avenue"))) {
        wptType = "DZ";
        speedLim = 50;
        lexList.push("DZ", "VIL");
      }

      if (danger > 0) lexList.push("!");

      notes.push({
        id: noteId++,
        totalKM: parseFloat(runningDistKM.toFixed(2)),
        partialKM: parseFloat(stepKM.toFixed(2)),
        cap: cap,
        turnType: turnType,
        isOffTrack: false,
        wptType: wptType,
        wptName: `WPT ${noteId - 1}`,
        danger: danger,
        speedLimit: speedLim,
        lexicon: lexList,
        text: (step.name || "FOLLOW MAIN TRACK").toUpperCase(),
        lat: stepLoc[0],
        lon: stepLoc[1],
        alt: 350 + noteId * 6,
        isBiffed: false
      });
    });

    // FINISH NOTE
    const lastCoord = coords[coords.length - 1];
    notes.push({
      id: noteId,
      totalKM: parseFloat((route.distance / 1000).toFixed(2)),
      partialKM: parseFloat(((route.distance / 1000) - runningDistKM).toFixed(2)),
      cap: 0,
      turnType: "straight",
      isOffTrack: false,
      wptType: "FINISH",
      wptName: "ASS FINISH",
      danger: 0,
      speedLimit: 30,
      lexicon: ["FINISH", "FZ"],
      text: "ARRIVEE SPECIALE (ASS)",
      lat: lastCoord[0],
      lon: lastCoord[1],
      alt: 420,
      isBiffed: false
    });

    const customStage = {
      title: `${fromQuery.toUpperCase()} ➔ ${toQuery.toUpperCase()}`,
      totalDistanceKM: parseFloat((route.distance / 1000).toFixed(1)),
      waypointCount: notes.length,
      controlPointCount: notes.filter(n => n.wptType === 'WPC' || n.wptType === 'CP').length,
      coordinates: coords,
      notes: notes
    };

    loadStage(customStage);
    document.getElementById('routeModal').style.display = 'none';
    btn.textContent = '⚡ CALCULATE & GENERATE ROADBOOK';

  } catch (err) {
    console.error(err);
    alert("Error calculating Dakar route: " + err.message);
    btn.textContent = '⚡ CALCULATE & GENERATE ROADBOOK';
  }
}
