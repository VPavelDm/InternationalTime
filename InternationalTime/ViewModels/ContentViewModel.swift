//
//  ContentViewModel.swift
//  InternationalTime
//
//  Created by Pavel Vaitsikhouski on 31.01.22.
//

import Foundation

@MainActor
class ContentViewModel: ObservableObject {
    
    func startSharing() {
        Task {
            do {
                _ = try await SpeakTogether().activate()
            } catch {
                print("Failed to activate DrawTogether activity: \(error)")
            }
        }
    }
}
