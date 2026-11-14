export enum WaypointType {
  START = 'START',
  FINISH = 'FINISH',
  WPC = 'WPC',
  WPS = 'WPS',
  WPM = 'WPM',
  WPE = 'WPE',
  DZ = 'DZ',
  FZ = 'FZ',
  CP = 'CP'
}

export enum TurnType {
  STRAIGHT = 'straight',
  SLIGHT_RIGHT = 'slightRight',
  RIGHT = 'right',
  SHARP_RIGHT = 'sharpRight',
  SLIGHT_LEFT = 'slightLeft',
  LEFT = 'left',
  SHARP_LEFT = 'sharpLeft',
  OFF_TRACK_STRAIGHT = 'offTrackStraight'
}

export interface RoadbookNote {
  id: number;
  totalKM: number;
  partialKM: number;
  cap: number;
  turnType: TurnType;
  isOffTrack: boolean;
  wptType: WaypointType;
  wptName: string;
  danger: number;
  speedLimit: number | null;
  lexicon: string[];
  text: string;
  lat: number;
  lon: number;
  alt: number;
  isBiffed: boolean;
}

export interface DakarStage {
  title: string;
  totalDistanceKM: number;
  waypointCount: number;
  controlPointCount: number;
  coordinates: number[][];
  notes: RoadbookNote[];
}

export interface TelemetryData {
  speedKmh: number;
  speedUnit: string;
  headingDeg: number;
  latitude: number;
  longitude: number;
  altitudeM: number;
  slopeDeg: number;
  totalOdoKM: number;
  partialOdoKM: number;
  validatedCount: number;
  targetWptNum: number;
  targetWptName: string;
  dtwKM: number;
  ctwDeg: number;
  activeSpeedLimit: number | null;
  isSpeedExceeded: boolean;
  elapsedSeconds: number;
  maxSpeedKmh: number;
  avgSpeedKmh: number;
}
