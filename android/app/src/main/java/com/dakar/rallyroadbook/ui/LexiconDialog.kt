package com.dakar.rallyroadbook.ui

import androidx.compose.foundation.background
import androidx.compose.foundation.border
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.LazyRow
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import androidx.compose.ui.window.Dialog
import com.dakar.rallyroadbook.models.FIALexicon

@Composable
fun LexiconDialog(onDismiss: () -> Unit) {
    var searchQuery by remember { mutableStateOf("") }
    var selectedCategory by remember { mutableStateOf("all") }

    val categories = listOf("all", "tracks", "elements", "areas", "safety", "waypoints", "directions", "specificities", "electric")

    val filteredItems = remember(searchQuery, selectedCategory) {
        val q = searchQuery.trim().lowercase()
        FIALexicon.items.filter { item ->
            val matchCat = selectedCategory == "all" || item.cat == selectedCategory
            if (!matchCat) return@filter false
            if (q.isEmpty()) return@filter true
            item.code.lowercase().contains(q) || item.en.lowercase().contains(q) || item.fr.lowercase().contains(q)
        }
    }

    Dialog(onDismissRequest = onDismiss) {
        Card(
            modifier = Modifier
                .fillMaxWidth()
                .fillMaxHeight(0.85f),
            shape = RoundedCornerShape(8.dp),
            colors = CardDefaults.cardColors(containerColor = Color(0xFF14171E))
        ) {
            Column(modifier = Modifier.fillMaxSize().padding(12.dp)) {
                // Header
                Row(
                    modifier = Modifier.fillMaxWidth(),
                    horizontalArrangement = Arrangement.SpaceBetween,
                    verticalAlignment = Alignment.CenterVertically
                ) {
                    Text(
                        text = "📖 FIA DAKAR LEXICON",
                        fontSize = 15.sp,
                        fontWeight = FontWeight.Black,
                        color = Color.White
                    )
                    Text(
                        text = "✕",
                        fontSize = 16.sp,
                        fontWeight = FontWeight.Bold,
                        color = Color.White,
                        modifier = Modifier.clickable { onDismiss() }
                    )
                }

                Spacer(modifier = Modifier.height(8.dp))

                // Categories Row
                LazyRow(
                    horizontalArrangement = Arrangement.spacedBy(4.dp),
                    modifier = Modifier.fillMaxWidth()
                ) {
                    items(categories) { cat ->
                        val isSelected = selectedCategory == cat
                        Box(
                            modifier = Modifier
                                .background(
                                    if (isSelected) Color(0xFFFFE500) else Color(0xFF252834),
                                    RoundedCornerShape(4.dp)
                                )
                                .clickable { selectedCategory = cat }
                                .padding(horizontal = 8.dp, vertical = 5.dp)
                        ) {
                            Text(
                                text = cat.uppercase(),
                                fontSize = 9.5.sp,
                                fontWeight = FontWeight.Bold,
                                color = if (isSelected) Color.Black else Color.White
                            )
                        }
                    }
                }

                Spacer(modifier = Modifier.height(8.dp))

                // Search field
                OutlinedTextField(
                    value = searchQuery,
                    onValueChange = { searchQuery = it },
                    placeholder = { Text("Search signs, acronyms or names...", fontSize = 12.sp, color = Color.Gray) },
                    modifier = Modifier.fillMaxWidth(),
                    singleLine = true,
                    colors = OutlinedTextFieldDefaults.colors(
                        focusedTextColor = Color.White,
                        unfocusedTextColor = Color.White,
                        focusedBorderColor = Color(0xFFFFE500),
                        unfocusedBorderColor = Color(0xFF333846),
                        focusedContainerColor = Color(0xFF1B1D24),
                        unfocusedContainerColor = Color(0xFF1B1D24)
                    )
                )

                Spacer(modifier = Modifier.height(8.dp))

                // List
                LazyColumn(modifier = Modifier.fillMaxSize(), verticalArrangement = Arrangement.spacedBy(6.dp)) {
                    items(filteredItems) { item ->
                        Row(
                            modifier = Modifier
                                .fillMaxWidth()
                                .background(Color(0xFF1A1C22), RoundedCornerShape(4.dp))
                                .border(1.dp, Color(0xFF2B303C), RoundedCornerShape(4.dp))
                                .padding(8.dp),
                            verticalAlignment = Alignment.CenterVertically
                        ) {
                            FiaSymbolBadge(code = item.code)
                            Spacer(modifier = Modifier.width(8.dp))
                            Column(modifier = Modifier.weight(1f)) {
                                Text(text = item.en, fontSize = 12.sp, fontWeight = FontWeight.Bold, color = Color.White)
                                Text(text = item.fr, fontSize = 10.sp, color = Color.Gray)
                            }
                            Box(
                                modifier = Modifier
                                    .background(Color(0xFF252834), RoundedCornerShape(2.dp))
                                    .padding(horizontal = 4.dp, vertical = 2.dp)
                            ) {
                                Text(text = item.cat.uppercase(), fontSize = 8.5.sp, fontWeight = FontWeight.Bold, color = Color(0xFFAAAAAA))
                            }
                        }
                    }
                }
            }
        }
    }
}
