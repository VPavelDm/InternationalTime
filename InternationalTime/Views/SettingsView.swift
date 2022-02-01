//
//  SettingsView.swift
//  InternationalTime
//
//  Created by Pavel Vaitsikhouski on 1.02.22.
//

import SwiftUI

struct SettingsView: View {
    @State private var name: String = ""
    @Binding var language: Language
    
    var body: some View {
        Form {
            nameSection
            languageSection
        }
    }
    
    var nameSection: some View {
        Section {
            HStack {
                Image(systemName: "person.fill")
                Text("Ваше имя")
                TextField(text: $name, prompt: Text("Введите имя")) {
                    Text("")
                }
                .multilineTextAlignment(.trailing)
            }
        } footer: {
            Text("Имя, которое отображается другим пользователям")
        }
    }
    var languageSection: some View {
        Section {
            HStack {
                Image(systemName: "mic.fill")
                Text("Язык")
                Spacer()
                Button {
                    
                } label: {
                    Text(language.text)
                }
            }
        } footer: {
            Text("Убедитесь, что вы выбрали язык, на котором вы разговариваете")
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(language: .constant(Language.languages.first!))
    }
}
