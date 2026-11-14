package com.dakar.rallyroadbook.ui

import androidx.compose.foundation.background
import androidx.compose.foundation.border
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.itemsIndexed
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
import com.dakar.rallyroadbook.models.RoadbookNote

@Composable
fun RoadbookTable(
    notes: List<RoadbookNote>,
    activeNoteIndex: Int,
    onNoteClick: (Int) -> Unit
) {
    Column(
        modifier = Modifier
            .fillMaxSize()
            .background(Color.Black)
    ) {
        // Table Header
        Row(
            modifier = Modifier
                .fillMaxWidth()
                .height(34.dp)
                .background(Color(0xFF1A1C22))
                .border(width = 1.dp, color = Color(0xFF333333)),
            verticalAlignment = Alignment.CenterVertically
        ) {
            Text(
                text = "DISTANCES",
                modifier = Modifier.width(110.dp),
                fontSize = 11.sp,
                fontWeight = FontWeight.Bold,
                color = Color.White,
                fontFamily = FontFamily.Monospace
            )
            Text(
                text = "DIAGRAMME TULIPE",
                modifier = Modifier.width(160.dp),
                fontSize = 11.sp,
                fontWeight = FontWeight.Bold,
                color = Color.White,
                fontFamily = FontFamily.Monospace
            )
            Text(
                text = "NOTES / SYMBOLES FIA",
                modifier = Modifier.weight(1f).padding(start = 8.dp),
                fontSize = 11.sp,
                fontWeight = FontWeight.Bold,
                color = Color.White,
                fontFamily = FontFamily.Monospace
            )
        }

        // Table Rows List
        LazyColumn(modifier = Modifier.fillMaxSize()) {
            itemsIndexed(notes) { index, note ->
                val isActive = index == activeNoteIndex
                val rowBg = if (isActive) Color(0xFFE3F2FD) else Color.White

                Row(
                    modifier = Modifier
                        .fillMaxWidth()
                        .height(100.dp)
                        .background(rowBg)
                        .border(width = 1.dp, color = Color.Black)
                        .clickable { onNoteClick(index) }
                ) {
                    // Col 1: Distances
                    Column(
                        modifier = Modifier
                            .width(110.dp)
                            .fillMaxHeight()
                            .padding(6.dp)
                            .border(width = 1.dp, color = Color.Black),
                        verticalArrangement = Arrangement.SpaceBetween,
                        horizontalAlignment = Alignment.End
                    ) {
                        Text(
                            text = String.format("%.2f", note.totalKM),
                            fontSize = 24.sp,
                            fontWeight = FontWeight.Black,
                            fontFamily = FontFamily.Monospace,
                            color = Color.Black
                        )
                        Row(
                            verticalAlignment = Alignment.Bottom,
                            horizontalArrangement = Arrangement.SpaceBetween,
                            modifier = Modifier.fillMaxWidth()
                        ) {
                            Box(
                                modifier = Modifier
                                    .background(Color.Black, RoundedCornerShape(2.dp))
                                    .padding(horizontal = 4.dp, vertical = 1.dp)
                            ) {
                                Text(
                                    text = "#${note.id}",
                                    fontSize = 10.sp,
                                    fontWeight = FontWeight.Black,
                                    color = Color.White
                                )
                            }
                            Text(
                                text = String.format("%.2f", note.partialKM),
                                fontSize = 15.sp,
                                fontWeight = FontWeight.Bold,
                                fontFamily = FontFamily.Monospace,
                                color = Color.Black
                            )
                        }
                        if (note.wptName.isNotEmpty()) {
                            Text(
                                text = note.wptName,
                                fontSize = 8.5.sp,
                                fontWeight = FontWeight.Bold,
                                color = Color(0xFF555555),
                                maxLines = 1
                            )
                        }
                    }

                    // Col 2: Tulip Diagram
                    Box(
                        modifier = Modifier
                            .width(160.dp)
                            .fillMaxHeight()
                            .border(width = 1.dp, color = Color.Black)
                    ) {
                        TulipVectorView(note = note)
                    }

                    // Col 3: FIA Lexicon, Stamps, Speed, Dangers
                    Column(
                        modifier = Modifier
                            .weight(1f)
                            .fillMaxHeight()
                            .padding(6.dp),
                        verticalArrangement = Arrangement.SpaceBetween,
                        horizontalAlignment = Alignment.Start
                    ) {
                        // Top badges
                        Row(verticalAlignment = Alignment.CenterVertically) {
                            WaypointStamp(wptType = note.wptType)
                            Spacer(modifier = Modifier.width(4.dp))

                            if (note.danger > 0) {
                                Text(
                                    text = "!".repeat(note.danger),
                                    fontSize = 22.sp,
                                    fontWeight = FontWeight.Black,
                                    color = Color(0xFFD32F2F)
                                )
                                Spacer(modifier = Modifier.width(6.dp))
                            }

                            if (note.speedLimit != null) {
                                Box(
                                    modifier = Modifier
                                        .size(24.dp)
                                        .background(Color.White, CircleShape)
                                        .border(2.5.dp, Color(0xFFD32F2F), CircleShape),
                                    contentAlignment = Alignment.Center
                                ) {
                                    Text(
                                        text = "${note.speedLimit}",
                                        fontSize = 10.sp,
                                        fontWeight = FontWeight.Black,
                                        color = Color.Black
                                    )
                                }
                            }
                        }

                        // Tags row
                        Row(modifier = Modifier.fillMaxWidth()) {
                            note.lexicon.filter { !it.startsWith("!") && it != "START" && it != "FINISH" }
                                .take(4)
                                .forEach { code ->
                                    FiaSymbolBadge(code = code)
                                    Spacer(modifier = Modifier.width(4.dp))
                                }
                        }

                        // Instruction text
                        Text(
                            text = note.text,
                            fontSize = 10.sp,
                            fontWeight = FontWeight.Bold,
                            color = Color.Black,
                            maxLines = 2
                        )
                    }
                }
            }
        }
    }
}
