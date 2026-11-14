package com.dakar.rallyroadbook.ui

import androidx.compose.foundation.Canvas
import androidx.compose.foundation.background
import androidx.compose.foundation.border
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.geometry.Offset
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.graphics.Path
import androidx.compose.ui.graphics.PathEffect
import androidx.compose.ui.graphics.StrokeCap
import androidx.compose.ui.graphics.drawscope.Stroke
import androidx.compose.ui.text.font.FontFamily
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import com.dakar.rallyroadbook.models.RoadbookNote
import com.dakar.rallyroadbook.models.TurnType

@Composable
fun TulipVectorView(note: RoadbookNote) {
    Box(
        modifier = Modifier
            .width(160.dp)
            .height(98.dp)
            .background(Color.White)
    ) {
        Canvas(modifier = Modifier.fillMaxSize()) {
            val w = size.width
            val h = size.height
            val strokeWidth = 3.5f * density
            val pathEffect = if (note.isOffTrack) PathEffect.dashPathEffect(floatArrayOf(12f, 8f)) else null

            val start = Offset(w * 0.5f, h * 0.85f)
            val junction = Offset(w * 0.5f, h * 0.55f)

            // Incoming vertical track
            drawLine(
                color = Color.Black,
                start = start,
                end = junction,
                strokeWidth = strokeWidth,
                cap = StrokeCap.Round,
                pathEffect = pathEffect
            )

            // Turn arrow trajectory
            val path = Path()
            path.moveTo(junction.x, junction.y)

            when (note.turnType) {
                TurnType.STRAIGHT -> {
                    path.lineTo(w * 0.5f, h * 0.18f)
                    drawPath(path, Color.Black, style = Stroke(strokeWidth, pathEffect = pathEffect))
                    // Arrow head
                    val arrow = Path().apply {
                        moveTo(w * 0.5f, h * 0.10f)
                        lineTo(w * 0.5f - 14f, h * 0.22f)
                        lineTo(w * 0.5f + 14f, h * 0.22f)
                        close()
                    }
                    drawPath(arrow, Color.Black)
                }
                TurnType.RIGHT -> {
                    path.lineTo(w * 0.82f, junction.y)
                    drawPath(path, Color.Black, style = Stroke(strokeWidth, pathEffect = pathEffect))
                    val arrow = Path().apply {
                        moveTo(w * 0.90f, junction.y)
                        lineTo(w * 0.78f, junction.y - 14f)
                        lineTo(w * 0.78f, junction.y + 14f)
                        close()
                    }
                    drawPath(arrow, Color.Black)
                }
                TurnType.LEFT -> {
                    path.lineTo(w * 0.18f, junction.y)
                    drawPath(path, Color.Black, style = Stroke(strokeWidth, pathEffect = pathEffect))
                    val arrow = Path().apply {
                        moveTo(w * 0.10f, junction.y)
                        lineTo(w * 0.22f, junction.y - 14f)
                        lineTo(w * 0.22f, junction.y + 14f)
                        close()
                    }
                    drawPath(arrow, Color.Black)
                }
                TurnType.SLIGHT_RIGHT -> {
                    path.lineTo(w * 0.80f, h * 0.25f)
                    drawPath(path, Color.Black, style = Stroke(strokeWidth, pathEffect = pathEffect))
                    val arrow = Path().apply {
                        moveTo(w * 0.86f, h * 0.20f)
                        lineTo(w * 0.72f, h * 0.20f)
                        lineTo(w * 0.80f, h * 0.32f)
                        close()
                    }
                    drawPath(arrow, Color.Black)
                }
                TurnType.SLIGHT_LEFT -> {
                    path.lineTo(w * 0.20f, h * 0.25f)
                    drawPath(path, Color.Black, style = Stroke(strokeWidth, pathEffect = pathEffect))
                    val arrow = Path().apply {
                        moveTo(w * 0.14f, h * 0.20f)
                        lineTo(w * 0.28f, h * 0.20f)
                        lineTo(w * 0.20f, h * 0.32f)
                        close()
                    }
                    drawPath(arrow, Color.Black)
                }
                else -> {
                    path.lineTo(w * 0.5f, h * 0.18f)
                    drawPath(path, Color.Black, style = Stroke(strokeWidth, pathEffect = pathEffect))
                }
            }
        }

        // CAP compass heading badge
        if (note.cap > 0) {
            Box(
                modifier = Modifier
                    .align(Alignment.TopEnd)
                    .padding(4.dp)
                    .background(Color(0xFFFFE500), RoundedCornerShape(2.dp))
                    .border(1.dp, Color.Black, RoundedCornerShape(2.dp))
                    .padding(horizontal = 4.dp, vertical = 2.dp)
            ) {
                Text(
                    text = "CAP ${note.cap}°",
                    fontSize = 11.sp,
                    fontWeight = FontWeight.Black,
                    fontFamily = FontFamily.Monospace,
                    color = Color.Black
                )
            }
        }
    }
}
