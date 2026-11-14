package com.dakar.rallyroadbook.ui

import androidx.compose.foundation.background
import androidx.compose.foundation.layout.*
import androidx.compose.material3.Button
import androidx.compose.material3.ButtonDefaults
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp

@Composable
fun RemoteControlBar(
    onTripReset: () -> Unit,
    onOdoMinus: () -> Unit,
    onOdoPlus: () -> Unit,
    onNotePrev: () -> Unit,
    onNoteNext: () -> Unit
) {
    Row(
        modifier = Modifier
            .fillMaxWidth()
            .height(52.dp)
            .background(Color(0xFF121316))
            .padding(horizontal = 4.dp, vertical = 6.dp),
        horizontalArrangement = Arrangement.spacedBy(4.dp)
    ) {
        Button(
            onClick = {},
            modifier = Modifier.weight(1f).fillMaxHeight(),
            colors = ButtonDefaults.buttonColors(containerColor = Color(0xFFD32F2F)),
            contentPadding = PaddingValues(0.dp)
        ) {
            Text("ESC", fontSize = 10.sp, fontWeight = FontWeight.Bold)
        }

        Button(
            onClick = onTripReset,
            modifier = Modifier.weight(1.3f).fillMaxHeight(),
            colors = ButtonDefaults.buttonColors(containerColor = Color(0xFF7B1FA2)),
            contentPadding = PaddingValues(0.dp)
        ) {
            Text("TRIP RST", fontSize = 9.5.sp, fontWeight = FontWeight.Bold)
        }

        Button(
            onClick = onOdoMinus,
            modifier = Modifier.weight(1.1f).fillMaxHeight(),
            colors = ButtonDefaults.buttonColors(containerColor = Color(0xFF424242)),
            contentPadding = PaddingValues(0.dp)
        ) {
            Text("-0.10", fontSize = 10.sp, fontWeight = FontWeight.Bold)
        }

        Button(
            onClick = onOdoPlus,
            modifier = Modifier.weight(1.1f).fillMaxHeight(),
            colors = ButtonDefaults.buttonColors(containerColor = Color(0xFF424242)),
            contentPadding = PaddingValues(0.dp)
        ) {
            Text("+0.10", fontSize = 10.sp, fontWeight = FontWeight.Bold)
        }

        Button(
            onClick = onNotePrev,
            modifier = Modifier.weight(1.1f).fillMaxHeight(),
            colors = ButtonDefaults.buttonColors(containerColor = Color(0xFF1976D2)),
            contentPadding = PaddingValues(0.dp)
        ) {
            Text("NOTE -", fontSize = 9.5.sp, fontWeight = FontWeight.Bold)
        }

        Button(
            onClick = onNoteNext,
            modifier = Modifier.weight(1.1f).fillMaxHeight(),
            colors = ButtonDefaults.buttonColors(containerColor = Color(0xFF1976D2)),
            contentPadding = PaddingValues(0.dp)
        ) {
            Text("NOTE +", fontSize = 9.5.sp, fontWeight = FontWeight.Bold)
        }

        Button(
            onClick = {},
            modifier = Modifier.weight(1f).fillMaxHeight(),
            colors = ButtonDefaults.buttonColors(containerColor = Color(0xFF2E7D32)),
            contentPadding = PaddingValues(0.dp)
        ) {
            Text("OK", fontSize = 10.sp, fontWeight = FontWeight.Bold)
        }
    }
}
