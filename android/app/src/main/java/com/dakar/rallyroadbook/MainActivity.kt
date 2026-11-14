package com.dakar.rallyroadbook

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.compose.foundation.background
import androidx.compose.foundation.layout.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import com.dakar.rallyroadbook.models.TelemetryState
import com.dakar.rallyroadbook.services.TelemetryService
import com.dakar.rallyroadbook.ui.LexiconDialog
import com.dakar.rallyroadbook.ui.RemoteControlBar
import com.dakar.rallyroadbook.ui.RoadbookTable
import com.dakar.rallyroadbook.ui.Unik4Cockpit
import com.dakar.rallyroadbook.ui.theme.DakarRallyTheme
import kotlinx.coroutines.delay

class MainActivity : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContent {
            DakarRallyTheme {
                DakarMainScreen()
            }
        }
    }
}

@Composable
fun DakarMainScreen() {
    val stage = remember { TelemetryService.defaultStage }
    var activeNoteIndex by remember { mutableStateOf(0) }
    var viewMode by remember { mutableStateOf("split") } // split | unik4 | roadbook
    var showLexicon by remember { mutableStateOf(false) }

    var telemetry by remember { mutableStateOf(TelemetryState()) }

    // Simulation ticker
    LaunchedEffect(Unit) {
        while (true) {
            delay(1000)
            telemetry = telemetry.copy(
                elapsedSeconds = telemetry.elapsedSeconds + 1,
                totalOdoKM = telemetry.totalOdoKM + (telemetry.speedKmh / 3600.0),
                partialOdoKM = telemetry.partialOdoKM + (telemetry.speedKmh / 3600.0)
            )
        }
    }

    Scaffold(
        modifier = Modifier.fillMaxSize(),
        containerColor = Color.Black
    ) { innerPadding ->
        Column(
            modifier = Modifier
                .fillMaxSize()
                .padding(innerPadding)
        ) {
            // Header Bar
            Row(
                modifier = Modifier
                    .fillMaxWidth()
                    .height(44.dp)
                    .background(Color(0xFF121316))
                    .padding(horizontal = 10.dp),
                horizontalArrangement = Arrangement.SpaceBetween,
                verticalAlignment = Alignment.CenterVertically
            ) {
                // Dakar Title
                Row(verticalAlignment = Alignment.CenterVertically) {
                    Text("DAKAR", fontSize = 16.sp, fontWeight = FontWeight.Black, color = Color(0xFFFFE500))
                    Spacer(modifier = Modifier.width(4.dp))
                    Text("RALLY", fontSize = 16.sp, fontWeight = FontWeight.Black, color = Color.White)
                }

                // Mode Buttons
                Row(horizontalArrangement = Arrangement.spacedBy(4.dp)) {
                    Button(
                        onClick = { viewMode = "split" },
                        colors = ButtonDefaults.buttonColors(
                            containerColor = if (viewMode == "split") Color(0xFFFFE500) else Color(0xFF252834),
                            contentColor = if (viewMode == "split") Color.Black else Color.White
                        ),
                        contentPadding = PaddingValues(horizontal = 8.dp, vertical = 2.dp),
                        modifier = Modifier.height(28.dp)
                    ) {
                        Text("SPLIT", fontSize = 9.sp, fontWeight = FontWeight.Bold)
                    }

                    Button(
                        onClick = { viewMode = "unik4" },
                        colors = ButtonDefaults.buttonColors(
                            containerColor = if (viewMode == "unik4") Color(0xFFFFE500) else Color(0xFF252834),
                            contentColor = if (viewMode == "unik4") Color.Black else Color.White
                        ),
                        contentPadding = PaddingValues(horizontal = 8.dp, vertical = 2.dp),
                        modifier = Modifier.height(28.dp)
                    ) {
                        Text("UNIK4", fontSize = 9.sp, fontWeight = FontWeight.Bold)
                    }

                    Button(
                        onClick = { viewMode = "roadbook" },
                        colors = ButtonDefaults.buttonColors(
                            containerColor = if (viewMode == "roadbook") Color(0xFFFFE500) else Color(0xFF252834),
                            contentColor = if (viewMode == "roadbook") Color.Black else Color.White
                        ),
                        contentPadding = PaddingValues(horizontal = 8.dp, vertical = 2.dp),
                        modifier = Modifier.height(28.dp)
                    ) {
                        Text("ROADBOOK", fontSize = 9.sp, fontWeight = FontWeight.Bold)
                    }
                }

                // Lexicon Button
                Button(
                    onClick = { showLexicon = true },
                    colors = ButtonDefaults.buttonColors(containerColor = Color(0xFF1E88E5)),
                    contentPadding = PaddingValues(horizontal = 8.dp, vertical = 2.dp),
                    modifier = Modifier.height(28.dp)
                ) {
                    Text("📖 LEXICON", fontSize = 9.sp, fontWeight = FontWeight.Bold)
                }
            }

            // Main View Area
            Box(modifier = Modifier.weight(1f)) {
                when (viewMode) {
                    "split" -> {
                        Column(modifier = Modifier.fillMaxSize()) {
                            Unik4Cockpit(telemetry = telemetry)
                            Box(modifier = Modifier.weight(1f)) {
                                RoadbookTable(
                                    notes = stage.notes,
                                    activeNoteIndex = activeNoteIndex,
                                    onNoteClick = { activeNoteIndex = it }
                                )
                            }
                        }
                    }
                    "unik4" -> {
                        Unik4Cockpit(telemetry = telemetry)
                    }
                    else -> {
                        RoadbookTable(
                            notes = stage.notes,
                            activeNoteIndex = activeNoteIndex,
                            onNoteClick = { activeNoteIndex = it }
                        )
                    }
                }
            }

            // Remote Control Footer
            RemoteControlBar(
                onTripReset = {
                    telemetry = telemetry.copy(partialOdoKM = 0.0)
                },
                onOdoMinus = {
                    telemetry = telemetry.copy(totalOdoKM = maxOf(0.0, telemetry.totalOdoKM - 0.10))
                },
                onOdoPlus = {
                    telemetry = telemetry.copy(totalOdoKM = telemetry.totalOdoKM + 0.10)
                },
                onNotePrev = {
                    if (activeNoteIndex > 0) activeNoteIndex--
                },
                onNoteNext = {
                    if (activeNoteIndex < stage.notes.size - 1) activeNoteIndex++
                }
            )
        }
    }

    if (showLexicon) {
        LexiconDialog(onDismiss = { showLexicon = false })
    }
}
