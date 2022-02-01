//
//  ContentViewModel.swift
//  InternationalTime
//
//  Created by Pavel Vaitsikhouski on 31.01.22.
//

import Foundation
import SwiftUI
import GroupActivities

@MainActor
class ContentViewModel: ObservableObject {
    
    // MARK: - Outputs
    @Published var groupSession: GroupSession<SpeakTogether>?
    @Published var message: String = ""

    // MARK: - Properties
    private var messenger: GroupSessionMessenger?
    private var tasks = Set<Task<Void, Never>>()

    // MARK: - Intents
    func startSharing() {
        Task {
            do {
                _ = try await SpeakTogether().activate()
            } catch {
                print("Failed to activate DrawTogether activity: \(error)")
            }
        }
    }
    func configureGroupSession(_ groupSession: GroupSession<SpeakTogether>) {
        self.groupSession = groupSession
        
        let messenger = GroupSessionMessenger(session: groupSession)
        self.messenger = messenger
        
        let task = Task {
            for await (message, _) in messenger.messages(of: SpeechMessage.self) {
                handle(message)
            }
        }
        tasks.insert(task)

        
        groupSession.join()
    }
    func sendMessage(_ message: String) {
        if let messenger = messenger {
            Task {
                try? await messenger.send(SpeechMessage(message: message, languageIdentifier: "ru_RU"))
            }
        }
    }
    
    // MARK: - Utils
    private func handle(_ message: SpeechMessage) {
        self.message = message.message
    }
}
