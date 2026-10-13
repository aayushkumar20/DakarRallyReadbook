const FIA_LEXICON = [
  { code: "2X", en: "Dual carriageway", fr: "2 voies", cat: "tracks" },
  { code: "RD", en: "Road", fr: "Route", cat: "tracks" },
  { code: "P", en: "Track", fr: "Piste", cat: "tracks" },
  { code: "HP", en: "Off track (Hors-piste)", fr: "Hors-piste", cat: "tracks" },
  { code: "G^D", en: "Big track", fr: "Grande piste", cat: "tracks" },
  { code: "PP", en: "Main track", fr: "Piste principale", cat: "tracks" },
  { code: "PS", en: "Winding track", fr: "Piste sinueuse", cat: "tracks" },
  { code: "PPS", en: "Winding main track", fr: "Piste principale sinueuse", cat: "tracks" },
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
  { code: "START", en: "Start", fr: "Départ", cat: "areas" },
  { code: "FINISH", en: "Finish", fr: "Arrivée", cat: "areas" },
  { code: "ESSENCE", en: "Petrol station", fr: "Station essence", cat: "areas" },
  { code: "CLOCK", en: "Clock", fr: "Horloge", cat: "areas" },
  { code: "VIL", en: "Village", fr: "Village", cat: "areas" },
  { code: "ZS", en: "Sensitive zone", fr: "Zone sensible", cat: "areas" },
  { code: "SL30", en: "Speed limit 30", fr: "Limitation 30", cat: "safety" },
  { code: "SL50", en: "Speed limit 50", fr: "Limitation 50", cat: "safety" },
  { code: "END_SL", en: "Finish speed limit zone", fr: "Fin limitation", cat: "safety" },
  { code: "!", en: "Danger 1", fr: "Danger 1", cat: "safety" },
  { code: "!!", en: "Danger 2", fr: "Danger 2", cat: "safety" },
  { code: "!!!", en: "Danger 3", fr: "Danger 3", cat: "safety" },
  { code: "DZ", en: "Start speed zone", fr: "Début zone vitesse", cat: "safety" },
  { code: "FZ", en: "Finish speed zone", fr: "Fin zone vitesse", cat: "safety" },
  { code: "PC", en: "PC", fr: "Poste de contrôle", cat: "waypoints" },
  { code: "WPE", en: "Waypoint eclipse", fr: "Point éclipse", cat: "waypoints" },
  { code: "WPS", en: "Waypoint safety", fr: "Point sécurité", cat: "waypoints" },
  { code: "WPM", en: "Waypoint masked", fr: "Point masqué", cat: "waypoints" },
  { code: "WPC", en: "Waypoint control", fr: "Point contrôle", cat: "waypoints" },
  { code: "CP", en: "Checkpoint", fr: "Contrôle de passage", cat: "waypoints" },
  { code: "PAN", en: "Panels", fr: "Panneaux", cat: "directions" },
  { code: "UPHILL", en: "Uphill", fr: "Montée", cat: "directions" },
  { code: "DOWNHILL", en: "Downhill", fr: "Descente", cat: "directions" },
  { code: "VERS", en: "Towards", fr: "Vers", cat: "directions" },
  { code: "DS", en: "In", fr: "Dans", cat: "directions" },
  { code: "IMP", en: "Imperative", fr: "Impératif", cat: "directions" },
  { code: "QT", en: "Leave", fr: "Quitter", cat: "directions" },
  { code: "RP", en: "To take", fr: "Reprendre", cat: "directions" },
  { code: "TDSPP", en: "Keep straight on main track", fr: "Tout droit sur piste principale", cat: "directions" },
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

const APP_LANGUAGES = [
  { code: "en", name: "English", flag: "🇬🇧" },
  { code: "fr", name: "Français", flag: "🇫🇷" },
  { code: "es", name: "Español", flag: "🇪🇸" },
  { code: "ar", name: "العربية", flag: "🇸🇦" },
  { code: "pt", name: "Português", flag: "🇵🇹" },
  { code: "de", name: "Deutsch", flag: "🇩🇪" },
  { code: "it", name: "Italiano", flag: "🇮🇹" },
  { code: "hi", name: "हिन्दी", flag: "🇮🇳" },
  { code: "ja", name: "日本語", flag: "🇯🇵" },
  { code: "zh", name: "中文", flag: "🇨🇳" }
];

let I18N_STRINGS = {};

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

const state = {
  currentStage: null,
  routeCoordinates: [],
  currentNoteIndex: 0,
  currentLanguage: 'en',
  telemetry: {
    speedKmh: 0,
    speedUnit: 'km/h',
    headingDeg: 0,
    latitude: 0,
    longitude: 0,
    altitudeM: 0,
    slopeDeg: 0,
    totalOdoKM: 0.0,
    partialOdoKM: 0.0,
    validatedCount: 0,
    targetWptNum: '--',
    targetWptName: '--',
    dtwKM: 0.0,
    ctwDeg: 0,
    relativeBearingDeg: 0,
    activeSpeedLimit: null,
    isSpeedExceeded: false,
    isSimulating: false,
    simSpeedMult: 2.0,
    startTime: null,
    elapsedSeconds: 0,
    maxSpeedKmh: 0,
    avgSpeedKmh: 0
  },
  map: null,
  mapLayers: {},
  carMarker: null,
  routePolyline: null,
  alternatePolylines: [],
  wptMarkers: [],
  candidateRoutes: [],
  selectedCandidateIndex: 0
};

window.addEventListener('DOMContentLoaded', async () => {
  await loadI18nStrings();
  initMap();
  setupUIEventListeners();
  renderLanguageOptions();
  startChronoTicker();
  updateTelemetry();

  const savedLang = localStorage.getItem('dakar_lang');
  if (savedLang) {
    applyLanguage(savedLang);
  } else {
    document.getElementById('languageModal').style.display = 'flex';
  }

  if (navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(
      pos => {
        state.telemetry.latitude = pos.coords.latitude;
        state.telemetry.longitude = pos.coords.longitude;
        if (state.map) {
          state.map.setView([pos.coords.latitude, pos.coords.longitude], 13);
        }
        updateTelemetry();
      },
      () => {},
      { timeout: 5000 }
    );
  }
});

async function loadI18nStrings() {
  try {
    const res = await fetch('strings.json');
    I18N_STRINGS = await res.json();
  } catch (err) {
    console.warn("Could not load strings.json, using fallback", err);
  }
}

function t(key) {
  const lang = state.currentLanguage || 'en';
  if (I18N_STRINGS[lang] && I18N_STRINGS[lang][key]) {
    return I18N_STRINGS[lang][key];
  }
  if (I18N_STRINGS['en'] && I18N_STRINGS['en'][key]) {
    return I18N_STRINGS['en'][key];
  }
  return key;
}

function applyLanguage(langCode) {
  state.currentLanguage = langCode;
  localStorage.setItem('dakar_lang', langCode);

  const langObj = APP_LANGUAGES.find(l => l.code === langCode);
  if (langObj) {
    document.getElementById('currentLangLabel').textContent = `${langObj.flag} ${langObj.code.toUpperCase()}`;
  }

  const setTxt = (id, str) => {
    const el = document.getElementById(id);
    if (el) el.textContent = str;
  };

  setTxt('txtBrandTitle', t('brand_title'));
  setTxt('txtCertTag', t('cert_tag'));
  setTxt('btnModeSplit', t('split'));
  setTxt('btnModeUnik4', t('unik4'));
  setTxt('btnModeRoadbook', t('roadbook'));
  setTxt('btnModeMap', t('map'));
  setTxt('btnOpenPlanner', t('route_btn'));
  setTxt('btnOpenLexicon', t('lexicon_btn'));
  setTxt('btnToggleSim', t('sim_btn'));
  setTxt('lblSpeed', `${t('speed')} ⇄`);
  setTxt('lblValidated', t('validated'));
  setTxt('lblTargetWpt', t('target_wpt'));
  setTxt('lblCapGps', t('cap_gps'));
  setTxt('lblOdoTotal', t('odo_total'));
  setTxt('lblOdoPartiel', t('odo_partiel'));
  setTxt('lblChrono', t('chrono'));
  setTxt('lblAvgSpeed', t('avg_speed'));
  setTxt('lblMaxSpeed', t('max_speed'));
  setTxt('lblEta', t('eta'));
  setTxt('lblCtw', t('ctw'));
  setTxt('lblDtw', t('dtw'));
  setTxt('lblGps', t('gps'));
  setTxt('lblAlt', t('alt'));
  setTxt('lblSlope', t('slope'));
  setTxt('thDistances', t('distances'));
  setTxt('thTulip', t('tulip'));
  setTxt('thLexicon', t('notes_symbols'));
  setTxt('btnLayerSat', t('satellite'));
  setTxt('btnLayerTopo', t('terrain'));
  setTxt('btnLayerRoad', t('streets'));
  setTxt('btnRecenterCar', t('recenter'));
  setTxt('lblPointA', t('point_a'));
  setTxt('lblPointB', t('point_b'));
  setTxt('btnCalculateRoute', t('find_routes'));
  setTxt('lblSelectRoute', t('select_route'));
  setTxt('btnConfirmSelectedRoute', t('generate_roadbook'));

  if (!state.currentStage) {
    setTxt('rbStageTitle', t('no_stage'));
  }
}

function renderLanguageOptions() {
  const container = document.getElementById('languageOptionsList');
  if (!container) return;
  container.innerHTML = '';

  APP_LANGUAGES.forEach(lang => {
    const row = document.createElement('div');
    row.style.display = 'flex';
    row.style.alignItems = 'center';
    row.style.gap = '12px';
    row.style.padding = '10px 14px';
    row.style.background = '#1a1a1f';
    row.style.border = '1px solid #333';
    row.style.borderRadius = '6px';
    row.style.cursor = 'pointer';
    row.style.color = '#FFF';

    row.innerHTML = `
      <span style="font-size: 24px;">${lang.flag}</span>
      <span style="font-size: 15px; font-weight: 800; flex: 1;">${lang.name}</span>
      <span style="font-size: 12px; color: #888;">${lang.code.toUpperCase()}</span>
    `;

    row.onclick = () => {
      applyLanguage(lang.code);
      document.getElementById('languageModal').style.display = 'none';
    };

    container.appendChild(row);
  });
}

function initMap() {
  const mapElem = document.getElementById('satelliteMap');
  if (!mapElem) return;

  state.map = L.map('satelliteMap', {
    zoomControl: false,
    attributionControl: false
  }).setView([20.0, 0.0], 3);

  L.control.zoom({ position: 'bottomright' }).addTo(state.map);

  state.mapLayers.satellite = L.tileLayer('https://server.arcgisonline.com/ArcGIS/rest/services/World_Imagery/MapServer/tile/{z}/{y}/{x}', {
    maxZoom: 19
  });

  state.mapLayers.terrain = L.tileLayer('https://{s}.tile.opentopomap.org/{z}/{x}/{y}.png', {
    maxZoom: 17
  });

  state.mapLayers.streets = L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
    maxZoom: 19
  });

  state.mapLayers.satellite.addTo(state.map);

  const carIcon = L.divIcon({
    className: 'rally-car-marker',
    html: `
      <div class="rally-car-hud" id="carMarkerHud">
        <div class="car-heading-cone" id="carHeadingCone"></div>
        <div class="car-dot"></div>
      </div>
    `,
    iconSize: [40, 40],
    iconAnchor: [20, 20]
  });

  state.carMarker = L.marker([0, 0], { icon: carIcon }).addTo(state.map);
}

function startChronoTicker() {
  setInterval(() => {
    if (state.telemetry.startTime) {
      state.telemetry.elapsedSeconds = Math.floor((Date.now() - state.telemetry.startTime) / 1000);
      const hours = Math.floor(state.telemetry.elapsedSeconds / 3600);
      const mins = Math.floor((state.telemetry.elapsedSeconds % 3600) / 60);
      const secs = state.telemetry.elapsedSeconds % 60;
      document.getElementById('telemetryChrono').textContent = 
        `${String(hours).padStart(2, '0')}:${String(mins).padStart(2, '0')}:${String(secs).padStart(2, '0')}`;

      if (state.telemetry.elapsedSeconds > 0) {
        state.telemetry.avgSpeedKmh = (state.telemetry.totalOdoKM / (state.telemetry.elapsedSeconds / 3600));
        const unitLabel = state.telemetry.speedUnit;
        const avgDisplay = unitLabel === 'mph' ? (state.telemetry.avgSpeedKmh * 0.621371) : state.telemetry.avgSpeedKmh;
        document.getElementById('telemetryAvgSpeed').textContent = `${avgDisplay.toFixed(1)} ${unitLabel}`;
      }
    }
  }, 1000);
}

function loadStage(stage) {
  state.currentStage = stage;
  state.routeCoordinates = stage.coordinates;
  state.currentNoteIndex = 0;

  state.telemetry.totalOdoKM = 0.0;
  state.telemetry.partialOdoKM = 0.0;
  state.telemetry.validatedCount = 0;
  state.telemetry.startTime = Date.now();
  state.telemetry.maxSpeedKmh = 0;
  state.telemetry.avgSpeedKmh = 0;

  document.getElementById('rbStageTitle').textContent = stage.title;
  document.getElementById('rbMetaDst').textContent = `DST: ${stage.totalDistanceKM} km`;
  document.getElementById('rbMetaWp').textContent = `WP: ${stage.waypointCount}`;
  document.getElementById('rbMetaCp').textContent = `CP: ${stage.controlPointCount}`;
  const footStage = document.getElementById('telemStageFoot');
  if (footStage) footStage.textContent = `${stage.title} - ${stage.totalDistanceKM} km`;

  if (stage.notes && stage.notes.length > 0) {
    const firstNote = stage.notes[0];
    state.telemetry.latitude = firstNote.lat;
    state.telemetry.longitude = firstNote.lon;
    state.telemetry.headingDeg = firstNote.cap;
    state.telemetry.altitudeM = firstNote.alt;
    state.telemetry.targetWptNum = firstNote.id;
    state.telemetry.targetWptName = firstNote.wptName || `WPT ${firstNote.id}`;
    state.telemetry.activeSpeedLimit = firstNote.speedLimit;
  }

  renderRoadbookTable(stage.notes);
  renderMapRoute(stage.coordinates, stage.notes);
  updateTelemetry();
}

function renderRoadbookTable(notes) {
  const tbody = document.getElementById('roadbookBody');
  tbody.innerHTML = '';

  notes.forEach((note, index) => {
    const tr = document.createElement('tr');
    tr.className = `note-row ${note.isBiffed ? 'biffed' : ''} ${index === 0 ? 'active' : ''}`;
    tr.id = `noteRow_${note.id}`;
    tr.onclick = () => {
      state.currentNoteIndex = index;
      selectCurrentNote(index);
    };

    const tdDist = document.createElement('td');
    tdDist.className = 'col-distance';
    tdDist.innerHTML = `
      <div class="note-num">#${note.id}</div>
      <div class="odo-total-num">${note.totalKM.toFixed(2)}</div>
      <div class="odo-partial-num">${note.partialKM.toFixed(2)}</div>
    `;

    const tdTulip = document.createElement('td');
    tdTulip.className = 'col-tulip';
    tdTulip.innerHTML = renderTulipSVG(note);

    const tdLex = document.createElement('td');
    tdLex.className = 'col-lexicon';
    
    let dangerBadges = '';
    if (note.danger === 1) dangerBadges += '<span class="danger-badge d1">!</span>';
    if (note.danger === 2) dangerBadges += '<span class="danger-badge d2">!!</span>';
    if (note.danger === 3) dangerBadges += '<span class="danger-badge d3">!!!</span>';

    let speedBadge = '';
    if (note.speedLimit) {
      speedBadge = `<span class="speed-lim-badge">SL ${note.speedLimit}</span>`;
    }

    const lexiconBadges = (note.lexicon || []).map(code => `<span class="lex-pill">${code}</span>`).join(' ');

    tdLex.innerHTML = `
      <div class="lex-top-row">
        ${renderWptStamp(note.wptType)}
        ${dangerBadges}
        ${speedBadge}
      </div>
      <div class="lex-badges-row">${lexiconBadges}</div>
      <div class="lex-text-comment">${note.text}</div>
    `;

    tr.appendChild(tdDist);
    tr.appendChild(tdTulip);
    tr.appendChild(tdLex);
    tbody.appendChild(tr);
  });
}

function renderTulipSVG(note) {
  let pathD = "M 90,85 L 90,45 L 140,25";
  let arrowHead = `<polygon points="140,20 152,28 138,34" fill="#000" />`;
  let dashAttr = note.isOffTrack ? 'stroke-dasharray="6,4"' : '';

  if (note.turnType === "straight") {
    pathD = "M 90,85 L 90,15";
    arrowHead = `<polygon points="84,20 90,8 96,20" fill="#000" />`;
  } else if (note.turnType === "right") {
    pathD = "M 90,85 L 90,50 L 145,50";
    arrowHead = `<polygon points="140,44 152,50 140,56" fill="#000" />`;
  } else if (note.turnType === "left") {
    pathD = "M 90,85 L 90,50 L 35,50";
    arrowHead = `<polygon points="40,44 28,50 40,56" fill="#000" />`;
  } else if (note.turnType === "slightRight") {
    pathD = "M 90,85 L 90,55 L 135,25";
    arrowHead = `<polygon points="132,20 144,28 132,34" fill="#000" />`;
  } else if (note.turnType === "slightLeft") {
    pathD = "M 90,85 L 90,55 L 45,25";
    arrowHead = `<polygon points="48,20 36,28 48,34" fill="#000" />`;
  }

  let duneShape = '';
  if (note.hasDuneRidge || (note.lexicon && note.lexicon.includes('DN'))) {
    duneShape = `
      <path d="M 30,55 Q 60,35 90,50 T 150,45 L 150,65 L 30,65 Z" fill="#D7D7D7" stroke="#999" stroke-width="1"/>
    `;
  }

  let secondaryBranch = '';
  if (note.secondaryBranchText) {
    secondaryBranch = `
      <text x="125" y="65" font-family="monospace" font-size="11" font-weight="900" fill="#000">${note.secondaryBranchText}</text>
    `;
  }

  return `
    <svg class="tulip-svg" viewBox="0 0 180 98">
      <rect width="180" height="98" fill="#FFF" />
      ${duneShape}
      <path d="${pathD}" fill="none" stroke="#000" stroke-width="3.8" ${dashAttr} />
      ${arrowHead}
      ${secondaryBranch}
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

function renderMapRoute(coords, notes) {
  if (!state.map) return;

  if (state.routePolyline) state.map.removeLayer(state.routePolyline);
  state.alternatePolylines.forEach(p => state.map.removeLayer(p));
  state.alternatePolylines = [];
  state.wptMarkers.forEach(m => state.map.removeLayer(m));
  state.wptMarkers = [];

  state.routePolyline = L.polyline(coords, {
    color: '#FF6D00',
    weight: 5,
    opacity: 0.95,
    smoothFactor: 1
  }).addTo(state.map);

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

function toggleNoteBiffage(index) {
  if (!state.currentStage || !state.currentStage.notes[index]) return;
  const note = state.currentStage.notes[index];
  note.isBiffed = !note.isBiffed;

  const row = document.getElementById(`noteRow_${note.id}`);
  if (row) {
    row.classList.toggle('biffed', note.isBiffed);
  }
}

function updateTelemetry() {
  const t = state.telemetry;
  const speedDisplay = t.speedUnit === 'mph' ? Math.round(t.speedKmh * 0.621371) : Math.round(t.speedKmh);

  document.getElementById('telemetrySpeed').textContent = speedDisplay;
  document.getElementById('telemetrySpeedUnit').textContent = t.speedUnit;
  document.getElementById('telemetryHeading').textContent = `${Math.round(t.headingDeg)}°`;
  document.getElementById('telemetryOdoTotal').textContent = t.totalOdoKM.toFixed(2);
  document.getElementById('telemetryOdoPartiel').textContent = t.partialOdoKM.toFixed(2);
  document.getElementById('telemetryValidated').textContent = t.validatedCount;
  document.getElementById('telemetryWptNum').textContent = t.targetWptNum;
  document.getElementById('telemetryWptName').textContent = t.targetWptName;
  document.getElementById('telemetryDtw').textContent = t.dtwKM.toFixed(2);
  document.getElementById('telemetryCtw').textContent = `${Math.round(t.ctwDeg)}°`;
  
  if (t.latitude !== 0 || t.longitude !== 0) {
    document.getElementById('telemetryCoords').textContent = `${t.latitude.toFixed(4)}°, ${t.longitude.toFixed(4)}°`;
  } else {
    document.getElementById('telemetryCoords').textContent = '--';
  }

  document.getElementById('telemetryAlt').textContent = `${Math.round(t.altitudeM)} m`;
  document.getElementById('telemetrySlope').textContent = `${t.slopeDeg > 0 ? '+' : ''}${t.slopeDeg.toFixed(1)}°`;

  const nextElem = document.getElementById('telemNextDist');
  if (nextElem) nextElem.textContent = `NEXT ${t.dtwKM.toFixed(2)}`;
  const footCap = document.getElementById('telemFootCap');
  if (footCap) footCap.textContent = `Cap ${Math.round(t.ctwDeg)}°`;

  const arrow = document.getElementById('steeringArrow');
  if (arrow) {
    arrow.style.transform = `rotate(${t.relativeBearingDeg}deg)`;
  }

  const cone = document.getElementById('carHeadingCone');
  if (cone) {
    cone.style.transform = `rotate(${t.headingDeg}deg)`;
  }
  if (state.carMarker && (t.latitude !== 0 || t.longitude !== 0)) {
    state.carMarker.setLatLng([t.latitude, t.longitude]);
  }

  const alertBox = document.getElementById('speedZoneAlert');
  if (t.activeSpeedLimit) {
    alertBox.style.display = 'flex';
    document.getElementById('zoneCurSpeed').textContent = speedDisplay;
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

let simInterval = null;
let simProgress = 0;

function startSimulation() {
  if (!state.routeCoordinates || state.routeCoordinates.length < 2) return;
  state.telemetry.isSimulating = true;
  document.getElementById('simBanner').style.display = 'flex';

  simInterval = setInterval(() => {
    simProgress += 0.008 * state.telemetry.simSpeedMult;
    if (simProgress >= state.routeCoordinates.length - 1) {
      simProgress = 0;
    }

    const curIdx = Math.floor(simProgress);
    const nextIdx = Math.min(curIdx + 1, state.routeCoordinates.length - 1);
    const frac = simProgress - curIdx;

    const p1 = state.routeCoordinates[curIdx];
    const p2 = state.routeCoordinates[nextIdx];

    const lat = p1[0] + (p2[0] - p1[0]) * frac;
    const lon = p1[1] + (p2[1] - p1[1]) * frac;

    const heading = calculateBearing(p1[0], p1[1], p2[0], p2[1]);
    state.telemetry.latitude = lat;
    state.telemetry.longitude = lon;
    state.telemetry.headingDeg = heading;
    state.telemetry.speedKmh = (75 + Math.sin(simProgress * 10) * 15) * state.telemetry.simSpeedMult;
    state.telemetry.altitudeM = 420 + Math.sin(simProgress * 5) * 45;
    state.telemetry.slopeDeg = Math.sin(simProgress * 8) * 4;

    if (state.telemetry.speedKmh > state.telemetry.maxSpeedKmh) {
      state.telemetry.maxSpeedKmh = state.telemetry.speedKmh;
      const unitLabel = state.telemetry.speedUnit;
      const maxDisplay = unitLabel === 'mph' ? (state.telemetry.maxSpeedKmh * 0.621371) : state.telemetry.maxSpeedKmh;
      document.getElementById('telemetryMaxSpeed').textContent = `${Math.round(maxDisplay)} ${unitLabel}`;
    }

    const deltaKM = (state.telemetry.speedKmh / 3600) * 0.2;
    state.telemetry.totalOdoKM += deltaKM;
    state.telemetry.partialOdoKM += deltaKM;

    if (state.currentStage && state.currentStage.notes[state.currentNoteIndex]) {
      const targetNote = state.currentStage.notes[state.currentNoteIndex];
      const distM = getDistanceMeters(lat, lon, targetNote.lat, targetNote.lon);
      state.telemetry.dtwKM = distM / 1000;
      state.telemetry.ctwDeg = calculateBearing(lat, lon, targetNote.lat, targetNote.lon);

      let diff = state.telemetry.ctwDeg - state.telemetry.headingDeg;
      while (diff > 180) diff -= 360;
      while (diff < -180) diff += 360;
      state.telemetry.relativeBearingDeg = diff;

      if (distM < 60 && !targetNote.isBiffed) {
        targetNote.isBiffed = true;
        state.telemetry.validatedCount++;
        audio.playWaypointChirp();

        const row = document.getElementById(`noteRow_${targetNote.id}`);
        if (row) row.classList.add('biffed');

        if (state.currentNoteIndex < state.currentStage.notes.length - 1) {
          state.currentNoteIndex++;
          state.telemetry.partialOdoKM = 0;
          const nextNote = state.currentStage.notes[state.currentNoteIndex];
          state.telemetry.targetWptNum = nextNote.id;
          state.telemetry.targetWptName = nextNote.wptName || `WPT ${nextNote.id}`;
          state.telemetry.activeSpeedLimit = nextNote.speedLimit;

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

function selectCurrentNote(idx) {
  if (!state.currentStage || !state.currentStage.notes[idx]) return;
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

function setupUIEventListeners() {
  document.querySelectorAll('.mode-btn').forEach(btn => {
    btn.onclick = () => {
      document.querySelectorAll('.mode-btn').forEach(b => b.classList.remove('active'));
      btn.classList.add('active');
      const mode = btn.dataset.mode;
      document.body.className = `mode-${mode}`;
      if (state.map) setTimeout(() => state.map.invalidateSize(), 200);
    };
  });

  document.getElementById('btnToggleSpeedUnit').onclick = () => {
    state.telemetry.speedUnit = state.telemetry.speedUnit === 'km/h' ? 'mph' : 'km/h';
    updateTelemetry();
  };

  document.getElementById('btnOpenLanguageModal').onclick = () => {
    document.getElementById('languageModal').style.display = 'flex';
  };
  document.getElementById('btnCloseLanguageModal').onclick = () => {
    document.getElementById('languageModal').style.display = 'none';
  };

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

  document.getElementById('btnOpenPlanner').onclick = () => {
    document.getElementById('routeModal').style.display = 'flex';
  };
  document.getElementById('btnCloseRouteModal').onclick = () => {
    document.getElementById('routeModal').style.display = 'none';
  };

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

  document.getElementById('btnLayerSat').onclick = () => {
    switchMapLayer('satellite', 'btnLayerSat');
  };
  document.getElementById('btnLayerTopo').onclick = () => {
    switchMapLayer('terrain', 'btnLayerTopo');
  };
  document.getElementById('btnLayerRoad').onclick = () => {
    switchMapLayer('streets', 'btnLayerRoad');
  };

  document.getElementById('btnRecenterCar').onclick = () => {
    if (state.map && (state.telemetry.latitude !== 0 || state.telemetry.longitude !== 0)) {
      state.map.setView([state.telemetry.latitude, state.telemetry.longitude], 14);
    }
  };

  document.getElementById('btnCalculateRoute').onclick = () => {
    const fromVal = document.getElementById('inputPointA').value.trim();
    const toVal = document.getElementById('inputPointB').value.trim();
    if (!toVal) {
      alert("Please enter a destination Point B.");
      return;
    }
    findAlternativeRoutes(fromVal, toVal);
  };

  document.getElementById('btnConfirmSelectedRoute').onclick = () => {
    generateRoadbookForCandidate(state.selectedCandidateIndex);
  };

  setupAutocomplete('inputPointA', 'suggestPointA');
  setupAutocomplete('inputPointB', 'suggestPointB');
}

function setupAutocomplete(inputId, dropdownId) {
  const input = document.getElementById(inputId);
  const dropdown = document.getElementById(dropdownId);
  if (!input || !dropdown) return;
  let debounceTimer = null;

  input.addEventListener('input', () => {
    clearTimeout(debounceTimer);
    const query = input.value.trim();
    if (query.length < 2) {
      dropdown.style.display = 'none';
      dropdown.innerHTML = '';
      return;
    }
    debounceTimer = setTimeout(async () => {
      try {
        const res = await fetch(`https://nominatim.openstreetmap.org/search?format=json&q=${encodeURIComponent(query)}&limit=5`);
        const data = await res.json();
        dropdown.innerHTML = '';
        if (data && data.length) {
          data.forEach(item => {
            const row = document.createElement('div');
            row.className = 'autocomplete-item';
            const parts = item.display_name.split(',');
            const mainTitle = parts[0];
            const subTitle = parts.slice(1, 3).join(', ');
            row.innerHTML = `
              <span>📍</span>
              <span class="autocomplete-item-title">${mainTitle}</span>
              <span class="autocomplete-item-sub">${subTitle}</span>
            `;
            row.onclick = () => {
              input.value = item.display_name;
              dropdown.style.display = 'none';
              dropdown.innerHTML = '';
            };
            dropdown.appendChild(row);
          });
          dropdown.style.display = 'block';
        } else {
          dropdown.style.display = 'none';
        }
      } catch (e) {
        dropdown.style.display = 'none';
      }
    }, 250);
  });

  document.addEventListener('click', (e) => {
    if (!input.contains(e.target) && !dropdown.contains(e.target)) {
      dropdown.style.display = 'none';
    }
  });
}

function switchMapLayer(layerName, btnId) {
  if (!state.map) return;
  Object.values(state.mapLayers).forEach(l => state.map.removeLayer(l));
  if (state.mapLayers[layerName]) {
    state.mapLayers[layerName].addTo(state.map);
  }
  document.querySelectorAll('.layer-btn').forEach(b => b.classList.remove('active'));
  const btn = document.getElementById(btnId);
  if (btn) btn.classList.add('active');
}

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

async function findAlternativeRoutes(fromQuery, toQuery) {
  const btn = document.getElementById('btnCalculateRoute');
  btn.textContent = 'FINDING ROUTES...';

  try {
    let startLat = state.telemetry.latitude;
    let startLon = state.telemetry.longitude;

    if (fromQuery && fromQuery.toLowerCase() !== "current location") {
      const fromGeo = await fetch(`https://nominatim.openstreetmap.org/search?format=json&q=${encodeURIComponent(fromQuery)}`).then(r => r.json());
      if (!fromGeo.length) {
        alert(`Could not find departure location: "${fromQuery}"`);
        btn.textContent = t('find_routes');
        return;
      }
      startLat = parseFloat(fromGeo[0].lat);
      startLon = parseFloat(fromGeo[0].lon);
    }

    const toGeo = await fetch(`https://nominatim.openstreetmap.org/search?format=json&q=${encodeURIComponent(toQuery)}`).then(r => r.json());
    if (!toGeo.length) {
      alert(`Could not find destination location: "${toQuery}"`);
      btn.textContent = t('find_routes');
      return;
    }
    const endLat = parseFloat(toGeo[0].lat);
    const endLon = parseFloat(toGeo[0].lon);

    const routeUrl = `https://router.project-osrm.org/route/v1/driving/${startLon},${startLat};${endLon},${endLat}?overview=full&geometries=geojson&steps=true&alternatives=true`;
    const routeRes = await fetch(routeUrl).then(r => r.json());

    if (!routeRes.routes || !routeRes.routes.length) {
      alert("No route found between points.");
      btn.textContent = t('find_routes');
      return;
    }

    state.candidateRoutes = routeRes.routes.map((r, idx) => {
      const distKM = parseFloat((r.distance / 1000).toFixed(1));
      const durMin = Math.round(r.duration / 60);
      const label = idx === 0 ? "Route 1 (Shortest Raid Track)" : (idx === 1 ? "Route 2 (Alternate Dune Track)" : `Route ${idx + 1} (Main Road Track)`);
      return {
        id: idx,
        name: `${label} • ${distKM} km • ${durMin} min`,
        rawRoute: r,
        fromLabel: fromQuery || "CURRENT GPS",
        toLabel: toQuery
      };
    });

    state.selectedCandidateIndex = 0;
    renderCandidateRoutesList();

    btn.textContent = t('find_routes');

  } catch (err) {
    console.error(err);
    alert("Error searching routes: " + err.message);
    btn.textContent = t('find_routes');
  }
}

function renderCandidateRoutesList() {
  const container = document.getElementById('alternateRoutesContainer');
  const list = document.getElementById('alternateRoutesList');
  if (!container || !list) return;

  container.style.display = 'block';
  list.innerHTML = '';

  state.candidateRoutes.forEach((cand, idx) => {
    const item = document.createElement('div');
    item.style.padding = '10px';
    item.style.border = idx === state.selectedCandidateIndex ? '2px solid #FF6D00' : '1px solid #444';
    item.style.background = idx === state.selectedCandidateIndex ? '#222' : '#111';
    item.style.borderRadius = '6px';
    item.style.cursor = 'pointer';
    item.style.color = '#FFF';
    item.style.fontSize = '12px';
    item.style.fontWeight = 'bold';
    item.innerHTML = `
      <div style="display: flex; justify-content: space-between; align-items: center;">
        <span>${cand.name}</span>
        <span>${idx === state.selectedCandidateIndex ? '✅' : '⚪'}</span>
      </div>
    `;
    item.onclick = () => {
      state.selectedCandidateIndex = idx;
      renderCandidateRoutesList();
    };
    list.appendChild(item);
  });
}

function generateRoadbookForCandidate(candidateIndex) {
  const cand = state.candidateRoutes[candidateIndex] || state.candidateRoutes[0];
  if (!cand) return;

  const route = cand.rawRoute;
  const coords = route.geometry.coordinates.map(c => [c[1], c[0]]);

  const notes = [];
  let runningDistKM = 0.0;
  let noteId = 1;

  notes.push({
    id: noteId++,
    totalKM: 0.00,
    partialKM: 0.00,
    cap: Math.round(calculateBearing(coords[0][0], coords[0][1], coords[1][0], coords[1][1])),
    turnType: "straight",
    isOffTrack: false,
    wptType: "START",
    wptName: "DSS 01",
    danger: 0,
    speedLimit: 100,
    lexicon: ["START", "DZ", "PP"],
    text: "DEPART SS - FOLLOW TRACES",
    lat: coords[0][0],
    lon: coords[0][1],
    alt: 350,
    isBiffed: false
  });

  if (route.legs && route.legs[0] && route.legs[0].steps) {
    route.legs[0].steps.forEach((step, idx) => {
      if (step.distance < 40) return;
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
        speedLim = 100;
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
  }

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
    title: `${cand.fromLabel.toUpperCase()} ➔ ${cand.toLabel.toUpperCase()}`,
    totalDistanceKM: parseFloat((route.distance / 1000).toFixed(1)),
    waypointCount: notes.length,
    controlPointCount: notes.filter(n => n.wptType === 'WPC' || n.wptType === 'CP').length,
    coordinates: coords,
    notes: notes
  };

  loadStage(customStage);
  document.getElementById('routeModal').style.display = 'none';
}
