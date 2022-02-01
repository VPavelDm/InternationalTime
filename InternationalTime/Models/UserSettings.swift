//
//  UserSettings.swift
//  InternationalTime
//
//  Created by Pavel Vaitsikhouski on 1.02.22.
//

import Foundation

class UserSettings: ObservableObject {
    @Published var name: String {
        didSet {
            UserDefaults.standard.set(name, forKey: "username")
        }
    }
    @Published var language: Language {
        didSet {
            UserDefaults.standard.set(language.text, forKey: "language")
        }
    }
    
    init() {
        name = UserDefaults.standard.string(forKey: "username") ?? ""
        let language = UserDefaults.standard.string(forKey: "language")
        self.language = Language.languages.first(where: { $0.text == language }) ?? Language.languages[0]
    }
}
