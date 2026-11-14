package com.dakar.rallyroadbook.ui.theme

import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.darkColorScheme
import androidx.compose.runtime.Composable
import androidx.compose.ui.graphics.Color

val DakarYellow = Color(0xFFFFE500)
val DakarDark = Color(0xFF121316)
val DakarBlack = Color(0xFF000000)
val DakarGreen = Color(0xFF00E676)
val DakarRed = Color(0xFFD32F2F)

private val DarkColorScheme = darkColorScheme(
    primary = DakarYellow,
    secondary = DakarGreen,
    background = DakarBlack,
    surface = DakarDark
)

@Composable
fun DakarRallyTheme(content: @Composable () -> Unit) {
    MaterialTheme(
        colorScheme = DarkColorScheme,
        content = content
    )
}
