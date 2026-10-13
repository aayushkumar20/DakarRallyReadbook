import SwiftUI
public struct LexiconReferenceSheet: View {
    @Environment(\.dismiss) var dismiss
    @State private var selectedCategory: LexiconCategory = .tracks
    @State private var searchText: String = ""
    public var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 6) {
                        ForEach(LexiconCategory.allCases, id: \.self) { cat in
                            Button(action: { selectedCategory = cat }) {
                                Text(cat.rawValue)
                                    .font(.system(size: 11, weight: .black))
                                    .foregroundColor(selectedCategory == cat ? .black : .white)
                                    .padding(.horizontal, 10)
                                    .padding(.vertical, 6)
                                    .background(selectedCategory == cat ? Color(red: 1.0, green: 0.92, blue: 0.15) : Color(red: 0.2, green: 0.2, blue: 0.22))
                                    .cornerRadius(6)
                            }
                        }
                    }
                    .padding(.horizontal, 10)
                    .padding(.vertical, 8)
                }
                .background(Color.black)
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                    TextField("Search symbols or acronyms (e.g. HP, DN, DZ)...", text: $searchText)
                        .font(.system(size: 13))
                }
                .padding(8)
                .background(Color(red: 0.92, green: 0.92, blue: 0.95))
                .border(Color.gray.opacity(0.3), width: 1)
                List {
                    ForEach(filteredItems) { item in
                        HStack(spacing: 12) {
                            Text(item.code)
                                .font(.system(size: 13, weight: .black, design: .monospaced))
                                .foregroundColor(.black)
                                .frame(width: 55, alignment: .leading)
                                .padding(.horizontal, 6)
                                .padding(.vertical, 3)
                                .background(Color(red: 1.0, green: 0.92, blue: 0.15))
                                .border(Color.black, width: 1)
                            VStack(alignment: .leading, spacing: 2) {
                                Text(item.englishName)
                                    .font(.system(size: 13, weight: .bold))
                                    .foregroundColor(.primary)
                                Text(item.frenchName)
                                    .font(.system(size: 11))
                                    .foregroundColor(.secondary)
                            }
                            Spacer()
                        }
                        .padding(.vertical, 2)
                    }
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("FIA Symbol Lexicon")
            .navigationBarItems(trailing: Button("Done") { dismiss() })
        }
    }
    private var filteredItems: [LexiconItem] {
        let list = FIALexicon.items.filter { item in
            if !searchText.isEmpty {
                return item.code.localizedCaseInsensitiveContains(searchText) ||
                       item.englishName.localizedCaseInsensitiveContains(searchText) ||
                       item.frenchName.localizedCaseInsensitiveContains(searchText)
            }
            return item.category == selectedCategory
        }
        return list
    }
}
