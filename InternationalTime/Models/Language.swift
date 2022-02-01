//
//  Language.swift
//  InternationalTime
//
//  Created by Pavel Vaitsikhouski on 1.02.22.
//

import Foundation

struct Language: Identifiable, Equatable {
    var id: String { identifier }
    var identifier: String
    var icon: String
    var text: String
    
    static var languages: [Language] = [
        .init(identifier: "en_US", icon: "🇺🇸", text: "English"),
        .init(identifier: "ru_RU", icon: "🇷🇺", text: "Русский"),
        .init(identifier: "fr_FR", icon: "🇫🇷", text: "Français")
    ]
}
