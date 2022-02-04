//
//  YandexTranslateManager.swift
//  InternationalTime
//
//  Created by Pavel Vaitsikhouski on 1.02.22.
//

import Foundation

class YandexTranslateManager {
    private let domain = "https://translate.yandex.net/api/v1.5/tr.json/translate"
    private let key = "trnsl.1.1.20180612T074102Z.764e033bcf9c41d5.31f4cc9bada282d09a89fb14561d84e3ff50c5e5"
    
    func translate(_ text: String, from sourceLang: String, to destLang: String) async throws -> String? {
        return text
//        let lang = "\(sourceLang.split(separator: "_")[0])-\(destLang.split(separator: "_")[0])"
//        guard let url = URL(string: "\(domain)?key=\(key)&text=\(text)&lang=\(lang)&format=plain") else {
//            return nil
//        }
//        let (data, _) = try await URLSession.shared.data(from: url)
//        let decoder = JSONDecoder()
//        let response = try decoder.decode(YandexTranslateResponse.self, from: data)
//        return response.text.first
    }
}
