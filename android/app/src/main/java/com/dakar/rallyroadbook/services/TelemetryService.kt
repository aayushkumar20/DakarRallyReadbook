package com.dakar.rallyroadbook.services

import com.dakar.rallyroadbook.models.DakarStage
import com.dakar.rallyroadbook.models.RoadbookNote
import com.dakar.rallyroadbook.models.TurnType
import com.dakar.rallyroadbook.models.WaypointType

object TelemetryService {
    val defaultStage: DakarStage = DakarStage(
        title = "STAGE 05: ALULA ➔ HA'IL (EMPTY QUARTER RAID)",
        totalDistanceKM = 418.5,
        waypointCount = 15,
        controlPointCount = 4,
        coordinates = listOf(
            Pair(26.6136, 37.9244),
            Pair(26.6520, 38.0820),
            Pair(26.7110, 38.3240),
            Pair(26.7850, 38.6410),
            Pair(26.8320, 38.8950),
            Pair(26.9140, 39.2450),
            Pair(27.0250, 39.7120),
            Pair(27.1420, 40.2310),
            Pair(27.2450, 40.6890),
            Pair(27.3320, 41.0540),
            Pair(27.4120, 41.3210),
            Pair(27.4650, 41.4890),
            Pair(27.4980, 41.6120),
            Pair(27.5140, 41.6720),
            Pair(27.5219, 41.6961)
        ),
        notes = listOf(
            RoadbookNote(
                id = 1, totalKM = 0.00, partialKM = 0.00, cap = 74,
                turnType = TurnType.STRAIGHT, isOffTrack = false, wptType = WaypointType.START,
                wptName = "DSS 01 (ALULA BIVOUAC)", danger = 0, speedLimit = 100,
                lexicon = listOf("START", "DZ", "PP"),
                text = "DEPART SS - FOLLOW MAIN TRACK INTO SANDSTONE CANYON",
                lat = 26.6136, lon = 37.9244, alt = 685.0
            ),
            RoadbookNote(
                id = 2, totalKM = 18.40, partialKM = 18.40, cap = 82,
                turnType = TurnType.SLIGHT_RIGHT, isOffTrack = true, wptType = WaypointType.WPM,
                wptName = "WPM 01 (CANYON EXIT)", danger = 1, speedLimit = null,
                lexicon = listOf("HP", "DN", "DN L1", "!"),
                text = "FORK RIGHT OFF-TRACK HP - NAVIGATE DUNES LEVEL 1",
                lat = 26.6520, lon = 38.0820, alt = 712.0
            ),
            RoadbookNote(
                id = 3, totalKM = 46.20, partialKM = 27.80, cap = 95,
                turnType = TurnType.STRAIGHT, isOffTrack = false, wptType = WaypointType.WPC,
                wptName = "WPC 01 (VALLEY PASS)", danger = 0, speedLimit = null,
                lexicon = listOf("WPC", "PP", "OND", "ORNI"),
                text = "WPC 01 VALIDATION - TRACK WITH NUMEROUS RUTS AND UNDULATIONS",
                lat = 26.7110, lon = 38.3240, alt = 745.0
            ),
            RoadbookNote(
                id = 4, totalKM = 84.70, partialKM = 38.50, cap = 88,
                turnType = TurnType.STRAIGHT, isOffTrack = false, wptType = WaypointType.DZ,
                wptName = "DZ 01 (TAYMA VILLAGE)", danger = 2, speedLimit = 50,
                lexicon = listOf("DZ", "VIL", "SL50", "!!"),
                text = "SLOW DOWN DZ 50 - VILLAGE APPROACH & CAMEL HERDS",
                lat = 26.7850, lon = 38.6410, alt = 760.0
            ),
            RoadbookNote(
                id = 5, totalKM = 98.30, partialKM = 13.60, cap = 76,
                turnType = TurnType.STRAIGHT, isOffTrack = false, wptType = WaypointType.FZ,
                wptName = "FZ 01 (VILLAGE EXIT)", danger = 0, speedLimit = null,
                lexicon = listOf("FZ", "PP", "END_SL"),
                text = "FIN ZONE VITESSE FZ - ACCELERATE ON MAIN TRACK",
                lat = 26.8320, lon = 38.8950, alt = 772.0
            ),
            RoadbookNote(
                id = 6, totalKM = 145.80, partialKM = 47.50, cap = 84,
                turnType = TurnType.STRAIGHT, isOffTrack = false, wptType = WaypointType.CP,
                wptName = "CP 01 (REFUELING / TIMING)", danger = 0, speedLimit = null,
                lexicon = listOf("CP", "CIT", "CLOCK"),
                text = "CP 1 - OFFICIAL TIME CONTROL & MARSHAL CHECKPOINT",
                lat = 26.9140, lon = 39.2450, alt = 790.0
            ),
            RoadbookNote(
                id = 7, totalKM = 198.60, partialKM = 52.80, cap = 102,
                turnType = TurnType.RIGHT, isOffTrack = false, wptType = WaypointType.WPM,
                wptName = "WPM 02 (WADI ES-SAHRA)", danger = 2, speedLimit = null,
                lexicon = listOf("WPM", "COMP", "SER", "!!"),
                text = "WPM 02 - TIGHT RIGHT AT ROCKY BLUFF - HEAVY COMPRESSION",
                lat = 27.0250, lon = 39.7120, alt = 835.0
            ),
            RoadbookNote(
                id = 8, totalKM = 242.10, partialKM = 43.50, cap = 78,
                turnType = TurnType.STRAIGHT, isOffTrack = false, wptType = WaypointType.WPC,
                wptName = "WPC 02 (PLATEAU DESCENT)", danger = 1, speedLimit = null,
                lexicon = listOf("WPC", "G^D", "DOWNHILL", "CAIL", "!"),
                text = "WPC 02 - FAST GRAVEL TRACK - STEEP DESCENT ON LOOSE STONES",
                lat = 27.1420, lon = 40.2310, alt = 865.0
            ),
            RoadbookNote(
                id = 9, totalKM = 289.40, partialKM = 47.30, cap = 90,
                turnType = TurnType.SLIGHT_LEFT, isOffTrack = true, wptType = WaypointType.WPS,
                wptName = "WPS 01 (GREAT NAFUD DUNES)", danger = 3, speedLimit = null,
                lexicon = listOf("WPS", "DN", "DN L2", "DN_CAS", "!!!"),
                text = "WPS 01 - DANGER 3 BROKEN DUNES - EXTREME CAUTION ON CRESTS",
                lat = 27.2450, lon = 40.6890, alt = 890.0
            ),
            RoadbookNote(
                id = 10, totalKM = 328.70, partialKM = 39.30, cap = 68,
                turnType = TurnType.LEFT, isOffTrack = false, wptType = WaypointType.WPM,
                wptName = "WPM 03 (OUED CROSSING)", danger = 1, speedLimit = null,
                lexicon = listOf("WPM", "RIO", "FOSS", "DIP", "!"),
                text = "WPM 03 - CROSS DRY OUED BED - AVOID HIDDEN DITCHES",
                lat = 27.3320, lon = 41.0540, alt = 915.0
            ),
            RoadbookNote(
                id = 11, totalKM = 362.50, partialKM = 33.80, cap = 74,
                turnType = TurnType.STRAIGHT, isOffTrack = false, wptType = WaypointType.DZ,
                wptName = "DZ 02 (NATURE SANCTUARY)", danger = 0, speedLimit = 100,
                lexicon = listOf("DZ", "ZS", "AF", "SL100"),
                text = "DZ 100 - SENSITIVE WILDLIFE RESERVE - SPEED LIMIT ENFORCED",
                lat = 27.4120, lon = 41.3210, alt = 940.0
            ),
            RoadbookNote(
                id = 12, totalKM = 378.10, partialKM = 15.60, cap = 80,
                turnType = TurnType.STRAIGHT, isOffTrack = false, wptType = WaypointType.FZ,
                wptName = "FZ 02 (END SANCTUARY)", danger = 0, speedLimit = null,
                lexicon = listOf("FZ", "2X", "END_SL"),
                text = "FZ - SPEED LIMIT ENDS - ACCELERATE ON DUAL CARRIAGEWAY",
                lat = 27.4650, lon = 41.4890, alt = 955.0
            ),
            RoadbookNote(
                id = 13, totalKM = 398.90, partialKM = 20.80, cap = 72,
                turnType = TurnType.RIGHT, isOffTrack = false, wptType = WaypointType.WPC,
                wptName = "WPC 03 (HA'IL PASS)", danger = 1, speedLimit = null,
                lexicon = listOf("WPC", "RUIN", "E3", "!"),
                text = "WPC 03 - PASS HISTORIC RUINS - TRACK NARROWS E3",
                lat = 27.4980, lon = 41.6120, alt = 975.0
            ),
            RoadbookNote(
                id = 14, totalKM = 412.30, partialKM = 13.40, cap = 70,
                turnType = TurnType.STRAIGHT, isOffTrack = false, wptType = WaypointType.WPS,
                wptName = "WPS 02 (APPROACH HA'IL)", danger = 0, speedLimit = null,
                lexicon = listOf("WPS", "PP", "PAN"),
                text = "WPS 02 - FINAL APPROACH - FOLLOW MARSHAL SIGNS",
                lat = 27.5140, lon = 41.6720, alt = 990.0
            ),
            RoadbookNote(
                id = 15, totalKM = 418.50, partialKM = 6.20, cap = 70,
                turnType = TurnType.STRAIGHT, isOffTrack = false, wptType = WaypointType.FINISH,
                wptName = "ASS 01 (HA'IL FINISH BEAM)", danger = 0, speedLimit = 30,
                lexicon = listOf("FINISH", "FZ", "SL30"),
                text = "ARRIVEE SPECIALE (ASS) - STOP AT OFFICIAL TIMING BEAM",
                lat = 27.5219, lon = 41.6961, alt = 1005.0
            )
        )
    )
}
