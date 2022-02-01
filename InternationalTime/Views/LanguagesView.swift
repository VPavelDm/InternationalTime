//
//  LanguagesView.swift
//  InternationalTime
//
//  Created by Pavel Vaitsikhouski on 1.02.22.
//

import SwiftUI

struct LanguagesView: View {
    @Binding var language: Language
    
    var body: some View {
        content
            .padding()
            .background(Color.white)
            .cornerRadius(24)
            .padding(.horizontal, 64)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.black.opacity(0.5))
    }
    var content: some View {
        VStack(alignment: .leading, spacing: 16) {
            ForEach(Language.languages) { language in
                languageCell(language,
                             isLast: Language.languages.firstIndex(of: language) == Language.languages.count - 1)
            }
        }
    }
    @ViewBuilder
    func languageCell(_ language: Language, isLast: Bool) -> some View {
        Button {
            self.language = language
        } label: {
            HStack {
                Text(language.icon)
                Text(language.text)
            }
        }
        if !isLast {
            Divider()
        }
    }
}

struct LanguagesView_Previews: PreviewProvider {
    static var previews: some View {
        LanguagesView(language: .constant(Language.languages[0]))
    }
}
