import SwiftUI
public struct LanguageSelectionSheet: View {
    @ObservedObject var localization = LocalizationManager.shared
    @Environment(\.dismiss) var dismiss
    public init() {}
    public var body: some View {
        NavigationView {
            List {
                Section(header: Text("SELECT YOUR LANGUAGE / CHOISIR LA LANGUE")) {
                    ForEach(AppLanguage.allCases) { lang in
                        HStack(spacing: 12) {
                            Text(lang.flag)
                                .font(.system(size: 24))
                            VStack(alignment: .leading, spacing: 2) {
                                Text(lang.displayName)
                                    .font(.system(size: 16, weight: .bold))
                                Text(lang.rawValue.uppercased())
                                    .font(.system(size: 11))
                                    .foregroundColor(.secondary)
                            }
                            Spacer()
                            if localization.currentLanguage == lang {
                                Image(systemName: "checkmark.circle.fill")
                                    .foregroundColor(.orange)
                                    .font(.system(size: 20))
                            }
                        }
                        .contentShape(Rectangle())
                        .onTapGesture {
                            localization.currentLanguage = lang
                            localization.hasSelectedLanguage = true
                            dismiss()
                        }
                    }
                }
            }
            .navigationTitle(localization.localized("select_language"))
            .navigationBarItems(trailing: Button("Done") {
                localization.hasSelectedLanguage = true
                dismiss()
            })
        }
    }
}
