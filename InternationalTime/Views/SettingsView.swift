//
//  SettingsView.swift
//  InternationalTime
//
//  Created by Pavel Vaitsikhouski on 1.02.22.
//

import SwiftUI

struct SettingsView: View {
    @State private var showChooseLanguages = false
    @EnvironmentObject var userSettings: UserSettings
    
    var body: some View {
        Form {
            nameSection
            languageSection
        }
        .popup(isPresented: $showChooseLanguages) {
            LanguagesView(language: $userSettings.language, isPresented: $showChooseLanguages)
        }
        .navigationTitle("Settings")
    }
    
    var nameSection: some View {
        Section {
            HStack {
                Image(systemName: "person.fill")
                Text("Ваше имя")
                TextField(text: $userSettings.name, prompt: Text("Введите имя")) {
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
                    showChooseLanguages = true
                } label: {
                    Text(userSettings.language.text)
                }
            }
        } footer: {
            Text("Убедитесь, что вы выбрали язык, на котором вы разговариваете")
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
