import SwiftUI
import MapKit
import Combine

public struct LocationSuggestionItem: Identifiable, Hashable {
    public let id = UUID()
    public let title: String
    public let subtitle: String
    public let completion: MKLocalSearchCompletion
    
    public static func == (lhs: LocationSuggestionItem, rhs: LocationSuggestionItem) -> Bool {
        lhs.id == rhs.id
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

public final class LocationSearchCompleter: NSObject, ObservableObject, MKLocalSearchCompleterDelegate {
    @Published public var query: String = ""
    @Published public var suggestions: [LocationSuggestionItem] = []
    @Published public var isSearching: Bool = false
    
    private let completer = MKLocalSearchCompleter()
    private var cancellables = Set<AnyCancellable>()
    
    public override init() {
        super.init()
        completer.delegate = self
        completer.resultTypes = [.address, .pointOfInterest, .query]
        
        $query
            .debounce(for: .milliseconds(150), scheduler: RunLoop.main)
            .removeDuplicates()
            .sink { [weak self] newQuery in
                guard let self = self else { return }
                let trimmed = newQuery.trimmingCharacters(in: .whitespacesAndNewlines)
                if trimmed.isEmpty {
                    self.suggestions = []
                    self.isSearching = false
                } else {
                    self.isSearching = true
                    self.completer.queryFragment = trimmed
                }
            }
            .store(in: &cancellables)
    }
    
    public func completerDidUpdateResults(_ completer: MKLocalSearchCompleter) {
        let results = completer.results.map {
            LocationSuggestionItem(title: $0.title, subtitle: $0.subtitle, completion: $0)
        }
        DispatchQueue.main.async {
            self.suggestions = results
            self.isSearching = false
        }
    }
    
    public func completer(_ completer: MKLocalSearchCompleter, didFailWithError error: Error) {
        DispatchQueue.main.async {
            self.isSearching = false
        }
    }
    
    public func clearSuggestions() {
        self.suggestions = []
    }
    
    public func resolveCoordinate(for item: LocationSuggestionItem) async throws -> CLLocationCoordinate2D {
        let request = MKLocalSearch.Request(completion: item.completion)
        let search = MKLocalSearch(request: request)
        let response = try await search.start()
        guard let first = response.mapItems.first else {
            throw NSError(domain: "Completer", code: 404, userInfo: [NSLocalizedDescriptionKey: "Coordinate not found for \(item.title)"])
        }
        return first.placemark.coordinate
    }
}
