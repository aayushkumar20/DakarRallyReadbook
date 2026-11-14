package com.dakar.rallyroadbook.models

enum class WaypointType {
    START, FINISH, WPC, WPS, WPM, WPE, DZ, FZ, CP
}

enum class TurnType {
    STRAIGHT, SLIGHT_RIGHT, RIGHT, SHARP_RIGHT, SLIGHT_LEFT, LEFT, SHARP_LEFT, OFF_TRACK_STRAIGHT
}

data class RoadbookNote(
    val id: Int,
    val totalKM: Double,
    val partialKM: Double,
    val cap: Int,
    val turnType: TurnType,
    val isOffTrack: Boolean,
    val wptType: WaypointType,
    val wptName: String,
    val danger: Int,
    val speedLimit: Int? = null,
    val lexicon: List<String> = emptyList(),
    val text: String = "",
    val lat: Double,
    val lon: Double,
    val alt: Double,
    var isBiffed: Boolean = false
)

data class DakarStage(
    val title: String,
    val totalDistanceKM: Double,
    val waypointCount: Int,
    val controlPointCount: Int,
    val coordinates: List<Pair<Double, Double>>,
    val notes: List<RoadbookNote>
)

data class TelemetryState(
    var speedKmh: Double = 78.4,
    var speedUnit: String = "km/h",
    var headingDeg: Int = 74,
    var latitude: Double = 26.6136,
    var longitude: Double = 37.9244,
    var altitudeM: Double = 685.0,
    var slopeDeg: Double = 3.5,
    var totalOdoKM: Double = 12.40,
    var partialOdoKM: Double = 12.40,
    var validatedCount: Int = 1,
    var targetWptNum: Int = 2,
    var targetWptName: String = "WPM 01 (CANYON EXIT)",
    var dtwKM: Double = 6.0,
    var ctwDeg: Int = 82,
    var activeSpeedLimit: Int? = 100,
    var isSpeedExceeded: Boolean = false,
    var elapsedSeconds: Long = 580,
    var maxSpeedKmh: Double = 124.6,
    var avgSpeedKmh: Double = 76.8
)
