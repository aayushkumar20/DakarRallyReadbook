package com.dakar.rallyroadbook.ui

import androidx.compose.foundation.background
import androidx.compose.foundation.border
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.text.font.FontFamily
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import com.dakar.rallyroadbook.models.TelemetryState

@Composable
fun Unik4Cockpit(telemetry: TelemetryState) {
    Column(
        modifier = Modifier
            .fillMaxWidth()
            .background(Color.Black)
    ) {
        // Top Plate
        Row(
            modifier = Modifier
                .fillMaxWidth()
                .background(Color(0xFF1A1C20))
                .padding(horizontal = 12.dp, vertical = 4.dp),
            horizontalArrangement = Arrangement.SpaceBetween,
            verticalAlignment = Alignment.CenterVertically
        ) {
            Text(
                text = "MEMO GPS UNIK4 RALLYE RAID",
                fontSize = 10.sp,
                fontWeight = FontWeight.Bold,
                color = Color.White
            )
            Text(
                text = "AUTO/CAMION",
                fontSize = 9.sp,
                fontWeight = FontWeight.Bold,
                color = Color(0xFFFFE500)
            )
            Box(
                modifier = Modifier
                    .size(8.dp)
                    .background(Color(0xFF00E676), CircleShape)
            )
        }

        // Inner Screen
        Column(
            modifier = Modifier
                .fillMaxWidth()
                .padding(6.dp)
                .background(Color(0xFF0D0E12), RoundedCornerShape(4.dp))
                .border(2.dp, Color(0xFF3A3F4D), RoundedCornerShape(4.dp))
        ) {
            // Speed, Validated, Target Wpt, Cap
            Row(
                modifier = Modifier
                    .fillMaxWidth()
                    .padding(8.dp)
                    .border(width = 1.dp, color = Color(0xFF2B2E38)),
                horizontalArrangement = Arrangement.SpaceBetween,
                verticalAlignment = Alignment.CenterVertically
            ) {
                // Speed
                Column {
                    Text("VITESSE", fontSize = 8.sp, color = Color(0xFF888888))
                    Row(verticalAlignment = Alignment.Bottom) {
                        Text(
                            text = "${telemetry.speedKmh.toInt()}",
                            fontSize = 34.sp,
                            fontWeight = FontWeight.Black,
                            fontFamily = FontFamily.Monospace,
                            color = Color(0xFF00E676)
                        )
                        Text(
                            text = "km/h",
                            fontSize = 10.sp,
                            color = Color(0xFFAAAAAA),
                            modifier = Modifier.padding(start = 4.dp, bottom = 4.dp)
                        )
                    }
                }

                // Validated
                Column(horizontalAlignment = Alignment.CenterHorizontally) {
                    Text("VALIDÉS", fontSize = 8.sp, color = Color(0xFF888888))
                    Text(
                        text = "${telemetry.validatedCount}/15",
                        fontSize = 20.sp,
                        fontWeight = FontWeight.Bold,
                        color = Color.White,
                        fontFamily = FontFamily.Monospace
                    )
                }

                // Target WP
                Column(horizontalAlignment = Alignment.CenterHorizontally) {
                    Text("POINT VISÉ", fontSize = 8.sp, color = Color(0xFF888888))
                    Text(
                        text = "WP ${telemetry.targetWptNum}",
                        fontSize = 20.sp,
                        fontWeight = FontWeight.Bold,
                        color = Color(0xFFFFE500),
                        fontFamily = FontFamily.Monospace
                    )
                }

                // Cap
                Box(
                    modifier = Modifier
                        .background(Color(0xFFFFE500), RoundedCornerShape(3.dp))
                        .padding(horizontal = 6.dp, vertical = 2.dp)
                ) {
                    Column(horizontalAlignment = Alignment.CenterHorizontally) {
                        Text("CAP GPS", fontSize = 7.sp, fontWeight = FontWeight.Bold, color = Color.Black)
                        Text(
                            text = "${telemetry.headingDeg}°",
                            fontSize = 20.sp,
                            fontWeight = FontWeight.Black,
                            fontFamily = FontFamily.Monospace,
                            color = Color.Black
                        )
                    }
                }
            }

            // Dual Odometers
            Row(
                modifier = Modifier
                    .fillMaxWidth()
                    .padding(vertical = 6.dp)
                    .border(width = 1.dp, color = Color(0xFF2B2E38)),
                horizontalArrangement = Arrangement.SpaceAround
            ) {
                Column(horizontalAlignment = Alignment.CenterHorizontally) {
                    Text("ODO TOTAL", fontSize = 9.sp, color = Color(0xFFAAAAAA))
                    Text(
                        text = String.format("%.2f", telemetry.totalOdoKM),
                        fontSize = 26.sp,
                        fontWeight = FontWeight.Black,
                        fontFamily = FontFamily.Monospace,
                        color = Color.White
                    )
                }

                Column(horizontalAlignment = Alignment.CenterHorizontally) {
                    Text("ODO PARTIEL", fontSize = 9.sp, color = Color(0xFFAAAAAA))
                    Text(
                        text = String.format("%.2f", telemetry.partialOdoKM),
                        fontSize = 26.sp,
                        fontWeight = FontWeight.Black,
                        fontFamily = FontFamily.Monospace,
                        color = Color(0xFFFFE500)
                    )
                }
            }

            // Chrono, V_MOY, V_MAX, DTW
            Row(
                modifier = Modifier
                    .fillMaxWidth()
                    .padding(6.dp),
                horizontalArrangement = Arrangement.SpaceAround
            ) {
                Column(horizontalAlignment = Alignment.CenterHorizontally) {
                    Text("CHRONO", fontSize = 8.sp, color = Color(0xFF888888))
                    Text(formatChrono(telemetry.elapsedSeconds), fontSize = 13.sp, fontWeight = FontWeight.Bold, color = Color.White)
                }
                Column(horizontalAlignment = Alignment.CenterHorizontally) {
                    Text("V_MOY", fontSize = 8.sp, color = Color(0xFF888888))
                    Text("${telemetry.avgSpeedKmh.toInt()} km/h", fontSize = 13.sp, fontWeight = FontWeight.Bold, color = Color.White)
                }
                Column(horizontalAlignment = Alignment.CenterHorizontally) {
                    Text("V_MAX", fontSize = 8.sp, color = Color(0xFF888888))
                    Text("${telemetry.maxSpeedKmh.toInt()} km/h", fontSize = 13.sp, fontWeight = FontWeight.Bold, color = Color.White)
                }
                Column(horizontalAlignment = Alignment.CenterHorizontally) {
                    Text("DTW", fontSize = 8.sp, color = Color(0xFF888888))
                    Text(String.format("%.1f km", telemetry.dtwKM), fontSize = 13.sp, fontWeight = FontWeight.Bold, color = Color(0xFF00E676))
                }
            }
        }
    }
}

private fun formatChrono(secs: Long): String {
    val h = secs / 3600
    val m = (secs % 3600) / 60
    val s = secs % 60
    return String.format("%02d:%02d:%02d", h, m, s)
}
