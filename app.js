const FIA_LEXICON = [
  { code: "2X", en: "Dual carriageway", fr: "2 voies", cat: "tracks" },
  { code: "RD", en: "Road", fr: "Route", cat: "tracks" },
  { code: "P", en: "Track", fr: "Piste", cat: "tracks" },
  { code: "HP", en: "Off track (Hors-piste)", fr: "Hors-piste", cat: "tracks" },
  { code: "G^D", en: "Big track", fr: "Grande piste", cat: "tracks" },
  { code: "PP", en: "Main track", fr: "Piste principale", cat: "tracks" },
  { code: "PS", en: "Winding track", fr: "Piste sinueuse", cat: "tracks" },
  { code: "PPS", en: "Winding main track", fr: "Piste principale sinueuse", cat: "tracks" },
  { code: "UB", en: "Under bridge", fr: "Sous pont", cat: "elements" },
  { code: "OB", en: "Over bridge", fr: "Sur pont", cat: "elements" },
  { code: "CL", en: "Fence", fr: "Clôture", cat: "elements" },
  { code: "BAR", en: "Gate barrier", fr: "Barrière", cat: "elements" },
  { code: "NCB", en: "No cattle passage", fr: "Passage bétail interdit", cat: "elements" },
  { code: "AF", en: "Animal fence", fr: "Clôture bétail", cat: "elements" },
  { code: "BIDON", en: "Barrel", fr: "Fût", cat: "elements" },
  { code: "MAIS", en: "House", fr: "Maison", cat: "elements" },
  { code: "RUIN", en: "Ruin", fr: "Ruine", cat: "elements" },
  { code: "PNEU", en: "Tire", fr: "Pneu", cat: "elements" },
  { code: "CIT", en: "Water tank", fr: "Citerne", cat: "elements" },
  { code: "BAT", en: "Buildings", fr: "Bâtiments", cat: "elements" },
  { code: "CF", en: "Rail road", fr: "Voie ferrée", cat: "elements" },
  { code: "START", en: "Start (Départ)", fr: "Départ", cat: "areas" },
  { code: "FINISH", en: "Finish (ASS)", fr: "Arrivée", cat: "areas" },
  { code: "ESSENCE", en: "Petrol station", fr: "Station essence", cat: "areas" },
  { code: "CLOCK", en: "Clock (Heure)", fr: "Horloge", cat: "areas" },
  { code: "VIL", en: "Village", fr: "Village", cat: "areas" },
  { code: "ZS", en: "Sensitive zone", fr: "Zone sensible", cat: "areas" },
  { code: "SL30", en: "Speed limit 30", fr: "Limitation 30", cat: "safety" },
  { code: "SL50", en: "Speed limit 50", fr: "Limitation 50", cat: "safety" },
  { code: "SL100", en: "Speed limit 100", fr: "Limitation 100", cat: "safety" },
  { code: "END_SL", en: "Finish speed limit zone", fr: "Fin limitation", cat: "safety" },
  { code: "!", en: "Danger 1", fr: "Danger 1", cat: "safety" },
  { code: "!!", en: "Danger 2", fr: "Danger 2", cat: "safety" },
  { code: "!!!", en: "Danger 3", fr: "Danger 3", cat: "safety" },
  { code: "DZ", en: "Start speed zone", fr: "Début zone vitesse", cat: "safety" },
  { code: "FZ", en: "Finish speed zone", fr: "Fin zone vitesse", cat: "safety" },
  { code: "PC", en: "PC Control Post", fr: "Poste de contrôle", cat: "waypoints" },
  { code: "WPE", en: "Waypoint eclipse", fr: "Point éclipse", cat: "waypoints" },
  { code: "WPS", en: "Waypoint safety", fr: "Point sécurité", cat: "waypoints" },
  { code: "WPM", en: "Waypoint masked", fr: "Point masqué", cat: "waypoints" },
  { code: "WPC", en: "Waypoint control", fr: "Point contrôle", cat: "waypoints" },
  { code: "CP", en: "Checkpoint", fr: "Contrôle de passage", cat: "waypoints" },
  { code: "PAN", en: "Panels", fr: "Panneaux", cat: "directions" },
  { code: "UPHILL", en: "Uphill", fr: "Montée", cat: "directions" },
  { code: "DOWNHILL", en: "Downhill", fr: "Descente", cat: "directions" },
  { code: "VERS", en: "Towards", fr: "Vers", cat: "directions" },
  { code: "DS", en: "In", fr: "Dans", cat: "directions" },
  { code: "IMP", en: "Imperative", fr: "Impératif", cat: "directions" },
  { code: "QT", en: "Leave", fr: "Quitter", cat: "directions" },
  { code: "RP", en: "To take", fr: "Reprendre", cat: "directions" },
  { code: "TDSPP", en: "Keep straight on main track", fr: "Tout droit sur piste principale", cat: "directions" },
  { code: "MONT", en: "Mountain", fr: "Montagne", cat: "specificities" },
  { code: "ROCH", en: "Rock / Rocks", fr: "Rocher", cat: "specificities" },
  { code: "SA", en: "Sand", fr: "Sable", cat: "specificities" },
  { code: "CAIL", en: "Stones", fr: "Cailloux", cat: "specificities" },
  { code: "DN", en: "Dunes", fr: "Dunes", cat: "specificities" },
  { code: "DN L1", en: "Dunes Level 1", fr: "Dunes niveau 1", cat: "specificities" },
  { code: "DN L2", en: "Dunes Level 2", fr: "Dunes niveau 2", cat: "specificities" },
  { code: "DNT", en: "Small dune", fr: "Petite dune", cat: "specificities" },
  { code: "DN_CAS", en: "Broken dune", fr: "Dune cassée", cat: "specificities" },
  { code: "RIV", en: "River", fr: "Rivière", cat: "specificities" },
  { code: "RIO", en: "Dry riverbed / Oued", fr: "Rio sec / Oued", cat: "specificities" },
  { code: "ORNI", en: "Ruts", fr: "Ornières", cat: "specificities" },
  { code: "OND", en: "Undulation", fr: "Ondulation", cat: "specificities" },
  { code: "COMP", en: "Compression", fr: "Compression", cat: "specificities" },
  { code: "DIP", en: "Dip / Depression", fr: "Trou / Cuvette", cat: "specificities" },
  { code: "FOSS", en: "Ditch", fr: "Fossé", cat: "specificities" },
  { code: "MARCH_B", en: "Step down", fr: "Marche descente", cat: "specificities" },
  { code: "MARCH_H", en: "Step up", fr: "Marche montée", cat: "specificities" },
  { code: "E3", en: "Narrow", fr: "Étroit", cat: "specificities" },
  { code: "SER", en: "Tight turn", fr: "Serré", cat: "specificities" },
  { code: "ANT", en: "Antenna", fr: "Antenne", cat: "electric" },
  { code: "LEL", en: "Electric line", fr: "Ligne électrique", cat: "electric" },
  { code: "POT", en: "Post", fr: "Poteau", cat: "electric" },
  { code: "PEL", en: "Electric pylon", fr: "Pylône électrique", cat: "electric" },
  { code: "HT", en: "High voltage line", fr: "Haute tension", cat: "electric" }
];

const FIA_LEX_NAMES_I18N = {
  es: {
    "2X": "Doble vía", "RD": "Carretera", "P": "Pista", "HP": "Fuera de pista",
    "G^D": "Pista ancha", "PP": "Pista principal", "PS": "Pista sinuosa", "PPS": "Pista principal sinuosa",
    "UB": "Bajo puente", "OB": "Sobre puente", "CL": "Cerca", "BAR": "Barrera",
    "AF": "Valla de ganado", "BIDON": "Bidón", "MAIS": "Casa", "RUIN": "Ruina",
    "PNEU": "Neumático", "CIT": "Cisterna", "BAT": "Edificio", "CF": "Vía férrea",
    "START": "Salida", "FINISH": "Llegada", "ESSENCE": "Gasolinera", "CLOCK": "Reloj",
    "VIL": "Pueblo", "ZS": "Zona sensible", "SL30": "Límite 30", "SL50": "Límite 50",
    "SL100": "Límite 100", "END_SL": "Fin límite", "!": "Peligro 1", "!!": "Peligro 2",
    "!!!": "Peligro 3", "DZ": "Inicio zona vel.", "FZ": "Fin zona vel.", "PC": "Puesto control",
    "WPE": "Wpt eclipse", "WPS": "Wpt seguridad", "WPM": "Wpt oculto", "WPC": "Wpt control",
    "CP": "Control de paso", "PAN": "Paneles", "UPHILL": "Subida", "DOWNHILL": "Bajada",
    "MONT": "Montaña", "ROCH": "Roca", "SA": "Arena", "CAIL": "Piedras",
    "DN": "Dunas", "DN L1": "Dunas Nivel 1", "DN L2": "Dunas Nivel 2", "DNT": "Duna pequeña",
    "DN_CAS": "Duna rota", "RIV": "Río", "RIO": "Rambla / Oued", "ORNI": "Roderas",
    "OND": "Ondulación", "COMP": "Compresión", "DIP": "Vaguada", "FOSS": "Zanja",
    "MARCH_B": "Escalón bajada", "MARCH_H": "Escalón subida", "E3": "Estrecho", "SER": "Cerrado",
    "ANT": "Antena", "LEL": "Línea eléctrica", "POT": "Poste", "PEL": "Torreta eléctrica", "HT": "Alta tensión"
  },
  ar: {
    "2X": "مسار مزدوج", "RD": "طريق معبد", "P": "مسار", "HP": "خارج المسار",
    "G^D": "مسار عريض", "PP": "المسار الرئيسي", "PS": "مسار متعرج", "PPS": "مسار رئيسي متعرج",
    "UB": "تحت الجسر", "OB": "فوق الجسر", "CL": "سياج", "BAR": "حاجز بوابي",
    "AF": "سياج ماشية", "BIDON": "برميل", "MAIS": "منزل", "RUIN": "أطلال",
    "PNEU": "إطار", "CIT": "خزان مياه", "BAT": "مبانٍ", "CF": "سكة حديد",
    "START": "انطلاق", "FINISH": "وصول", "ESSENCE": "محطة وقود", "CLOCK": "ساعة التوقيت",
    "VIL": "قرية", "ZS": "منطقة حساسة", "SL30": "سرعة 30", "SL50": "سرعة 50",
    "SL100": "سرعة 100", "END_SL": "نهاية السرعة", "!": "خطر 1", "!!": "خطر 2",
    "!!!": "خطر 3", "DZ": "بداية السرعة", "FZ": "نهاية السرعة", "PC": "نقطة مراقبة",
    "WPE": "نقطة كسوف", "WPS": "نقطة أمان", "WPM": "نقطة مخفية", "WPC": "نقطة مراقبة",
    "CP": "نقطة عبور", "PAN": "لوحات", "UPHILL": "صعود", "DOWNHILL": "نزول",
    "MONT": "جبل", "ROCH": "صخرة", "SA": "رمال", "CAIL": "حصى وحجارة",
    "DN": "كثبان رملية", "DN L1": "كثبان مستوى 1", "DN L2": "كثبان مستوى 2", "DNT": "كثيب صغير",
    "DN_CAS": "كثيب منكسر", "RIV": "نهر", "RIO": "وادي جاف", "ORNI": "أخاديد",
    "OND": "تموجات", "COMP": "انضغاط أرضي", "DIP": "منخفض", "FOSS": "خندق",
    "MARCH_B": "درجة هبوط", "MARCH_H": "درجة صعود", "E3": "ممر ضيق", "SER": "منعطف حاد",
    "ANT": "هوائي", "LEL": "خط كهربائي", "POT": "عمود", "PEL": "برج كهرباء", "HT": "ضغط عالي"
  },
  de: {
    "2X": "Zweispurig", "RD": "Straße", "P": "Piste", "HP": "Off-Piste",
    "G^D": "Hauptpiste breit", "PP": "Hauptpiste", "PS": "Kurvige Piste", "PPS": "Kurvige Hauptpiste",
    "UB": "Unter Brücke", "OB": "Über Brücke", "CL": "Zaun", "BAR": "Schranke",
    "AF": "Viehzaun", "BIDON": "Fass", "MAIS": "Haus", "RUIN": "Ruine",
    "PNEU": "Reifen", "CIT": "Wassertank", "BAT": "Gebäude", "CF": "Eisenbahn",
    "START": "Start", "FINISH": "Ziel", "ESSENCE": "Tankstelle", "CLOCK": "Zeituhr",
    "VIL": "Dorf", "ZS": "Schutzzone", "SL30": "Limit 30", "SL50": "Limit 50",
    "SL100": "Limit 100", "END_SL": "Ende Limit", "!": "Gefahr 1", "!!": "Gefahr 2",
    "!!!": "Gefahr 3", "DZ": "Start Tempolimit", "FZ": "Ende Tempolimit", "PC": "Kontrollposten",
    "WPE": "Wegpunkt Eclipse", "WPS": "Sicherheits-WP", "WPM": "Maskierter WP", "WPC": "Kontroll-WP",
    "CP": "Passagekontrolle", "PAN": "Schilder", "UPHILL": "Steigung", "DOWNHILL": "Gefälle",
    "MONT": "Berg", "ROCH": "Felsen", "SA": "Sand", "CAIL": "Steine",
    "DN": "Dünen", "DN L1": "Dünen Stufe 1", "DN L2": "Dünen Stufe 2", "DNT": "Kleine Düne",
    "DN_CAS": "Gebrochene Düne", "RIV": "Fluss", "RIO": "Trockenes Flussbett", "ORNI": "Spurrillen",
    "OND": "Bodenwellen", "COMP": "Kompression", "DIP": "Mulde", "FOSS": "Graben",
    "MARCH_B": "Stufe abwärts", "MARCH_H": "Stufe aufwärts", "E3": "Eng", "SER": "Enger Bogen",
    "ANT": "Antenne", "LEL": "Stromleitung", "POT": "Mast", "PEL": "Strommast", "HT": "Hochspannung"
  },
  pt: {
    "2X": "Pista dupla", "RD": "Estrada", "P": "Pista", "HP": "Fora de pista",
    "G^D": "Pista larga", "PP": "Pista principal", "PS": "Pista sinuosa", "PPS": "Pista principal sinuosa",
    "UB": "Sob ponte", "OB": "Sobre ponte", "CL": "Cerca", "BAR": "Barreira",
    "AF": "Cerca de gado", "BIDON": "Barril", "MAIS": "Casa", "RUIN": "Ruína",
    "PNEU": "Pneu", "CIT": "Cisterna", "BAT": "Edifícios", "CF": "Linha férrea",
    "START": "Largada", "FINISH": "Chegada", "ESSENCE": "Posto de combustível", "CLOCK": "Relógio",
    "VIL": "Vila", "ZS": "Zona sensível", "SL30": "Limite 30", "SL50": "Limite 50",
    "SL100": "Limite 100", "END_SL": "Fim limite", "!": "Perigo 1", "!!": "Perigo 2",
    "!!!": "Perigo 3", "DZ": "Início zona veloc.", "FZ": "Fim zona veloc.", "PC": "Posto de controle",
    "WPE": "Wpt eclipse", "WPS": "Wpt segurança", "WPM": "Wpt mascarado", "WPC": "Wpt controle",
    "CP": "Controle de passagem", "PAN": "Placas", "UPHILL": "Subida", "DOWNHILL": "Descida",
    "MONT": "Montanha", "ROCH": "Rocha", "SA": "Areia", "CAIL": "Pedras",
    "DN": "Dunas", "DN L1": "Dunas Nível 1", "DN L2": "Dunas Nivel 2", "DNT": "Duna pequena",
    "DN_CAS": "Duna quebrada", "RIV": "Rio", "RIO": "Leito seco / Oued", "ORNI": "Valas / Trilhos",
    "OND": "Ondulações", "COMP": "Compressão", "DIP": "Depressão", "FOSS": "Vala profunda",
    "MARCH_B": "Degrau descida", "MARCH_H": "Degrau subida", "E3": "Estreito", "SER": "Fechado",
    "ANT": "Antena", "LEL": "Linha elétrica", "POT": "Poste", "PEL": "Torre elétrica", "HT": "Alta tensão"
  },
  it: {
    "2X": "Due corsie", "RD": "Strada", "P": "Pista", "HP": "Fuoripista",
    "G^D": "Pista grande", "PP": "Pista principale", "PS": "Pista tortuosa", "PPS": "Pista principale tortuosa",
    "UB": "Sotto ponte", "OB": "Sopra ponte", "CL": "Recinto", "BAR": "Sbarra",
    "AF": "Recinto bestiame", "BIDON": "Fusto", "MAIS": "Casa", "RUIN": "Rovina",
    "PNEU": "Pneumatico", "CIT": "Cisterna", "BAT": "Edifici", "CF": "Ferrovia",
    "START": "Partenza", "FINISH": "Arrivo", "ESSENCE": "Distributore", "CLOCK": "Orologio",
    "VIL": "Villaggio", "ZS": "Zona sensibile", "SL30": "Limite 30", "SL50": "Limite 50",
    "SL100": "Limite 100", "END_SL": "Fine limite", "!": "Pericolo 1", "!!": "Pericolo 2",
    "!!!": "Pericolo 3", "DZ": "Inizio zona vel.", "FZ": "Fine zona vel.", "PC": "Postazione controllo",
    "WPE": "Wpt eclissi", "WPS": "Wpt sicurezza", "WPM": "Wpt mascherato", "WPC": "Wpt controllo",
    "CP": "Controllo passaggio", "PAN": "Cartelli", "UPHILL": "Salita", "DOWNHILL": "Discesa",
    "MONT": "Montagna", "ROCH": "Roccia", "SA": "Sabbia", "CAIL": "Pietre",
    "DN": "Dune", "DN L1": "Dune Livello 1", "DN L2": "Dune Livello 2", "DNT": "Duna piccola",
    "DN_CAS": "Duna rotta", "RIV": "Fiume", "RIO": "Fiume secco / Oued", "ORNI": "Solchi",
    "OND": "Ondulazioni", "COMP": "Compressione", "DIP": "Avvallamento", "FOSS": "Fosso",
    "MARCH_B": "Gradino discesa", "MARCH_H": "Gradino salita", "E3": "Stretto", "SER": "Stretta",
    "ANT": "Antenna", "LEL": "Linea elettrica", "POT": "Palo", "PEL": "Traliccio elettrico", "HT": "Alta tensione"
  },
  hi: {
    "2X": "दोहरी लेन", "RD": "सड़क", "P": "ट्रैक", "HP": "ऑफ-ट्रैक",
    "G^D": "बड़ा ट्रैक", "PP": "मुख्य ट्रैक", "PS": "घुमावदार ट्रैक", "PPS": "घुमावदार मुख्य ट्रैक",
    "UB": "पुल के नीचे", "OB": "पुल के ऊपर", "CL": "बाड़", "BAR": "फाटक",
    "AF": "पशु बाड़", "BIDON": "बैरल", "MAIS": "घर", "RUIN": "खंडहर",
    "PNEU": "टायर", "CIT": "पानी की टंकी", "BAT": "भवन", "CF": "रेलवे लाइन",
    "START": "प्रस्थान", "FINISH": "समापन", "ESSENCE": "पेट्रोल पंप", "CLOCK": "घड़ी",
    "VIL": "गाँव", "ZS": "संवेदनशील क्षेत्र", "SL30": "गति सीमा 30", "SL50": "गति सीमा 50",
    "SL100": "गति सीमा 100", "END_SL": "सीमा समाप्त", "!": "खतरा 1", "!!": "खतरा 2",
    "!!!": "खतरा 3", "DZ": "गति क्षेत्र शुरू", "FZ": "गति क्षेत्र समाप्त", "PC": "नियंत्रण चौकी",
    "WPE": "वेपॉइंट ग्रहण", "WPS": "सुरक्षा वेपॉइंट", "WPM": "गुप्त वेपॉइंट", "WPC": "नियंत्रण वेपॉइंट",
    "CP": "चेकपॉइंट", "PAN": "संकेत बोर्ड", "UPHILL": "चढ़ाई", "DOWNHILL": "उतराई",
    "MONT": "पहाड़", "ROCH": "चट्टान", "SA": "रेत", "CAIL": "पत्थर",
    "DN": "रेत के टीले", "DN L1": "टीले स्तर 1", "DN L2": "टीले स्तर 2", "DNT": "छोटा टीला",
    "DN_CAS": "टूटा हुआ टीला", "RIV": "नदी", "RIO": "सूखी नदी तल", "ORNI": "पहियों के गड्ढे",
    "OND": "लहरदार जमीन", "COMP": "झटका / कम्प्रेशन", "DIP": "गड्ढा", "FOSS": "खाई",
    "MARCH_B": "नीचे की सीढ़ी", "MARCH_H": "ऊपर की सीढ़ी", "E3": "संकरा", "SER": "तीखा मोड़",
    "ANT": "एंटीना", "LEL": "बिजली लाइन", "POT": "खंभा", "PEL": "बिजली का टावर", "HT": "हाई टेंशन"
  },
  ja: {
    "2X": "片側2車線", "RD": "舗装道路", "P": "ピスト（未舗装路）", "HP": "コース外（オルピスト）",
    "G^D": "広幅ピスト", "PP": "メインピスト", "PS": "屈曲ピスト", "PPS": "屈曲メインピスト",
    "UB": "橋下通過", "OB": "橋上通過", "CL": "フェンス", "BAR": "遮断機",
    "AF": "家畜用柵", "BIDON": "ドラム缶", "MAIS": "民家", "RUIN": "廃墟",
    "PNEU": "古タイヤ", "CIT": "給水タンク", "BAT": "建造物", "CF": "線路",
    "START": "スタート", "FINISH": "フィニッシュ", "ESSENCE": "給油地点", "CLOCK": "計時時計",
    "VIL": "集落・村", "ZS": "保護区域", "SL30": "制限速度30", "SL50": "制限速度50",
    "SL100": "制限速度100", "END_SL": "速度制限解除", "!": "危険度1", "!!": "危険度2",
    "!!!": "危険度3", "DZ": "速度規制開始", "FZ": "速度規制終了", "PC": "コントロールポスト",
    "WPE": "エクリプスWP", "WPS": "セーフティWP", "WPM": "マスクWP", "WPC": "コントロールWP",
    "CP": "通過確認地点", "PAN": "標識看板", "UPHILL": "登り坂", "DOWNHILL": "下り坂",
    "MONT": "山岳", "ROCH": "岩石", "SA": "砂地", "CAIL": "砕石・瓦礫",
    "DN": "砂丘群", "DN L1": "砂丘レベル1", "DN L2": "砂丘レベル2", "DNT": "小型砂丘",
    "DN_CAS": "崩落砂丘", "RIV": "河川", "RIO": "枯れ川（ワジ）", "ORNI": "深い轍（わだち）",
    "OND": "連続段差（波状路）", "COMP": "急激な底打ち", "DIP": "窪地", "FOSS": "溝・塹壕",
    "MARCH_B": "下り段差", "MARCH_H": "登り段差", "E3": "幅員狭小", "SER": "急カーブ",
    "ANT": "アンテナ", "LEL": "送電線", "POT": "電柱", "PEL": "送電鉄塔", "HT": "高圧線"
  },
  zh: {
    "2X": "双车道", "RD": "柏油路", "P": "越野土路", "HP": "无路赛段（Hors-Piste）",
    "G^D": "宽阔主路", "PP": "主赛道", "PS": "曲折路段", "PPS": "曲折主赛道",
    "UB": "桥下穿越", "OB": "桥上通行", "CL": "铁丝网", "BAR": "道闸护栏",
    "AF": "牲畜围栏", "BIDON": "油桶地标", "MAIS": "房屋", "RUIN": "废墟遗址",
    "PNEU": "废旧轮胎", "CIT": "蓄水罐", "BAT": "建筑物群", "CF": "铁路线",
    "START": "发车起点", "FINISH": "终点冲线", "ESSENCE": "加油补给站", "CLOCK": "官方计时钟",
    "VIL": "村落集镇", "ZS": "生态敏感区", "SL30": "限速30", "SL50": "限速50",
    "SL100": "限速100", "END_SL": "限速解除", "!": "危险1级", "!!": "危险2级",
    "!!!": "危险3级（极度危险）", "DZ": "限速管制区起点", "FZ": "限速管制区终点", "PC": "赛事指挥站",
    "WPE": "日食航点", "WPS": "安全警示航点", "WPM": "隐藏盲点航点", "WPC": "必经打卡航点",
    "CP": "签到打卡点", "PAN": "指路指示牌", "UPHILL": "陡峭上坡", "DOWNHILL": "陡峭下坡",
    "MONT": "山峰山地", "ROCH": "巨石嶙峋", "SA": "松软沙地", "CAIL": "乱石碎石",
    "DN": "沙漠沙丘", "DN L1": "1级轻度沙丘", "DN L2": "2级陡峭沙丘", "DNT": "小沙堆",
    "DN_CAS": "断层刀锋沙丘", "RIV": "河流溪流", "RIO": "干枯干河床（Wadi）", "ORNI": "深车辙凹陷",
    "OND": "搓板起伏路", "COMP": "剧烈避震压缩坑", "DIP": "隐蔽凹陷深坑", "FOSS": "冲刷深沟壕沟",
    "MARCH_B": "下落断层台阶", "MARCH_H": "上升断层台阶", "E3": "狭窄瓶颈隘口", "SER": "急转回头弯",
    "ANT": "通信天线", "LEL": "架空电线", "POT": "电线木杆", "PEL": "高压铁塔", "HT": "高压危险电网"
  }
};

function getLocalizedLexName(item) {
  if (!item) return "";
  const lang = state.currentLanguage || 'en';
  if (lang === 'fr' && item.fr) return item.fr;
  if (lang === 'en' && item.en) return item.en;
  if (FIA_LEX_NAMES_I18N[lang] && FIA_LEX_NAMES_I18N[lang][item.code]) {
    return FIA_LEX_NAMES_I18N[lang][item.code];
  }
  return item.en || item.fr || item.code;
}

function tagColorClass(code) {
  const c = (code || '').toUpperCase();
  if (c === 'HP') return 'hp';
  if (c === 'DN' || c.startsWith('DN') || c === 'SA') return 'sa';
  if (c === 'DZ') return 'dz';
  if (c === 'FZ' || c === 'END_SL') return 'fz';
  if (c === 'PP' || c === '2X' || c === 'RD' || c === 'G^D' || c === 'P' || c === 'PS' || c === 'PPS') return 'pp';
  if (c === 'CP') return 'cp';
  if (c.includes('!') || c.startsWith('SL')) return 'danger';
  return 'specificities';
}

function renderFiaSignIcon(code) {
  if (!code) return '';
  const c = code.trim().toUpperCase();

  switch (c) {
    case 'START':
      return `<svg class="fia-symbol-svg" viewBox="0 0 24 24"><circle cx="12" cy="12" r="10" fill="#000"/><text x="12" y="15" fill="#FFE500" font-size="7" font-weight="900" text-anchor="middle" font-family="sans-serif">START</text></svg>`;
    case 'FINISH':
      return `<svg class="fia-symbol-svg" viewBox="0 0 24 24"><circle cx="12" cy="12" r="10" fill="#000" stroke="#000" stroke-width="1.5"/><circle cx="12" cy="12" r="8" fill="none" stroke="#FFF" stroke-width="1.5"/><text x="12" y="15" fill="#FFF" font-size="7.5" font-weight="900" text-anchor="middle" font-family="sans-serif">ASS</text></svg>`;
    case 'DZ':
      return `<svg class="fia-symbol-svg" viewBox="0 0 24 24"><circle cx="12" cy="12" r="10" fill="#2E7D32"/><text x="12" y="15.5" fill="#FFF" font-size="9" font-weight="900" text-anchor="middle" font-family="sans-serif">DZ</text></svg>`;
    case 'FZ':
      return `<svg class="fia-symbol-svg" viewBox="0 0 24 24"><circle cx="12" cy="12" r="10" fill="#546E7A"/><text x="12" y="15.5" fill="#FFF" font-size="9" font-weight="900" text-anchor="middle" font-family="sans-serif">FZ</text></svg>`;
    case 'CP':
      return `<svg class="fia-symbol-svg" viewBox="0 0 24 24"><circle cx="12" cy="12" r="10" fill="none" stroke="#7B1FA2" stroke-width="2.5"/><text x="12" y="15.5" fill="#7B1FA2" font-size="9" font-weight="900" text-anchor="middle" font-family="sans-serif">CP</text></svg>`;
    case 'WPC':
      return `<svg class="fia-symbol-svg" viewBox="0 0 24 24"><circle cx="12" cy="12" r="10" fill="none" stroke="#000" stroke-width="1.8"/><circle cx="12" cy="12" r="7.5" fill="none" stroke="#000" stroke-width="1"/><text x="12" y="15" fill="#000" font-size="6.5" font-weight="900" text-anchor="middle" font-family="sans-serif">WPC</text></svg>`;
    case 'WPS':
      return `<svg class="fia-symbol-svg" viewBox="0 0 24 24"><circle cx="12" cy="12" r="10" fill="none" stroke="#000" stroke-width="2"/><text x="12" y="15" fill="#000" font-size="7" font-weight="900" text-anchor="middle" font-family="sans-serif">WPS</text></svg>`;
    case 'WPM':
      return `<svg class="fia-symbol-svg" viewBox="0 0 24 24"><circle cx="12" cy="12" r="10" fill="none" stroke="#000" stroke-width="1.8" stroke-dasharray="3,2"/><text x="12" y="15" fill="#000" font-size="6.5" font-weight="900" text-anchor="middle" font-family="sans-serif">WPM</text></svg>`;
    case 'WPE':
      return `<svg class="fia-symbol-svg" viewBox="0 0 24 24"><circle cx="12" cy="12" r="10" fill="none" stroke="#000" stroke-width="1.8"/><text x="12" y="15" fill="#000" font-size="6.5" font-weight="900" text-anchor="middle" font-family="sans-serif">WPE</text></svg>`;
    case 'SL30':
    case 'SL50':
    case 'SL100':
      const speedNum = c.replace('SL', '');
      return `<div class="speed-circle">${speedNum}</div>`;
    case '!':
      return `<span class="danger-marks">!</span>`;
    case '!!':
      return `<span class="danger-marks">!!</span>`;
    case '!!!':
      return `<span class="danger-marks">!!!</span>`;
    case 'OND':
      return `<svg class="fia-symbol-svg" viewBox="0 0 28 16"><path d="M 2,8 C 5,2 9,14 14,8 C 19,2 23,14 26,8" fill="none" stroke="#000" stroke-width="2.5"/></svg>`;
    case 'ORNI':
      return `<span class="fia-symbol-ruts">{ }</span>`;
    case 'COMP':
      return `<svg class="fia-symbol-svg" viewBox="0 0 20 20"><line x1="2" y1="17" x2="18" y2="17" stroke="#000" stroke-width="2.5"/><line x1="10" y1="2" x2="10" y2="13" stroke="#000" stroke-width="2.5"/><polyline points="5,9 10,14 15,9" fill="none" stroke="#000" stroke-width="2.5"/></svg>`;
    case 'DIP':
      return `<svg class="fia-symbol-svg" viewBox="0 0 26 16"><path d="M 2,4 L 6,4 Q 13,15 20,4 L 24,4" fill="none" stroke="#000" stroke-width="2.5"/></svg>`;
    case 'FOSS':
      return `<svg class="fia-symbol-svg" viewBox="0 0 26 16"><path d="M 2,3 L 6,3 L 6,13 L 20,13 L 20,3 L 24,3" fill="none" stroke="#000" stroke-width="2.2"/></svg>`;
    case 'DOWNHILL':
      return `<svg class="fia-symbol-svg" viewBox="0 0 22 22"><line x1="3" y1="5" x2="17" y2="17" stroke="#000" stroke-width="2.8"/><polygon points="18,10 18,18 10,18" fill="#000"/></svg>`;
    case 'UPHILL':
      return `<svg class="fia-symbol-svg" viewBox="0 0 22 22"><line x1="3" y1="17" x2="17" y2="5" stroke="#000" stroke-width="2.8"/><polygon points="10,4 18,4 18,12" fill="#000"/></svg>`;
    case 'MARCH_B':
      return `<svg class="fia-symbol-svg" viewBox="0 0 24 18"><path d="M 2,4 L 11,4 L 11,14 L 22,14" fill="none" stroke="#000" stroke-width="2.4"/><polyline points="15,7 18,10 15,13" fill="none" stroke="#000" stroke-width="1.8"/></svg>`;
    case 'MARCH_H':
      return `<svg class="fia-symbol-svg" viewBox="0 0 24 18"><path d="M 2,14 L 11,14 L 11,4 L 22,4" fill="none" stroke="#000" stroke-width="2.4"/></svg>`;
    case 'DN':
    case 'DN L1':
    case 'DN L2':
    case 'DNT':
    case 'DN_CAS':
      return `<svg class="fia-symbol-svg" viewBox="0 0 32 16"><path d="M 1,13 Q 8,3 16,9 T 31,6 L 31,14 L 1,14 Z" fill="#D7D7D7" stroke="#000" stroke-width="1.4"/></svg>`;
    case 'RIO':
    case 'RIV':
      return `<svg class="fia-symbol-svg" viewBox="0 0 28 16"><path d="M 2,6 Q 8,1 14,6 T 26,6" fill="none" stroke="#0288D1" stroke-width="2.2"/><path d="M 2,11 Q 8,6 14,11 T 26,11" fill="none" stroke="#0288D1" stroke-width="2.2"/></svg>`;
    case 'CLOCK':
      return `<svg class="fia-symbol-svg" viewBox="0 0 20 20"><circle cx="10" cy="10" r="8" fill="none" stroke="#000" stroke-width="2"/><polyline points="10,5 10,10 14,10" fill="none" stroke="#000" stroke-width="1.8"/></svg>`;
    case 'CF':
      return `<svg class="fia-symbol-svg" viewBox="0 0 26 16"><line x1="2" y1="5" x2="24" y2="5" stroke="#000" stroke-width="2"/><line x1="2" y1="11" x2="24" y2="11" stroke="#000" stroke-width="2"/><line x1="6" y1="2" x2="6" y2="14" stroke="#000" stroke-width="2"/><line x1="13" y1="2" x2="13" y2="14" stroke="#000" stroke-width="2"/><line x1="20" y1="2" x2="20" y2="14" stroke="#000" stroke-width="2"/></svg>`;
    case 'BAR':
      return `<svg class="fia-symbol-svg" viewBox="0 0 24 16"><line x1="3" y1="14" x2="3" y2="6" stroke="#000" stroke-width="2.2"/><line x1="21" y1="14" x2="21" y2="6" stroke="#000" stroke-width="2.2"/><line x1="2" y1="8" x2="22" y2="8" stroke="#D32F2F" stroke-width="2.5" stroke-dasharray="3,2"/></svg>`;
    case 'CL':
    case 'AF':
      return `<svg class="fia-symbol-svg" viewBox="0 0 24 16"><line x1="2" y1="6" x2="22" y2="6" stroke="#000" stroke-width="1.5"/><line x1="2" y1="11" x2="22" y2="11" stroke="#000" stroke-width="1.5"/><line x1="5" y1="3" x2="5" y2="14" stroke="#000" stroke-width="2"/><line x1="12" y1="3" x2="12" y2="14" stroke="#000" stroke-width="2"/><line x1="19" y1="3" x2="19" y2="14" stroke="#000" stroke-width="2"/></svg>`;
    case 'ESSENCE':
      return `<svg class="fia-symbol-svg" viewBox="0 0 22 20"><rect x="3" y="4" width="10" height="14" rx="2" fill="none" stroke="#000" stroke-width="2"/><line x1="3" y1="9" x2="13" y2="9" stroke="#000" stroke-width="1.5"/><path d="M 13,6 C 17,6 18,9 18,12 L 18,16" fill="none" stroke="#D32F2F" stroke-width="2"/></svg>`;
    case 'MAIS':
    case 'BAT':
    case 'RUIN':
      return `<svg class="fia-symbol-svg" viewBox="0 0 22 20"><polygon points="11,2 2,9 20,9" fill="#000"/><rect x="4" y="9" width="14" height="9" fill="none" stroke="#000" stroke-width="2"/></svg>`;
    case 'CIT':
      return `<svg class="fia-symbol-svg" viewBox="0 0 22 20"><ellipse cx="11" cy="6" rx="7" ry="3" fill="none" stroke="#000" stroke-width="1.8"/><rect x="4" y="6" width="14" height="10" fill="none" stroke="#000" stroke-width="1.8"/><ellipse cx="11" cy="16" rx="7" ry="3" fill="none" stroke="#000" stroke-width="1.8"/></svg>`;
    case 'MONT':
    case 'ROCH':
      return `<svg class="fia-symbol-svg" viewBox="0 0 24 18"><polygon points="3,15 10,4 17,15" fill="none" stroke="#000" stroke-width="2"/><polygon points="14,15 18,7 22,15" fill="none" stroke="#000" stroke-width="1.8"/></svg>`;
    case 'PNEU':
      return `<svg class="fia-symbol-svg" viewBox="0 0 20 20"><circle cx="10" cy="10" r="8" fill="none" stroke="#000" stroke-width="3"/><circle cx="10" cy="10" r="3" fill="#000"/></svg>`;
    case 'BIDON':
      return `<svg class="fia-symbol-svg" viewBox="0 0 18 20"><rect x="3" y="3" width="12" height="15" rx="2" fill="none" stroke="#000" stroke-width="2"/><line x1="3" y1="8" x2="15" y2="8" stroke="#000" stroke-width="1.5"/><line x1="3" y1="13" x2="15" y2="13" stroke="#000" stroke-width="1.5"/></svg>`;
    case 'ANT':
    case 'LEL':
    case 'POT':
    case 'PEL':
    case 'HT':
      return `<svg class="fia-symbol-svg" viewBox="0 0 22 20"><line x1="11" y1="2" x2="11" y2="18" stroke="#000" stroke-width="2"/><line x1="5" y1="7" x2="17" y2="7" stroke="#000" stroke-width="2"/><line x1="7" y1="12" x2="15" y2="12" stroke="#000" stroke-width="1.8"/></svg>`;
    case 'SA':
    case 'CAIL':
      return `<svg class="fia-symbol-svg" viewBox="0 0 24 16"><circle cx="6" cy="6" r="2" fill="#000"/><circle cx="14" cy="5" r="2.5" fill="#000"/><circle cx="20" cy="7" r="1.5" fill="#000"/><circle cx="10" cy="11" r="2" fill="#000"/><circle cx="17" cy="12" r="2" fill="#000"/></svg>`;
    case '2X':
      return `<svg class="fia-symbol-svg" viewBox="0 0 22 18"><line x1="6" y1="2" x2="6" y2="16" stroke="#000" stroke-width="2.5"/><line x1="16" y1="2" x2="16" y2="16" stroke="#000" stroke-width="2.5"/><line x1="11" y1="3" x2="11" y2="15" stroke="#999" stroke-width="1.5" stroke-dasharray="3,2"/></svg>`;
    case 'RD':
    case 'PP':
    case 'P':
      return `<svg class="fia-symbol-svg" viewBox="0 0 22 18"><line x1="11" y1="2" x2="11" y2="16" stroke="#000" stroke-width="3.5"/></svg>`;
    case 'HP':
      return `<svg class="fia-symbol-svg" viewBox="0 0 22 18"><line x1="11" y1="2" x2="11" y2="16" stroke="#E65100" stroke-width="3" stroke-dasharray="4,3"/></svg>`;
    case 'PS':
    case 'PPS':
      return `<svg class="fia-symbol-svg" viewBox="0 0 22 18"><path d="M 11,16 C 5,12 17,6 11,2" fill="none" stroke="#000" stroke-width="2.8"/></svg>`;
    case 'G^D':
      return `<svg class="fia-symbol-svg" viewBox="0 0 24 18"><line x1="12" y1="2" x2="12" y2="16" stroke="#000" stroke-width="4.5"/></svg>`;
    default:
      return `<strong style="font-family:monospace;font-size:11px;">${c}</strong>`;
  }
}


const APP_LANGUAGES = [
  { code: "en", name: "English", flag: "🇬🇧" },
  { code: "fr", name: "Français", flag: "🇫🇷" },
  { code: "es", name: "Español", flag: "🇪🇸" },
  { code: "ar", name: "العربية", flag: "🇸🇦" },
  { code: "pt", name: "Português", flag: "🇵🇹" },
  { code: "de", name: "Deutsch", flag: "🇩🇪" },
  { code: "it", name: "Italiano", flag: "🇮🇹" },
  { code: "hi", name: "हिन्दी", flag: "🇮🇳" },
  { code: "ja", name: "日本語", flag: "🇯🇵" },
  { code: "zh", name: "中文", flag: "🇨🇳" }
];

let I18N_STRINGS = {};

class DakarAudioEngine {
  constructor() {
    this.ctx = null;
  }
  init() {
    if (!this.ctx) {
      const AudioContext = window.AudioContext || window.webkitAudioContext;
      this.ctx = new AudioContext();
    }
    if (this.ctx.state === 'suspended') {
      this.ctx.resume();
    }
  }
  playWaypointChirp() {
    this.init();
    const osc = this.ctx.createOscillator();
    const gain = this.ctx.createGain();
    osc.type = 'triangle';
    osc.frequency.setValueAtTime(1400, this.ctx.currentTime);
    osc.frequency.exponentialRampToValueAtTime(2200, this.ctx.currentTime + 0.12);
    gain.gain.setValueAtTime(0.4, this.ctx.currentTime);
    gain.gain.exponentialRampToValueAtTime(0.01, this.ctx.currentTime + 0.12);
    osc.connect(gain);
    gain.connect(this.ctx.destination);
    osc.start();
    osc.stop(this.ctx.currentTime + 0.12);
  }
  playSentinelAlarm() {
    this.init();
    const now = this.ctx.currentTime;
    for (let i = 0; i < 2; i++) {
      const osc = this.ctx.createOscillator();
      const gain = this.ctx.createGain();
      osc.type = 'sawtooth';
      osc.frequency.setValueAtTime(880, now + i * 0.15);
      gain.gain.setValueAtTime(0.3, now + i * 0.15);
      gain.gain.exponentialRampToValueAtTime(0.01, now + (i + 1) * 0.14);
      osc.connect(gain);
      gain.connect(this.ctx.destination);
      osc.start(now + i * 0.15);
      osc.stop(now + (i + 1) * 0.14);
    }
  }
  playOverspeedBuzzer() {
    this.init();
    const osc = this.ctx.createOscillator();
    const gain = this.ctx.createGain();
    osc.type = 'square';
    osc.frequency.setValueAtTime(440, this.ctx.currentTime);
    gain.gain.setValueAtTime(0.25, this.ctx.currentTime);
    gain.gain.exponentialRampToValueAtTime(0.01, this.ctx.currentTime + 0.08);
    osc.connect(gain);
    gain.connect(this.ctx.destination);
    osc.start();
    osc.stop(this.ctx.currentTime + 0.08);
  }
}

const audio = new DakarAudioEngine();

const state = {
  currentStage: null,
  routeCoordinates: [],
  currentNoteIndex: 0,
  currentLanguage: 'en',
  telemetry: {
    speedKmh: 0,
    speedUnit: 'km/h',
    headingDeg: 0,
    latitude: 0,
    longitude: 0,
    altitudeM: 0,
    slopeDeg: 0,
    totalOdoKM: 0.0,
    partialOdoKM: 0.0,
    validatedCount: 0,
    targetWptNum: '--',
    targetWptName: '--',
    dtwKM: 0.0,
    ctwDeg: 0,
    relativeBearingDeg: 0,
    activeSpeedLimit: null,
    isSpeedExceeded: false,
    isSimulating: false,
    simSpeedMult: 2.0,
    startTime: null,
    elapsedSeconds: 0,
    maxSpeedKmh: 0,
    avgSpeedKmh: 0
  },
  map: null,
  mapLayers: {},
  carMarker: null,
  routePolyline: null,
  alternatePolylines: [],
  wptMarkers: [],
  candidateRoutes: [],
  selectedCandidateIndex: 0
};

const DEFAULT_STAGE = {
  title: "STAGE 05: ALULA ➔ HA'IL (EMPTY QUARTER RAID)",
  totalDistanceKM: 418.5,
  waypointCount: 15,
  controlPointCount: 4,
  coordinates: [
    [26.6136, 37.9244],
    [26.6520, 38.0820],
    [26.7110, 38.3240],
    [26.7850, 38.6410],
    [26.8320, 38.8950],
    [26.9140, 39.2450],
    [27.0250, 39.7120],
    [27.1420, 40.2310],
    [27.2450, 40.6890],
    [27.3320, 41.0540],
    [27.4120, 41.3210],
    [27.4650, 41.4890],
    [27.4980, 41.6120],
    [27.5140, 41.6720],
    [27.5219, 41.6961]
  ],
  notes: [
    {
      id: 1,
      totalKM: 0.00,
      partialKM: 0.00,
      cap: 74,
      turnType: "straight",
      isOffTrack: false,
      wptType: "START",
      wptName: "DSS 01 (ALULA BIVOUAC)",
      danger: 0,
      speedLimit: 100,
      lexicon: ["START", "DZ", "PP"],
      text: "DEPART SS - FOLLOW MAIN TRACK INTO SANDSTONE CANYON",
      lat: 26.6136,
      lon: 37.9244,
      alt: 685,
      isBiffed: false
    },
    {
      id: 2,
      totalKM: 18.40,
      partialKM: 18.40,
      cap: 82,
      turnType: "slightRight",
      isOffTrack: true,
      wptType: "WPM",
      wptName: "WPM 01 (CANYON EXIT)",
      danger: 1,
      speedLimit: null,
      lexicon: ["HP", "DN", "DN L1", "!"],
      text: "FORK RIGHT OFF-TRACK HP - NAVIGATE DUNES LEVEL 1",
      lat: 26.6520,
      lon: 38.0820,
      alt: 712,
      isBiffed: false
    },
    {
      id: 3,
      totalKM: 46.20,
      partialKM: 27.80,
      cap: 95,
      turnType: "straight",
      isOffTrack: false,
      wptType: "WPC",
      wptName: "WPC 01 (VALLEY PASS)",
      danger: 0,
      speedLimit: null,
      lexicon: ["WPC", "PP", "OND", "ORNI"],
      text: "WPC 01 VALIDATION - TRACK WITH NUMEROUS RUTS AND UNDULATIONS",
      lat: 26.7110,
      lon: 38.3240,
      alt: 745,
      isBiffed: false
    },
    {
      id: 4,
      totalKM: 84.70,
      partialKM: 38.50,
      cap: 88,
      turnType: "straight",
      isOffTrack: false,
      wptType: "DZ",
      wptName: "DZ 01 (TAYMA VILLAGE)",
      danger: 2,
      speedLimit: 50,
      lexicon: ["DZ", "VIL", "SL50", "!!"],
      text: "SLOW DOWN DZ 50 - VILLAGE APPROACH & CAMEL HERDS",
      lat: 26.7850,
      lon: 38.6410,
      alt: 760,
      isBiffed: false
    },
    {
      id: 5,
      totalKM: 98.30,
      partialKM: 13.60,
      cap: 76,
      turnType: "straight",
      isOffTrack: false,
      wptType: "FZ",
      wptName: "FZ 01 (VILLAGE EXIT)",
      danger: 0,
      speedLimit: null,
      lexicon: ["FZ", "PP", "END_SL"],
      text: "FIN ZONE VITESSE FZ - ACCELERATE ON MAIN TRACK",
      lat: 26.8320,
      lon: 38.8950,
      alt: 772,
      isBiffed: false
    },
    {
      id: 6,
      totalKM: 145.80,
      partialKM: 47.50,
      cap: 84,
      turnType: "straight",
      isOffTrack: false,
      wptType: "CP",
      wptName: "CP 01 (REFUELING / TIMING)",
      danger: 0,
      speedLimit: null,
      lexicon: ["CP", "CIT", "CLOCK"],
      text: "CP 1 - OFFICIAL TIME CONTROL & MARSHAL CHECKPOINT",
      lat: 26.9140,
      lon: 39.2450,
      alt: 790,
      isBiffed: false
    },
    {
      id: 7,
      totalKM: 198.60,
      partialKM: 52.80,
      cap: 102,
      turnType: "right",
      isOffTrack: false,
      wptType: "WPM",
      wptName: "WPM 02 (WADI ES-SAHRA)",
      danger: 2,
      speedLimit: null,
      lexicon: ["WPM", "COMP", "SER", "!!"],
      text: "WPM 02 - TIGHT RIGHT AT ROCKY BLUFF - HEAVY COMPRESSION",
      lat: 27.0250,
      lon: 39.7120,
      alt: 835,
      isBiffed: false
    },
    {
      id: 8,
      totalKM: 242.10,
      partialKM: 43.50,
      cap: 78,
      turnType: "straight",
      isOffTrack: false,
      wptType: "WPC",
      wptName: "WPC 02 (PLATEAU DESCENT)",
      danger: 1,
      speedLimit: null,
      lexicon: ["WPC", "G^D", "DOWNHILL", "CAIL", "!"],
      text: "WPC 02 - FAST GRAVEL TRACK - STEEP DESCENT ON LOOSE STONES",
      lat: 27.1420,
      lon: 40.2310,
      alt: 865,
      isBiffed: false
    },
    {
      id: 9,
      totalKM: 289.40,
      partialKM: 47.30,
      cap: 90,
      turnType: "slightLeft",
      isOffTrack: true,
      wptType: "WPS",
      wptName: "WPS 01 (GREAT NAFUD DUNES)",
      danger: 3,
      speedLimit: null,
      lexicon: ["WPS", "DN", "DN L2", "DN_CAS", "!!!"],
      text: "WPS 01 - DANGER 3 BROKEN DUNES - EXTREME CAUTION ON CRESTS",
      lat: 27.2450,
      lon: 40.6890,
      alt: 890,
      isBiffed: false
    },
    {
      id: 10,
      totalKM: 328.70,
      partialKM: 39.30,
      cap: 68,
      turnType: "left",
      isOffTrack: false,
      wptType: "WPM",
      wptName: "WPM 03 (OUED CROSSING)",
      danger: 1,
      speedLimit: null,
      lexicon: ["WPM", "RIO", "FOSS", "DIP", "!"],
      text: "WPM 03 - CROSS DRY OUED BED - AVOID HIDDEN DITCHES",
      lat: 27.3320,
      lon: 41.0540,
      alt: 915,
      isBiffed: false
    },
    {
      id: 11,
      totalKM: 362.50,
      partialKM: 33.80,
      cap: 74,
      turnType: "straight",
      isOffTrack: false,
      wptType: "DZ",
      wptName: "DZ 02 (NATURE SANCTUARY)",
      danger: 0,
      speedLimit: 100,
      lexicon: ["DZ", "ZS", "AF", "SL100"],
      text: "DZ 100 - SENSITIVE WILDLIFE RESERVE - SPEED LIMIT ENFORCED",
      lat: 27.4120,
      lon: 41.3210,
      alt: 940,
      isBiffed: false
    },
    {
      id: 12,
      totalKM: 378.10,
      partialKM: 15.60,
      cap: 80,
      turnType: "straight",
      isOffTrack: false,
      wptType: "FZ",
      wptName: "FZ 02 (END SANCTUARY)",
      danger: 0,
      speedLimit: null,
      lexicon: ["FZ", "2X", "END_SL"],
      text: "FZ - SPEED LIMIT ENDS - ACCELERATE ON DUAL CARRIAGEWAY",
      lat: 27.4650,
      lon: 41.4890,
      alt: 955,
      isBiffed: false
    },
    {
      id: 13,
      totalKM: 398.90,
      partialKM: 20.80,
      cap: 72,
      turnType: "right",
      isOffTrack: false,
      wptType: "WPC",
      wptName: "WPC 03 (HA'IL PASS)",
      danger: 1,
      speedLimit: null,
      lexicon: ["WPC", "RUIN", "E3", "!"],
      text: "WPC 03 - PASS HISTORIC RUINS - TRACK NARROWS E3",
      lat: 27.4980,
      lon: 41.6120,
      alt: 975,
      isBiffed: false
    },
    {
      id: 14,
      totalKM: 412.30,
      partialKM: 13.40,
      cap: 70,
      turnType: "straight",
      isOffTrack: false,
      wptType: "WPS",
      wptName: "WPS 02 (APPROACH HA'IL)",
      danger: 0,
      speedLimit: null,
      lexicon: ["WPS", "PP", "PAN"],
      text: "WPS 02 - FINAL APPROACH - FOLLOW MARSHAL SIGNS",
      lat: 27.5140,
      lon: 41.6720,
      alt: 990,
      isBiffed: false
    },
    {
      id: 15,
      totalKM: 418.50,
      partialKM: 6.20,
      cap: 70,
      turnType: "straight",
      isOffTrack: false,
      wptType: "FINISH",
      wptName: "ASS 01 (HA'IL FINISH BEAM)",
      danger: 0,
      speedLimit: 30,
      lexicon: ["FINISH", "FZ", "SL30"],
      text: "ARRIVEE SPECIALE (ASS) - STOP AT OFFICIAL TIMING BEAM",
      lat: 27.5219,
      lon: 41.6961,
      alt: 1005,
      isBiffed: false
    }
  ]
};

window.addEventListener('DOMContentLoaded', async () => {
  await loadI18nStrings();
  initMap();
  setupUIEventListeners();
  renderLanguageOptions();
  startChronoTicker();
  updateTelemetry();
  loadStage(DEFAULT_STAGE);

  const savedLang = localStorage.getItem('dakar_lang');
  if (savedLang) {
    applyLanguage(savedLang);
  } else {
    document.getElementById('languageModal').style.display = 'flex';
  }

  if (navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(
      pos => {
        state.telemetry.latitude = pos.coords.latitude;
        state.telemetry.longitude = pos.coords.longitude;
        if (state.map) {
          state.map.setView([pos.coords.latitude, pos.coords.longitude], 13);
        }
        updateTelemetry();
      },
      () => {},
      { timeout: 5000 }
    );
  }
});

async function loadI18nStrings() {
  try {
    const res = await fetch('strings.json');
    I18N_STRINGS = await res.json();
  } catch (err) {
    console.warn("Could not load strings.json, using fallback", err);
    I18N_STRINGS = {
      en: {
        brand_title: "DAKAR RALLY", cert_tag: "FIA RALLYE RAID", split: "SPLIT", unik4: "UNIK4 GPS",
        roadbook: "ROADBOOK", map: "SATELLITE MAP", route_btn: "🗺️ ROUTE A ➔ B", lexicon_btn: "📖 FIA LEXICON",
        sim_btn: "⚡ RACE SIMULATOR", sim_active: "RACE SIMULATION ACTIVE", speed: "Speed", validated: "VALIDATED",
        target_wpt: "TARGET POINT", cap_gps: "CAP GPS", odo_total: "ODO total", odo_partiel: "ODO part.",
        chrono: "CHRONO", avg_speed: "V_AVG", max_speed: "V_MAX", eta: "ETA FINISH", ctw: "CTW (Target Cap)",
        dtw: "DTW (Distance)", next: "NEXT", gps: "GPS:", alt: "ALT:", slope: "SLOPE:", no_stage: "NO STAGE LOADED",
        distances: "DISTANCES", tulip: "TULIP DIAGRAM", notes_symbols: "NOTES / FIA SYMBOLS", satellite: "SATELLITE",
        terrain: "TERRAIN", streets: "STREETS", recenter: "🎯 RECENTER", select_language: "SELECT YOUR LANGUAGE",
        point_a: "Point A (Departure):", point_b: "Point B (Destination):", find_routes: "⚡ FIND ALTERNATIVE ROUTES",
        select_route: "SELECT PREFERRED ROUTE:", generate_roadbook: "⚡ GENERATE ROADBOOK FOR SELECTED ROUTE"
      }
    };
  }
}

function t(key) {
  const lang = state.currentLanguage || 'en';
  if (I18N_STRINGS[lang] && I18N_STRINGS[lang][key]) {
    return I18N_STRINGS[lang][key];
  }
  if (I18N_STRINGS['en'] && I18N_STRINGS['en'][key]) {
    return I18N_STRINGS['en'][key];
  }
  return key;
}

function applyLanguage(langCode) {
  state.currentLanguage = langCode;
  localStorage.setItem('dakar_lang', langCode);

  const langObj = APP_LANGUAGES.find(l => l.code === langCode);
  if (langObj) {
    document.getElementById('currentLangLabel').textContent = `${langObj.flag} ${langObj.code.toUpperCase()}`;
  }

  const setTxt = (id, str) => {
    const el = document.getElementById(id);
    if (el) el.textContent = str;
  };

  setTxt('txtBrandTitle', t('brand_title'));
  setTxt('txtCertTag', t('cert_tag'));
  setTxt('btnModeSplit', t('split'));
  setTxt('btnModeUnik4', t('unik4'));
  setTxt('btnModeRoadbook', t('roadbook'));
  setTxt('btnModeMap', t('map'));
  setTxt('btnOpenPlanner', t('route_btn'));
  setTxt('btnOpenLexicon', t('lexicon_btn'));
  setTxt('btnToggleSim', t('sim_btn'));
  setTxt('lblSpeed', `${t('speed')} ⇄`);
  setTxt('lblValidated', t('validated'));
  setTxt('lblTargetWpt', t('target_wpt'));
  setTxt('lblCapGps', t('cap_gps'));
  setTxt('lblOdoTotal', t('odo_total'));
  setTxt('lblOdoPartiel', t('odo_partiel'));
  setTxt('lblChrono', t('chrono'));
  setTxt('lblAvgSpeed', t('avg_speed'));
  setTxt('lblMaxSpeed', t('max_speed'));
  setTxt('lblEta', t('eta'));
  setTxt('lblCtw', t('ctw'));
  setTxt('lblDtw', t('dtw'));
  setTxt('lblGps', t('gps'));
  setTxt('lblAlt', t('alt'));
  setTxt('lblSlope', t('slope'));
  setTxt('thDistances', t('distances'));
  setTxt('thTulip', t('tulip'));
  setTxt('thLexicon', t('notes_symbols'));
  if (state.currentStage && state.currentStage.notes) {
    renderRoadbookTable(state.currentStage.notes);
  }
  const modal = document.getElementById('lexiconModal');
  if (modal && modal.style.display !== 'none') {
    const activeCat = document.querySelector('.lex-cat-btn.active')?.dataset.cat || 'all';
    const q = document.getElementById('lexiconSearchInput')?.value || '';
    renderLexiconGrid(activeCat, q);
  }
  setTxt('btnLayerSat', t('satellite'));
  setTxt('btnLayerTopo', t('terrain'));
  setTxt('btnLayerRoad', t('streets'));
  setTxt('btnRecenterCar', t('recenter'));
  setTxt('lblPointA', t('point_a'));
  setTxt('lblPointB', t('point_b'));
  setTxt('btnCalculateRoute', t('find_routes'));
  setTxt('lblSelectRoute', t('select_route'));
  setTxt('btnConfirmSelectedRoute', t('generate_roadbook'));

  if (!state.currentStage) {
    setTxt('rbStageTitle', t('no_stage'));
  }
}

function renderLanguageOptions() {
  const container = document.getElementById('languageOptionsList');
  if (!container) return;
  container.innerHTML = '';

  APP_LANGUAGES.forEach(lang => {
    const row = document.createElement('div');
    row.style.display = 'flex';
    row.style.alignItems = 'center';
    row.style.gap = '12px';
    row.style.padding = '10px 14px';
    row.style.background = '#1a1a1f';
    row.style.border = '1px solid #333';
    row.style.borderRadius = '6px';
    row.style.cursor = 'pointer';
    row.style.color = '#FFF';

    row.innerHTML = `
      <span style="font-size: 24px;">${lang.flag}</span>
      <span style="font-size: 15px; font-weight: 800; flex: 1;">${lang.name}</span>
      <span style="font-size: 12px; color: #888;">${lang.code.toUpperCase()}</span>
    `;

    row.onclick = () => {
      applyLanguage(lang.code);
      document.getElementById('languageModal').style.display = 'none';
    };

    container.appendChild(row);
  });
}

function initMap() {
  const mapElem = document.getElementById('satelliteMap');
  if (!mapElem) return;

  state.map = L.map('satelliteMap', {
    zoomControl: false,
    attributionControl: false
  }).setView([20.0, 0.0], 3);

  L.control.zoom({ position: 'bottomright' }).addTo(state.map);

  state.mapLayers.satellite = L.tileLayer('https://server.arcgisonline.com/ArcGIS/rest/services/World_Imagery/MapServer/tile/{z}/{y}/{x}', {
    maxZoom: 19
  });

  state.mapLayers.terrain = L.tileLayer('https://{s}.tile.opentopomap.org/{z}/{x}/{y}.png', {
    maxZoom: 17
  });

  state.mapLayers.streets = L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
    maxZoom: 19
  });

  state.mapLayers.satellite.addTo(state.map);

  const carIcon = L.divIcon({
    className: 'rally-car-marker',
    html: `
      <div class="rally-car-hud" id="carMarkerHud">
        <div class="car-heading-cone" id="carHeadingCone"></div>
        <div class="car-dot"></div>
      </div>
    `,
    iconSize: [40, 40],
    iconAnchor: [20, 20]
  });

  state.carMarker = L.marker([0, 0], { icon: carIcon }).addTo(state.map);
}

function startChronoTicker() {
  setInterval(() => {
    if (state.telemetry.startTime) {
      state.telemetry.elapsedSeconds = Math.floor((Date.now() - state.telemetry.startTime) / 1000);
      const hours = Math.floor(state.telemetry.elapsedSeconds / 3600);
      const mins = Math.floor((state.telemetry.elapsedSeconds % 3600) / 60);
      const secs = state.telemetry.elapsedSeconds % 60;
      document.getElementById('telemetryChrono').textContent = 
        `${String(hours).padStart(2, '0')}:${String(mins).padStart(2, '0')}:${String(secs).padStart(2, '0')}`;

      if (state.telemetry.elapsedSeconds > 0) {
        state.telemetry.avgSpeedKmh = (state.telemetry.totalOdoKM / (state.telemetry.elapsedSeconds / 3600));
        const unitLabel = state.telemetry.speedUnit;
        const avgDisplay = unitLabel === 'mph' ? (state.telemetry.avgSpeedKmh * 0.621371) : state.telemetry.avgSpeedKmh;
        document.getElementById('telemetryAvgSpeed').textContent = `${avgDisplay.toFixed(1)} ${unitLabel}`;
      }
    }
  }, 1000);
}

function loadStage(stage) {
  state.currentStage = stage;
  state.routeCoordinates = stage.coordinates;
  state.currentNoteIndex = 0;

  state.telemetry.totalOdoKM = 0.0;
  state.telemetry.partialOdoKM = 0.0;
  state.telemetry.validatedCount = 0;
  state.telemetry.startTime = Date.now();
  state.telemetry.maxSpeedKmh = 0;
  state.telemetry.avgSpeedKmh = 0;

  document.getElementById('rbStageTitle').textContent = stage.title;
  document.getElementById('rbMetaDst').textContent = `DST: ${stage.totalDistanceKM} km`;
  document.getElementById('rbMetaWp').textContent = `WP: ${stage.waypointCount}`;
  document.getElementById('rbMetaCp').textContent = `CP: ${stage.controlPointCount}`;
  const footStage = document.getElementById('telemStageFoot');
  if (footStage) footStage.textContent = `${stage.title} - ${stage.totalDistanceKM} km`;

  if (stage.notes && stage.notes.length > 0) {
    const firstNote = stage.notes[0];
    state.telemetry.latitude = firstNote.lat;
    state.telemetry.longitude = firstNote.lon;
    state.telemetry.headingDeg = firstNote.cap;
    state.telemetry.altitudeM = firstNote.alt;
    state.telemetry.targetWptNum = firstNote.id;
    state.telemetry.targetWptName = firstNote.wptName || `WPT ${firstNote.id}`;
    state.telemetry.activeSpeedLimit = firstNote.speedLimit;
  }

  renderRoadbookTable(stage.notes);
  renderMapRoute(stage.coordinates, stage.notes);
  updateTelemetry();
}

function renderRoadbookTable(notes) {
  const tbody = document.getElementById('roadbookBody');
  if (!tbody) return;
  tbody.innerHTML = '';

  notes.forEach((note, index) => {
    const tr = document.createElement('tr');
    tr.className = `note-row ${note.isBiffed ? 'biffed' : ''} ${index === state.currentNoteIndex ? 'active' : ''}`;
    tr.id = `noteRow_${note.id}`;
    tr.onclick = (e) => {
      if (e.shiftKey || e.altKey) {
        note.isBiffed = !note.isBiffed;
        tr.classList.toggle('biffed', note.isBiffed);
      } else {
        state.currentNoteIndex = index;
        selectCurrentNote(index);
      }
    };

    const tdDist = document.createElement('td');
    tdDist.className = 'col-distance';
    tdDist.innerHTML = `
      <div class="cell-distance">
        <div class="total-distance-box">${note.totalKM.toFixed(2)}</div>
        <div class="partial-distance-row">
          <span class="note-badge-seq">#${note.id}</span>
          <span class="partial-distance-num">${note.partialKM.toFixed(2)}</span>
        </div>
        ${note.wptName ? `<div class="wpt-name-tag">${note.wptName}</div>` : ''}
      </div>
    `;

    const tdTulip = document.createElement('td');
    tdTulip.className = 'col-tulip';
    tdTulip.innerHTML = `
      <div class="cell-tulip">
        ${renderTulipSVG(note)}
        ${note.cap > 0 ? `<div class="tulip-cap-badge">CAP ${note.cap}°</div>` : ''}
      </div>
    `;

    const tdLex = document.createElement('td');
    tdLex.className = 'col-lexicon';

    let dangerHtml = '';
    if (note.danger === 1) dangerHtml = '<div class="danger-marks">!</div>';
    else if (note.danger === 2) dangerHtml = '<div class="danger-marks">!!</div>';
    else if (note.danger >= 3) dangerHtml = '<div class="danger-marks">!!!</div>';

    let speedHtml = '';
    if (note.speedLimit) {
      speedHtml = `<div class="speed-circle">${note.speedLimit}</div>`;
    }

    // Special icons for specific features
    let specialIconsHtml = '';
    const specialCodes = ['OND', 'ORNI', 'COMP', 'DIP', 'FOSS', 'DOWNHILL', 'UPHILL', 'MARCH_B', 'MARCH_H', 'DN', 'DN L1', 'DN L2', 'DN_CAS', 'RIO'];
    (note.lexicon || []).forEach(code => {
      const c = code.toUpperCase();
      if (specialCodes.includes(c)) {
        specialIconsHtml += renderFiaSignIcon(c);
      }
    });

    // All lexicon tags with both acronym AND full localized name/label
    const filteredLex = (note.lexicon || []).filter(code => {
      const c = code.toUpperCase();
      return !c.startsWith('!') && c !== 'START' && c !== 'FINISH';
    });

    const lexTagsHtml = filteredLex.map(code => {
      const item = FIA_LEXICON.find(i => i.code.toUpperCase() === code.toUpperCase()) || { code, en: code, fr: code, cat: 'specificities' };
      const localName = getLocalizedLexName(item);
      const titleAttr = `${item.en} • ${item.fr}`;
      return `
        <span class="lex-tag ${tagColorClass(code)}" title="${titleAttr}">
          <strong class="lex-tag-code">${code}</strong>
          <span class="lex-tag-label">${localName}</span>
        </span>
      `;
    }).join(' ');

    tdLex.innerHTML = `
      <div class="cell-lexicon">
        <div class="lex-row-top">
          ${renderWptStamp(note.wptType, note.wptName)}
          ${dangerHtml}
          ${speedHtml}
          ${specialIconsHtml}
        </div>
        <div class="lex-codes-tags">${lexTagsHtml}</div>
        <div class="instruction-text">${note.text || ''}</div>
      </div>
    `;

    tr.appendChild(tdDist);
    tr.appendChild(tdTulip);
    tr.appendChild(tdLex);
    tbody.appendChild(tr);
  });
}

function renderTulipSVG(note) {
  let pathD = "M 90,85 L 90,45 L 140,25";
  let arrowHead = `<polygon points="140,20 152,28 138,34" fill="#000" />`;
  let dashAttr = note.isOffTrack ? 'stroke-dasharray="6,4"' : '';

  if (note.turnType === "straight") {
    pathD = "M 90,85 L 90,15";
    arrowHead = `<polygon points="84,20 90,8 96,20" fill="#000" />`;
  } else if (note.turnType === "right") {
    pathD = "M 90,85 L 90,50 L 145,50";
    arrowHead = `<polygon points="140,44 152,50 140,56" fill="#000" />`;
  } else if (note.turnType === "left") {
    pathD = "M 90,85 L 90,50 L 35,50";
    arrowHead = `<polygon points="40,44 28,50 40,56" fill="#000" />`;
  } else if (note.turnType === "slightRight") {
    pathD = "M 90,85 L 90,55 L 135,25";
    arrowHead = `<polygon points="132,20 144,28 132,34" fill="#000" />`;
  } else if (note.turnType === "slightLeft") {
    pathD = "M 90,85 L 90,55 L 45,25";
    arrowHead = `<polygon points="48,20 36,28 48,34" fill="#000" />`;
  }

  let duneShape = '';
  if (note.hasDuneRidge || (note.lexicon && note.lexicon.includes('DN'))) {
    duneShape = `
      <path d="M 30,55 Q 60,35 90,50 T 150,45 L 150,65 L 30,65 Z" fill="#D7D7D7" stroke="#999" stroke-width="1"/>
    `;
  }

  let secondaryBranch = '';
  if (note.secondaryBranchText) {
    secondaryBranch = `
      <text x="125" y="65" font-family="monospace" font-size="11" font-weight="900" fill="#000">${note.secondaryBranchText}</text>
    `;
  }

  return `
    <svg class="tulip-svg" viewBox="0 0 180 98">
      <rect width="180" height="98" fill="#FFF" />
      ${duneShape}
      <path d="${pathD}" fill="none" stroke="#000" stroke-width="3.8" ${dashAttr} />
      ${arrowHead}
      ${secondaryBranch}
    </svg>
  `;
}

function renderWptStamp(type, name) {
  if (!type) return '';
  const t = type.toUpperCase();
  const label = name ? name.split(' ')[0] : t;
  switch (t) {
    case 'START':
      return `<div class="wpt-stamp start" title="Start Point (DSS)">START</div>`;
    case 'FINISH':
      return `<div class="wpt-stamp finish" title="Arrival Special Stage (ASS)">ASS</div>`;
    case 'DZ':
      return `<div class="wpt-stamp dz" title="Début Zone de Vitesse (Speed Zone Start)">DZ</div>`;
    case 'FZ':
      return `<div class="wpt-stamp fz" title="Fin Zone de Vitesse (Speed Zone End)">FZ</div>`;
    case 'CP':
      return `<div class="wpt-stamp cp" title="Contrôle de Passage (Checkpoint)">CP</div>`;
    case 'WPC':
      return `<div class="wpt-stamp wpc" title="Waypoint Control (WPC)">WPC</div>`;
    case 'WPS':
      return `<div class="wpt-stamp wps" title="Waypoint Safety (WPS)">WPS</div>`;
    case 'WPM':
      return `<div class="wpt-stamp wpm" title="Waypoint Masked (WPM)">WPM</div>`;
    default:
      return `<div class="wpt-stamp" title="${t}">${label}</div>`;
  }
}

function renderMapRoute(coords, notes) {
  if (!state.map) return;

  if (state.routePolyline) state.map.removeLayer(state.routePolyline);
  state.alternatePolylines.forEach(p => state.map.removeLayer(p));
  state.alternatePolylines = [];
  state.wptMarkers.forEach(m => state.map.removeLayer(m));
  state.wptMarkers = [];

  state.routePolyline = L.polyline(coords, {
    color: '#FF6D00',
    weight: 5,
    opacity: 0.95,
    smoothFactor: 1
  }).addTo(state.map);

  notes.forEach(note => {
    const marker = L.circleMarker([note.lat, note.lon], {
      radius: 7,
      fillColor: note.wptType === 'START' ? '#00E676' : note.wptType === 'FINISH' ? '#000' : '#FFE500',
      color: '#000',
      weight: 2,
      fillOpacity: 1
    }).bindPopup(`<b>Note #${note.id}</b><br>${note.text}`).addTo(state.map);
    state.wptMarkers.push(marker);
  });

  state.map.fitBounds(state.routePolyline.getBounds(), { padding: [50, 50] });
}

function toggleNoteBiffage(index) {
  if (!state.currentStage || !state.currentStage.notes[index]) return;
  const note = state.currentStage.notes[index];
  note.isBiffed = !note.isBiffed;

  const row = document.getElementById(`noteRow_${note.id}`);
  if (row) {
    row.classList.toggle('biffed', note.isBiffed);
  }
}

function updateTelemetry() {
  const t = state.telemetry;
  const speedDisplay = t.speedUnit === 'mph' ? Math.round(t.speedKmh * 0.621371) : Math.round(t.speedKmh);

  document.getElementById('telemetrySpeed').textContent = speedDisplay;
  document.getElementById('telemetrySpeedUnit').textContent = t.speedUnit;
  document.getElementById('telemetryHeading').textContent = `${Math.round(t.headingDeg)}°`;
  document.getElementById('telemetryOdoTotal').textContent = t.totalOdoKM.toFixed(2);
  document.getElementById('telemetryOdoPartiel').textContent = t.partialOdoKM.toFixed(2);
  document.getElementById('telemetryValidated').textContent = t.validatedCount;
  document.getElementById('telemetryWptNum').textContent = t.targetWptNum;
  document.getElementById('telemetryWptName').textContent = t.targetWptName;
  document.getElementById('telemetryDtw').textContent = t.dtwKM.toFixed(2);
  document.getElementById('telemetryCtw').textContent = `${Math.round(t.ctwDeg)}°`;
  
  if (t.latitude !== 0 || t.longitude !== 0) {
    document.getElementById('telemetryCoords').textContent = `${t.latitude.toFixed(4)}°, ${t.longitude.toFixed(4)}°`;
  } else {
    document.getElementById('telemetryCoords').textContent = '--';
  }

  document.getElementById('telemetryAlt').textContent = `${Math.round(t.altitudeM)} m`;
  document.getElementById('telemetrySlope').textContent = `${t.slopeDeg > 0 ? '+' : ''}${t.slopeDeg.toFixed(1)}°`;

  const nextElem = document.getElementById('telemNextDist');
  if (nextElem) nextElem.textContent = `NEXT ${t.dtwKM.toFixed(2)}`;
  const footCap = document.getElementById('telemFootCap');
  if (footCap) footCap.textContent = `Cap ${Math.round(t.ctwDeg)}°`;

  const arrow = document.getElementById('steeringArrow');
  if (arrow) {
    arrow.style.transform = `rotate(${t.relativeBearingDeg}deg)`;
  }

  const cone = document.getElementById('carHeadingCone');
  if (cone) {
    cone.style.transform = `rotate(${t.headingDeg}deg)`;
  }
  if (state.carMarker && (t.latitude !== 0 || t.longitude !== 0)) {
    state.carMarker.setLatLng([t.latitude, t.longitude]);
  }

  const alertBox = document.getElementById('speedZoneAlert');
  if (t.activeSpeedLimit) {
    alertBox.style.display = 'flex';
    document.getElementById('zoneCurSpeed').textContent = speedDisplay;
    document.getElementById('zoneMaxLimit').textContent = `MAX ${t.activeSpeedLimit}`;
    if (t.speedKmh > t.activeSpeedLimit) {
      alertBox.style.background = 'rgba(211, 47, 47, 0.3)';
      audio.playOverspeedBuzzer();
    } else {
      alertBox.style.background = 'rgba(211, 47, 47, 0.1)';
    }
  } else {
    alertBox.style.display = 'none';
  }
}

let simInterval = null;
let simProgress = 0;

function startSimulation() {
  if (!state.routeCoordinates || state.routeCoordinates.length < 2) return;
  state.telemetry.isSimulating = true;
  document.getElementById('simBanner').style.display = 'flex';

  simInterval = setInterval(() => {
    simProgress += 0.008 * state.telemetry.simSpeedMult;
    if (simProgress >= state.routeCoordinates.length - 1) {
      simProgress = 0;
    }

    const curIdx = Math.floor(simProgress);
    const nextIdx = Math.min(curIdx + 1, state.routeCoordinates.length - 1);
    const frac = simProgress - curIdx;

    const p1 = state.routeCoordinates[curIdx];
    const p2 = state.routeCoordinates[nextIdx];

    const lat = p1[0] + (p2[0] - p1[0]) * frac;
    const lon = p1[1] + (p2[1] - p1[1]) * frac;

    const heading = calculateBearing(p1[0], p1[1], p2[0], p2[1]);
    state.telemetry.latitude = lat;
    state.telemetry.longitude = lon;
    state.telemetry.headingDeg = heading;
    state.telemetry.speedKmh = (75 + Math.sin(simProgress * 10) * 15) * state.telemetry.simSpeedMult;
    state.telemetry.altitudeM = 420 + Math.sin(simProgress * 5) * 45;
    state.telemetry.slopeDeg = Math.sin(simProgress * 8) * 4;

    if (state.telemetry.speedKmh > state.telemetry.maxSpeedKmh) {
      state.telemetry.maxSpeedKmh = state.telemetry.speedKmh;
      const unitLabel = state.telemetry.speedUnit;
      const maxDisplay = unitLabel === 'mph' ? (state.telemetry.maxSpeedKmh * 0.621371) : state.telemetry.maxSpeedKmh;
      document.getElementById('telemetryMaxSpeed').textContent = `${Math.round(maxDisplay)} ${unitLabel}`;
    }

    const deltaKM = (state.telemetry.speedKmh / 3600) * 0.2;
    state.telemetry.totalOdoKM += deltaKM;
    state.telemetry.partialOdoKM += deltaKM;

    if (state.currentStage && state.currentStage.notes[state.currentNoteIndex]) {
      const targetNote = state.currentStage.notes[state.currentNoteIndex];
      const distM = getDistanceMeters(lat, lon, targetNote.lat, targetNote.lon);
      state.telemetry.dtwKM = distM / 1000;
      state.telemetry.ctwDeg = calculateBearing(lat, lon, targetNote.lat, targetNote.lon);

      let diff = state.telemetry.ctwDeg - state.telemetry.headingDeg;
      while (diff > 180) diff -= 360;
      while (diff < -180) diff += 360;
      state.telemetry.relativeBearingDeg = diff;

      if (distM < 60 && !targetNote.isBiffed) {
        targetNote.isBiffed = true;
        state.telemetry.validatedCount++;
        audio.playWaypointChirp();

        const row = document.getElementById(`noteRow_${targetNote.id}`);
        if (row) row.classList.add('biffed');

        if (state.currentNoteIndex < state.currentStage.notes.length - 1) {
          state.currentNoteIndex++;
          state.telemetry.partialOdoKM = 0;
          const nextNote = state.currentStage.notes[state.currentNoteIndex];
          state.telemetry.targetWptNum = nextNote.id;
          state.telemetry.targetWptName = nextNote.wptName || `WPT ${nextNote.id}`;
          state.telemetry.activeSpeedLimit = nextNote.speedLimit;

          const nextRow = document.getElementById(`noteRow_${nextNote.id}`);
          if (nextRow) {
            document.querySelectorAll('.note-row').forEach(r => r.classList.remove('active'));
            nextRow.classList.add('active');
            nextRow.scrollIntoView({ behavior: 'smooth', block: 'center' });
          }
        }
      }
    }

    updateTelemetry();
  }, 200);
}

function stopSimulation() {
  if (simInterval) clearInterval(simInterval);
  simInterval = null;
  state.telemetry.isSimulating = false;
  document.getElementById('simBanner').style.display = 'none';
}

function calculateBearing(lat1, lon1, lat2, lon2) {
  const dLon = (lon2 - lon1) * Math.PI / 180;
  const y = Math.sin(dLon) * Math.cos(lat2 * Math.PI / 180);
  const x = Math.cos(lat1 * Math.PI / 180) * Math.sin(lat2 * Math.PI / 180) -
            Math.sin(lat1 * Math.PI / 180) * Math.cos(lat2 * Math.PI / 180) * Math.cos(dLon);
  const deg = (Math.atan2(y, x) * 180 / Math.PI + 360) % 360;
  return deg;
}

function getDistanceMeters(lat1, lon1, lat2, lon2) {
  const R = 6371e3;
  const φ1 = lat1 * Math.PI / 180;
  const φ2 = lat2 * Math.PI / 180;
  const Δφ = (lat2 - lat1) * Math.PI / 180;
  const Δλ = (lon2 - lon1) * Math.PI / 180;
  const a = Math.sin(Δφ/2) * Math.sin(Δφ/2) +
            Math.cos(φ1) * Math.cos(φ2) *
            Math.sin(Δλ/2) * Math.sin(Δλ/2);
  const c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a));
  return R * c;
}

function selectCurrentNote(idx) {
  if (!state.currentStage || !state.currentStage.notes[idx]) return;
  const note = state.currentStage.notes[idx];
  state.telemetry.targetWptNum = note.id;
  state.telemetry.targetWptName = note.wptName || `WPT ${note.id}`;
  state.telemetry.activeSpeedLimit = note.speedLimit;
  document.querySelectorAll('.note-row').forEach(r => r.classList.remove('active'));
  const row = document.getElementById(`noteRow_${note.id}`);
  if (row) {
    row.classList.add('active');
    row.scrollIntoView({ behavior: 'smooth', block: 'center' });
  }
  updateTelemetry();
}

function setupUIEventListeners() {
  document.querySelectorAll('.mode-btn').forEach(btn => {
    btn.onclick = () => {
      document.querySelectorAll('.mode-btn').forEach(b => b.classList.remove('active'));
      btn.classList.add('active');
      const mode = btn.dataset.mode;
      document.body.className = `mode-${mode}`;
      if (state.map) setTimeout(() => state.map.invalidateSize(), 200);
    };
  });

  document.getElementById('btnToggleSpeedUnit').onclick = () => {
    state.telemetry.speedUnit = state.telemetry.speedUnit === 'km/h' ? 'mph' : 'km/h';
    updateTelemetry();
  };

  document.getElementById('btnOpenLanguageModal').onclick = () => {
    document.getElementById('languageModal').style.display = 'flex';
  };
  document.getElementById('btnCloseLanguageModal').onclick = () => {
    document.getElementById('languageModal').style.display = 'none';
  };

  document.getElementById('keyOk').onclick = () => {
    toggleNoteBiffage(state.currentNoteIndex);
  };
  document.getElementById('keyStn').onclick = () => {
    audio.playSentinelAlarm();
  };
  document.getElementById('keyTripRst').onclick = () => {
    state.telemetry.partialOdoKM = 0.0;
    updateTelemetry();
  };
  document.getElementById('btnQuickRst').onclick = () => {
    state.telemetry.partialOdoKM = 0.0;
    updateTelemetry();
  };
  document.getElementById('keyOdoPlus').onclick = () => {
    state.telemetry.totalOdoKM += 0.10;
    updateTelemetry();
  };
  document.getElementById('keyOdoMinus').onclick = () => {
    state.telemetry.totalOdoKM = Math.max(0, state.telemetry.totalOdoKM - 0.10);
    updateTelemetry();
  };
  document.getElementById('keyNoteNext').onclick = () => {
    if (state.currentStage && state.currentNoteIndex < state.currentStage.notes.length - 1) {
      state.currentNoteIndex++;
      selectCurrentNote(state.currentNoteIndex);
    }
  };
  document.getElementById('keyNotePrev').onclick = () => {
    if (state.currentNoteIndex > 0) {
      state.currentNoteIndex--;
      selectCurrentNote(state.currentNoteIndex);
    }
  };

  document.getElementById('btnToggleSim').onclick = () => {
    if (state.telemetry.isSimulating) {
      stopSimulation();
    } else {
      startSimulation();
    }
  };
  document.getElementById('btnStopSim').onclick = () => stopSimulation();
  document.querySelectorAll('.sim-speed-btn').forEach(btn => {
    btn.onclick = () => {
      document.querySelectorAll('.sim-speed-btn').forEach(b => b.classList.remove('active'));
      btn.classList.add('active');
      state.telemetry.simSpeedMult = parseFloat(btn.dataset.speed);
    };
  });

  document.getElementById('btnOpenPlanner').onclick = () => {
    document.getElementById('routeModal').style.display = 'flex';
  };
  document.getElementById('btnCloseRouteModal').onclick = () => {
    document.getElementById('routeModal').style.display = 'none';
  };

  document.getElementById('btnOpenLexicon').onclick = () => {
    document.getElementById('lexiconModal').style.display = 'flex';
    const activeCat = document.querySelector('.lex-cat-btn.active')?.dataset.cat || 'all';
    const q = document.getElementById('lexiconSearchInput')?.value || '';
    renderLexiconGrid(activeCat, q);
  };
  document.getElementById('btnCloseLexiconModal').onclick = () => {
    document.getElementById('lexiconModal').style.display = 'none';
  };
  document.querySelectorAll('.lex-cat-btn').forEach(btn => {
    btn.onclick = () => {
      document.querySelectorAll('.lex-cat-btn').forEach(b => b.classList.remove('active'));
      btn.classList.add('active');
      const q = document.getElementById('lexiconSearchInput')?.value || '';
      renderLexiconGrid(btn.dataset.cat, q);
    };
  });
  const searchInput = document.getElementById('lexiconSearchInput');
  if (searchInput) {
    searchInput.oninput = (e) => {
      const activeCat = document.querySelector('.lex-cat-btn.active')?.dataset.cat || 'all';
      renderLexiconGrid(activeCat, e.target.value);
    };
  }

  document.getElementById('btnLayerSat').onclick = () => {
    switchMapLayer('satellite', 'btnLayerSat');
  };
  document.getElementById('btnLayerTopo').onclick = () => {
    switchMapLayer('terrain', 'btnLayerTopo');
  };
  document.getElementById('btnLayerRoad').onclick = () => {
    switchMapLayer('streets', 'btnLayerRoad');
  };

  document.getElementById('btnRecenterCar').onclick = () => {
    if (state.map && (state.telemetry.latitude !== 0 || state.telemetry.longitude !== 0)) {
      state.map.setView([state.telemetry.latitude, state.telemetry.longitude], 14);
    }
  };

  document.getElementById('btnCalculateRoute').onclick = () => {
    const fromVal = document.getElementById('inputPointA').value.trim();
    const toVal = document.getElementById('inputPointB').value.trim();
    if (!toVal) {
      alert("Please enter a destination Point B.");
      return;
    }
    findAlternativeRoutes(fromVal, toVal);
  };

  document.getElementById('btnConfirmSelectedRoute').onclick = () => {
    generateRoadbookForCandidate(state.selectedCandidateIndex);
  };

  setupAutocomplete('inputPointA', 'suggestPointA');
  setupAutocomplete('inputPointB', 'suggestPointB');
}

function setupAutocomplete(inputId, dropdownId) {
  const input = document.getElementById(inputId);
  const dropdown = document.getElementById(dropdownId);
  if (!input || !dropdown) return;
  let debounceTimer = null;

  input.addEventListener('input', () => {
    clearTimeout(debounceTimer);
    const query = input.value.trim();
    if (query.length < 2) {
      dropdown.style.display = 'none';
      dropdown.innerHTML = '';
      return;
    }
    debounceTimer = setTimeout(async () => {
      try {
        const res = await fetch(`https://nominatim.openstreetmap.org/search?format=json&q=${encodeURIComponent(query)}&limit=5`);
        const data = await res.json();
        dropdown.innerHTML = '';
        if (data && data.length) {
          data.forEach(item => {
            const row = document.createElement('div');
            row.className = 'autocomplete-item';
            const parts = item.display_name.split(',');
            const mainTitle = parts[0];
            const subTitle = parts.slice(1, 3).join(', ');
            row.innerHTML = `
              <span>📍</span>
              <span class="autocomplete-item-title">${mainTitle}</span>
              <span class="autocomplete-item-sub">${subTitle}</span>
            `;
            row.onclick = () => {
              input.value = item.display_name;
              dropdown.style.display = 'none';
              dropdown.innerHTML = '';
            };
            dropdown.appendChild(row);
          });
          dropdown.style.display = 'block';
        } else {
          dropdown.style.display = 'none';
        }
      } catch (e) {
        dropdown.style.display = 'none';
      }
    }, 250);
  });

  document.addEventListener('click', (e) => {
    if (!input.contains(e.target) && !dropdown.contains(e.target)) {
      dropdown.style.display = 'none';
    }
  });
}

function switchMapLayer(layerName, btnId) {
  if (!state.map) return;
  Object.values(state.mapLayers).forEach(l => state.map.removeLayer(l));
  if (state.mapLayers[layerName]) {
    state.mapLayers[layerName].addTo(state.map);
  }
  document.querySelectorAll('.layer-btn').forEach(b => b.classList.remove('active'));
  const btn = document.getElementById(btnId);
  if (btn) btn.classList.add('active');
}

function renderLexiconGrid(category = 'all', searchQuery = '') {
  const container = document.getElementById('lexiconGrid');
  if (!container) return;
  container.innerHTML = '';

  const q = (searchQuery || '').trim().toLowerCase();
  const filtered = FIA_LEXICON.filter(item => {
    const matchCat = (category === 'all' || item.cat === category);
    if (!matchCat) return false;
    if (!q) return true;
    const localName = getLocalizedLexName(item).toLowerCase();
    return item.code.toLowerCase().includes(q) ||
           item.en.toLowerCase().includes(q) ||
           item.fr.toLowerCase().includes(q) ||
           localName.includes(q);
  });

  if (filtered.length === 0) {
    container.innerHTML = `<div style="grid-column: 1/-1; text-align:center; padding: 32px 16px; color:#888; font-size:13px;">No FIA symbols match "${searchQuery}"</div>`;
    return;
  }

  filtered.forEach(item => {
    const card = document.createElement('div');
    card.className = 'lexicon-card-item';
    const localName = getLocalizedLexName(item);
    const iconHtml = renderFiaSignIcon(item.code);

    card.innerHTML = `
      <div class="lex-item-icon-box" title="${item.en} - ${item.fr}">${iconHtml}</div>
      <div class="lex-item-code">${item.code}</div>
      <div class="lex-item-names">
        <span class="lex-name-local">${localName}</span>
        <span class="lex-name-en">${item.en}</span>
        <span class="lex-name-fr">${item.fr}</span>
      </div>
      <span class="lex-item-cat">${item.cat}</span>
    `;
    container.appendChild(card);
  });
}

async function findAlternativeRoutes(fromQuery, toQuery) {
  const btn = document.getElementById('btnCalculateRoute');
  btn.textContent = 'FINDING ROUTES...';

  try {
    let startLat = state.telemetry.latitude;
    let startLon = state.telemetry.longitude;

    if (fromQuery && fromQuery.toLowerCase() !== "current location") {
      const fromGeo = await fetch(`https://nominatim.openstreetmap.org/search?format=json&q=${encodeURIComponent(fromQuery)}`).then(r => r.json());
      if (!fromGeo.length) {
        alert(`Could not find departure location: "${fromQuery}"`);
        btn.textContent = t('find_routes');
        return;
      }
      startLat = parseFloat(fromGeo[0].lat);
      startLon = parseFloat(fromGeo[0].lon);
    }

    const toGeo = await fetch(`https://nominatim.openstreetmap.org/search?format=json&q=${encodeURIComponent(toQuery)}`).then(r => r.json());
    if (!toGeo.length) {
      alert(`Could not find destination location: "${toQuery}"`);
      btn.textContent = t('find_routes');
      return;
    }
    const endLat = parseFloat(toGeo[0].lat);
    const endLon = parseFloat(toGeo[0].lon);

    const routeUrl = `https://router.project-osrm.org/route/v1/driving/${startLon},${startLat};${endLon},${endLat}?overview=full&geometries=geojson&steps=true&alternatives=true`;
    const routeRes = await fetch(routeUrl).then(r => r.json());

    if (!routeRes.routes || !routeRes.routes.length) {
      alert("No route found between points.");
      btn.textContent = t('find_routes');
      return;
    }

    state.candidateRoutes = routeRes.routes.map((r, idx) => {
      const distKM = parseFloat((r.distance / 1000).toFixed(1));
      const durMin = Math.round(r.duration / 60);
      const label = idx === 0 ? "Route 1 (Shortest Raid Track)" : (idx === 1 ? "Route 2 (Alternate Dune Track)" : `Route ${idx + 1} (Main Road Track)`);
      return {
        id: idx,
        name: `${label} • ${distKM} km • ${durMin} min`,
        rawRoute: r,
        fromLabel: fromQuery || "CURRENT GPS",
        toLabel: toQuery
      };
    });

    state.selectedCandidateIndex = 0;
    renderCandidateRoutesList();

    btn.textContent = t('find_routes');

  } catch (err) {
    console.error(err);
    alert("Error searching routes: " + err.message);
    btn.textContent = t('find_routes');
  }
}

function renderCandidateRoutesList() {
  const container = document.getElementById('alternateRoutesContainer');
  const list = document.getElementById('alternateRoutesList');
  if (!container || !list) return;

  container.style.display = 'block';
  list.innerHTML = '';

  state.candidateRoutes.forEach((cand, idx) => {
    const item = document.createElement('div');
    item.style.padding = '10px';
    item.style.border = idx === state.selectedCandidateIndex ? '2px solid #FF6D00' : '1px solid #444';
    item.style.background = idx === state.selectedCandidateIndex ? '#222' : '#111';
    item.style.borderRadius = '6px';
    item.style.cursor = 'pointer';
    item.style.color = '#FFF';
    item.style.fontSize = '12px';
    item.style.fontWeight = 'bold';
    item.innerHTML = `
      <div style="display: flex; justify-content: space-between; align-items: center;">
        <span>${cand.name}</span>
        <span>${idx === state.selectedCandidateIndex ? '✅' : '⚪'}</span>
      </div>
    `;
    item.onclick = () => {
      state.selectedCandidateIndex = idx;
      renderCandidateRoutesList();
    };
    list.appendChild(item);
  });
}

function generateRoadbookForCandidate(candidateIndex) {
  const cand = state.candidateRoutes[candidateIndex] || state.candidateRoutes[0];
  if (!cand) return;

  const route = cand.rawRoute;
  const coords = route.geometry.coordinates.map(c => [c[1], c[0]]);

  const notes = [];
  let runningDistKM = 0.0;
  let noteId = 1;

  notes.push({
    id: noteId++,
    totalKM: 0.00,
    partialKM: 0.00,
    cap: Math.round(calculateBearing(coords[0][0], coords[0][1], coords[1][0], coords[1][1])),
    turnType: "straight",
    isOffTrack: false,
    wptType: "START",
    wptName: "DSS 01",
    danger: 0,
    speedLimit: 100,
    lexicon: ["START", "DZ", "PP"],
    text: "DEPART SS - FOLLOW TRACES",
    lat: coords[0][0],
    lon: coords[0][1],
    alt: 350,
    isBiffed: false
  });

  if (route.legs && route.legs[0] && route.legs[0].steps) {
    route.legs[0].steps.forEach((step, idx) => {
      if (step.distance < 40) return;
      const stepKM = step.distance / 1000;
      runningDistKM += stepKM;

      const stepLoc = [step.maneuver.location[1], step.maneuver.location[0]];
      const cap = Math.round(calculateBearing(coords[Math.min(idx * 2, coords.length - 2)][0], coords[Math.min(idx * 2, coords.length - 2)][1], stepLoc[0], stepLoc[1]));

      let turnType = "straight";
      if (step.maneuver.modifier) {
        const mod = step.maneuver.modifier;
        if (mod.includes("right")) turnType = mod.includes("slight") ? "slightRight" : "right";
        else if (mod.includes("left")) turnType = mod.includes("slight") ? "slightLeft" : "left";
      }

      const danger = (turnType === "right" || turnType === "left") ? 1 : 0;
      let wptType = (noteId % 4 === 0) ? "WPC" : (noteId % 3 === 0) ? "WPS" : "WPM";
      let speedLim = null;
      let lexList = ["PP"];

      if (step.name && (step.name.toLowerCase().includes("village") || step.name.toLowerCase().includes("avenue"))) {
        wptType = "DZ";
        speedLim = 100;
        lexList.push("DZ", "VIL");
      }

      if (danger > 0) lexList.push("!");

      notes.push({
        id: noteId++,
        totalKM: parseFloat(runningDistKM.toFixed(2)),
        partialKM: parseFloat(stepKM.toFixed(2)),
        cap: cap,
        turnType: turnType,
        isOffTrack: false,
        wptType: wptType,
        wptName: `WPT ${noteId - 1}`,
        danger: danger,
        speedLimit: speedLim,
        lexicon: lexList,
        text: (step.name || "FOLLOW MAIN TRACK").toUpperCase(),
        lat: stepLoc[0],
        lon: stepLoc[1],
        alt: 350 + noteId * 6,
        isBiffed: false
      });
    });
  }

  const lastCoord = coords[coords.length - 1];
  notes.push({
    id: noteId,
    totalKM: parseFloat((route.distance / 1000).toFixed(2)),
    partialKM: parseFloat(((route.distance / 1000) - runningDistKM).toFixed(2)),
    cap: 0,
    turnType: "straight",
    isOffTrack: false,
    wptType: "FINISH",
    wptName: "ASS FINISH",
    danger: 0,
    speedLimit: 30,
    lexicon: ["FINISH", "FZ"],
    text: "ARRIVEE SPECIALE (ASS)",
    lat: lastCoord[0],
    lon: lastCoord[1],
    alt: 420,
    isBiffed: false
  });

  const customStage = {
    title: `${cand.fromLabel.toUpperCase()} ➔ ${cand.toLabel.toUpperCase()}`,
    totalDistanceKM: parseFloat((route.distance / 1000).toFixed(1)),
    waypointCount: notes.length,
    controlPointCount: notes.filter(n => n.wptType === 'WPC' || n.wptType === 'CP').length,
    coordinates: coords,
    notes: notes
  };

  loadStage(customStage);
  document.getElementById('routeModal').style.display = 'none';
}
