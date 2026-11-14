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
import com.dakar.rallyroadbook.models.FIALexicon
import com.dakar.rallyroadbook.models.WaypointType

@Composable
fun FiaSymbolBadge(code: String) {
    val item = FIALexicon.item(code)
    val label = item?.en ?: code
    val (bgColor, borderColor) = getTagColors(code)

    Row(
        modifier = Modifier
            .background(bgColor, RoundedCornerShape(3.dp))
            .border(1.dp, borderColor, RoundedCornerShape(3.dp))
            .padding(horizontal = 5.dp, vertical = 2.dp),
        verticalAlignment = Alignment.CenterVertically
    ) {
        Text(
            text = code,
            fontSize = 10.sp,
            fontWeight = FontWeight.Black,
            fontFamily = FontFamily.Monospace,
            color = Color.Black
        )
        Spacer(modifier = Modifier.width(3.dp))
        Text(
            text = label,
            fontSize = 9.sp,
            fontWeight = FontWeight.Medium,
            color = Color(0xFF222222)
        )
    }
}

@Composable
fun WaypointStamp(wptType: WaypointType) {
    val (text, bgColor, textColor, borderColor) = when (wptType) {
        WaypointType.START -> Quadruple("START", Color.Black, Color(0xFFFFE500), Color.Black)
        WaypointType.FINISH -> Quadruple("ASS", Color.Black, Color.White, Color.Black)
        WaypointType.DZ -> Quadruple("DZ", Color(0xFF2E7D32), Color.White, Color(0xFF2E7D32))
        WaypointType.FZ -> Quadruple("FZ", Color(0xFF546E7A), Color.White, Color(0xFF546E7A))
        WaypointType.CP -> Quadruple("CP", Color.White, Color(0xFF7B1FA2), Color(0xFF7B1FA2))
        WaypointType.WPC -> Quadruple("WPC", Color.White, Color.Black, Color.Black)
        WaypointType.WPS -> Quadruple("WPS", Color.White, Color.Black, Color.Black)
        WaypointType.WPM -> Quadruple("WPM", Color.White, Color.Black, Color.Black)
        else -> Quadruple(wptType.name, Color.White, Color.Black, Color.Black)
    }

    Box(
        modifier = Modifier
            .size(26.dp)
            .background(bgColor, CircleShape)
            .border(1.5.dp, borderColor, CircleShape),
        contentAlignment = Alignment.Center
    ) {
        Text(
            text = text,
            fontSize = 7.5.sp,
            fontWeight = FontWeight.Black,
            color = textColor
        )
    }
}

private data class Quadruple<A, B, C, D>(val first: A, val second: B, val third: C, val fourth: D)

private fun getTagColors(code: String): Pair<Color, Color> {
    val c = code.uppercase()
    return when {
        c == "HP" -> Pair(Color(0xFFFFE0B2), Color(0xFFE65100))
        c == "DN" || c.startsWith("DN") || c == "SA" -> Pair(Color(0xFFFFF9C4), Color(0xFFFBC02D))
        c == "DZ" -> Pair(Color(0xFFC8E6C9), Color(0xFF2E7D32))
        c == "FZ" || c == "END_SL" -> Pair(Color(0xFFCFD8DC), Color(0xFF546E7A))
        c == "PP" || c == "2X" || c == "RD" || c == "G^D" -> Pair(Color(0xFFBBDEFB), Color(0xFF1976D2))
        c == "CP" -> Pair(Color(0xFFE1BEE7), Color(0xFF7B1FA2))
        c.contains("!") || c.startsWith("SL") -> Pair(Color(0xFFFFCDD2), Color(0xFFC62828))
        else -> Pair(Color(0xFFEEEEEE), Color(0xFF444444))
    }
}
