import Foundation
import SwiftUI
public struct LexiconItem: Identifiable, Hashable {
    public var id: String { code }
    public var code: String
    public var frenchName: String
    public var englishName: String
    public var category: LexiconCategory
    public var iconSymbolName: String?
    public init(code: String, frenchName: String, englishName: String, category: LexiconCategory, iconSymbolName: String? = nil) {
        self.code = code
        self.frenchName = frenchName
        self.englishName = englishName
        self.category = category
        self.iconSymbolName = iconSymbolName
    }
}
public enum LexiconCategory: String, CaseIterable {
    case tracks = "Tracks"
    case elements = "Elements"
    case areas = "Areas"
    case safety = "Safety"
    case waypoints = "Waypoints"
    case directions = "Directions"
    case electric = "Electric"
    case specificities = "Specificities"
}
public enum FIALexicon {
    public static let items: [LexiconItem] = [
        LexiconItem(code: "2X", frenchName: "2 voies", englishName: "Dual carriageway", category: .tracks),
        LexiconItem(code: "RD", frenchName: "Route", englishName: "Road", category: .tracks),
        LexiconItem(code: "P", frenchName: "Piste", englishName: "Track", category: .tracks),
        LexiconItem(code: "HP", frenchName: "Hors-piste", englishName: "Off track", category: .tracks),
        LexiconItem(code: "G^D", frenchName: "Grande piste", englishName: "Big track", category: .tracks),
        LexiconItem(code: "PP", frenchName: "Piste principale", englishName: "Main track", category: .tracks),
        LexiconItem(code: "PS", frenchName: "Piste sinueuse", englishName: "Winding track", category: .tracks),
        LexiconItem(code: "PPS", frenchName: "Piste principale sinueuse", englishName: "Winding main track", category: .tracks),
        LexiconItem(code: "UB", frenchName: "Sous le pont", englishName: "Under bridge", category: .elements),
        LexiconItem(code: "OB", frenchName: "Sur le pont", englishName: "Over bridge", category: .elements),
        LexiconItem(code: "CL", frenchName: "Clôture", englishName: "Fence", category: .elements),
        LexiconItem(code: "BAR", frenchName: "Barrière", englishName: "Gate barrier", category: .elements),
        LexiconItem(code: "NCB", frenchName: "Passage bétail interdit", englishName: "No cattle passage", category: .elements),
        LexiconItem(code: "AF", frenchName: "Clôture bétail", englishName: "Animal fence", category: .elements),
        LexiconItem(code: "BIDON", frenchName: "Fût", englishName: "Barrel", category: .elements),
        LexiconItem(code: "MAIS", frenchName: "Maison", englishName: "House", category: .elements),
        LexiconItem(code: "RUIN", frenchName: "Ruine", englishName: "Ruin", category: .elements),
        LexiconItem(code: "PNEU", frenchName: "Pneu", englishName: "Tire", category: .elements),
        LexiconItem(code: "CIT", frenchName: "Citerne", englishName: "Water tank", category: .elements),
        LexiconItem(code: "BAT", frenchName: "Bâtiments", englishName: "Buildings", category: .elements),
        LexiconItem(code: "CF", frenchName: "Voie ferrée", englishName: "Rail road", category: .elements),
        LexiconItem(code: "START", frenchName: "Départ", englishName: "Start", category: .areas),
        LexiconItem(code: "FINISH", frenchName: "Arrivée", englishName: "Finish", category: .areas),
        LexiconItem(code: "ESSENCE", frenchName: "Station essence", englishName: "Petrol station", category: .areas),
        LexiconItem(code: "CLOCK", frenchName: "Heure / Horloge", englishName: "Clock", category: .areas),
        LexiconItem(code: "VIL", frenchName: "Village", englishName: "Village", category: .areas),
        LexiconItem(code: "ZS", frenchName: "Zone sensible", englishName: "Sensitive zone", category: .areas),
        LexiconItem(code: "SL30", frenchName: "Limitation 30", englishName: "Speed limit 30", category: .safety),
        LexiconItem(code: "SL50", frenchName: "Limitation 50", englishName: "Speed limit 50", category: .safety),
        LexiconItem(code: "END_SL", frenchName: "Fin limitation", englishName: "Finish speed limit zone", category: .safety),
        LexiconItem(code: "!", frenchName: "Danger 1", englishName: "Danger 1", category: .safety),
        LexiconItem(code: "!!", frenchName: "Danger 2", englishName: "Danger 2", category: .safety),
        LexiconItem(code: "!!!", frenchName: "Danger 3", englishName: "Danger 3", category: .safety),
        LexiconItem(code: "DZ", frenchName: "Début zone vitesse", englishName: "Start speed zone", category: .safety),
        LexiconItem(code: "FZ", frenchName: "Fin zone vitesse", englishName: "Finish speed zone", category: .safety),
        LexiconItem(code: "PC", frenchName: "Poste de contrôle", englishName: "PC", category: .waypoints),
        LexiconItem(code: "WPE", frenchName: "Point éclipse", englishName: "Waypoint eclipse", category: .waypoints),
        LexiconItem(code: "WPS", frenchName: "Point sécurité", englishName: "Waypoint safety", category: .waypoints),
        LexiconItem(code: "WPM", frenchName: "Point masqué", englishName: "Waypoint masked", category: .waypoints),
        LexiconItem(code: "WPC", frenchName: "Point contrôle", englishName: "Waypoint control", category: .waypoints),
        LexiconItem(code: "DST", frenchName: "Distance", englishName: "Distance", category: .waypoints),
        LexiconItem(code: "STOP", frenchName: "Arrêt", englishName: "Stop", category: .waypoints),
        LexiconItem(code: "PAN", frenchName: "Panneaux", englishName: "Panels", category: .directions),
        LexiconItem(code: "MONTEE", frenchName: "Montée", englishName: "Uphill", category: .directions),
        LexiconItem(code: "DESCENTE", frenchName: "Descente", englishName: "Downhill", category: .directions),
        LexiconItem(code: "VERS", frenchName: "Vers", englishName: "Towards", category: .directions),
        LexiconItem(code: "DS", frenchName: "Dans", englishName: "In", category: .directions),
        LexiconItem(code: "IMP", frenchName: "Impératif", englishName: "Imperative", category: .directions),
        LexiconItem(code: "QT", frenchName: "Quitter", englishName: "Leave", category: .directions),
        LexiconItem(code: "RP", frenchName: "Reprendre", englishName: "To take", category: .directions),
        LexiconItem(code: "TDSPP", frenchName: "Tout droit sur piste principale", englishName: "Keep straight on main track", category: .directions),
        LexiconItem(code: "+/-V", frenchName: "Plus ou moins visible", englishName: "More or less visible", category: .directions),
        LexiconItem(code: "ANT", frenchName: "Antenne", englishName: "Antenna", category: .electric),
        LexiconItem(code: "LEL", frenchName: "Ligne électrique", englishName: "Electric line", category: .electric),
        LexiconItem(code: "POT", frenchName: "Poteau", englishName: "Post", category: .electric),
        LexiconItem(code: "PEL", frenchName: "Pylône électrique", englishName: "Electric pole", category: .electric),
        LexiconItem(code: "HT", frenchName: "Haute tension", englishName: "High voltage line", category: .electric),
        LexiconItem(code: "EOL", frenchName: "Éolienne", englishName: "Windmill", category: .electric),
        LexiconItem(code: "MONT", frenchName: "Montagne", englishName: "Mountain", category: .specificities),
        LexiconItem(code: "ROCH", frenchName: "Rocher", englishName: "Rock", category: .specificities),
        LexiconItem(code: "SA", frenchName: "Sable", englishName: "Sand", category: .specificities),
        LexiconItem(code: "CAIL", frenchName: "Cailloux", englishName: "Stones", category: .specificities),
        LexiconItem(code: "DN", frenchName: "Dunes", englishName: "Dunes", category: .specificities),
        LexiconItem(code: "DN L1", frenchName: "Dunes niveau 1", englishName: "Dunes Level 1", category: .specificities),
        LexiconItem(code: "DN L2", frenchName: "Dunes niveau 2", englishName: "Dunes Level 2", category: .specificities),
        LexiconItem(code: "DNT", frenchName: "Petite dune", englishName: "Small dune", category: .specificities),
        LexiconItem(code: "RIV", frenchName: "Rivière", englishName: "River", category: .specificities),
        LexiconItem(code: "BUIS", frenchName: "Buissons", englishName: "Bushes", category: .specificities),
        LexiconItem(code: "ARBR", frenchName: "Arbre", englishName: "Tree", category: .specificities),
        LexiconItem(code: "PALM", frenchName: "Palmier", englishName: "Palm", category: .specificities),
        LexiconItem(code: "HERB", frenchName: "Hautes herbes", englishName: "Tall grass", category: .specificities),
        LexiconItem(code: "COMP", frenchName: "Compression", englishName: "Compression", category: .specificities),
        LexiconItem(code: "DIP", frenchName: "Trou / Cuvette", englishName: "Dip", category: .specificities),
        LexiconItem(code: "FOSS", frenchName: "Fossé", englishName: "Ditch", category: .specificities),
        LexiconItem(code: "LAC", frenchName: "Lac", englishName: "Lake", category: .specificities),
        LexiconItem(code: "LAC_SEC", frenchName: "Lac asséché", englishName: "Dry lake", category: .specificities),
        LexiconItem(code: "BOSS", frenchName: "Bosse", englishName: "Bump", category: .specificities),
        LexiconItem(code: "S_DROIT", frenchName: "Crête droite", englishName: "Right over brow", category: .specificities),
        LexiconItem(code: "S_GAUCH", frenchName: "Crête gauche", englishName: "Left over brow", category: .specificities),
        LexiconItem(code: "MARCH_B", frenchName: "Marche descente", englishName: "Step down", category: .specificities),
        LexiconItem(code: "MARCH", frenchName: "Marche", englishName: "Step", category: .specificities),
        LexiconItem(code: "MARCH_H", frenchName: "Marche montée", englishName: "Step up", category: .specificities),
        LexiconItem(code: "DN_CAS", frenchName: "Dune cassée", englishName: "Broken dune", category: .specificities),
        LexiconItem(code: "ORNI", frenchName: "Ornières", englishName: "Ruts", category: .specificities),
        LexiconItem(code: "GUE", frenchName: "Gué / Mer", englishName: "Ford/Sea", category: .specificities),
        LexiconItem(code: "OND", frenchName: "Ondulation", englishName: "Undulation", category: .specificities),
        LexiconItem(code: "LANG_S", frenchName: "Langue de sable", englishName: "Sand spit", category: .specificities),
        LexiconItem(code: "DEVERS", frenchName: "Dévers", englishName: "Camber", category: .specificities),
        LexiconItem(code: "VG", frenchName: "Végétation", englishName: "Vegetation", category: .specificities),
        LexiconItem(code: "E3", frenchName: "Étroit", englishName: "Narrow", category: .specificities),
        LexiconItem(code: "MVS", frenchName: "Mauvais", englishName: "Bad", category: .specificities),
        LexiconItem(code: "NBX", frenchName: "Nombreux", englishName: "Many", category: .specificities),
        LexiconItem(code: "RIO", frenchName: "Oued / Rio sec", englishName: "Dry rio/river", category: .specificities),
        LexiconItem(code: "SER", frenchName: "Serré", englishName: "Tight", category: .specificities),
        LexiconItem(code: "S", frenchName: "Sinueux", englishName: "Twisty", category: .specificities)
    ]
    public static func item(for code: String) -> LexiconItem? {
        items.first { $0.code.lowercased() == code.lowercased() }
    }
}
