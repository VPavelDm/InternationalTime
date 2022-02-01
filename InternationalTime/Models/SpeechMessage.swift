//
//  SpeechMessage.swift
//  InternationalTime
//
//  Created by Pavel Vaitsikhouski on 31.01.22.
//

import Foundation

struct SpeechMessage: Codable {
    var message: String
    var languageIdentifier: String
    var name: String
}
