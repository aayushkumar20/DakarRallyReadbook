export interface LexiconItem {
  code: string;
  en: string;
  fr: string;
  cat: string;
  localName?: string;
}

export class FIALexicon {
  public static readonly items: LexiconItem[] = [
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
    { code: "CLOCK", en: "Clock", fr: "Horloge", cat: "areas" },
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

  public static getItem(code: string): LexiconItem | undefined {
    return FIALexicon.items.find(i => i.code.toUpperCase() === code.toUpperCase());
  }
}
