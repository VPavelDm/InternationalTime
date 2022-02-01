//
//  ContentView.swift
//  InternationalTime
//
//  Created by Pavel Vaitsikhouski on 30.01.22.
//

import SwiftUI
import GroupActivities

struct ContentView: View {
    @StateObject private var speechRecognizer = SpeechRecognizer()
    @StateObject private var viewModel = ContentViewModel()
    @StateObject private var groupStateObserver = GroupStateObserver()
    @State private var isSpeaking = false
    
    var body: some View {
        NavigationView {
            content
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color(hex: "#EEEEEE"))
                .navigationTitle("International Time")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        shareActivity
                    }
                }
                .task {
                    for await session in SpeakTogether.sessions() {
                        viewModel.configureGroupSession(session)
                    }
                }
        }
    }
    @ViewBuilder
    var content: some View {
        VStack {
            Spacer()
            speechCards
            Spacer()
            speakButton
        }
    }
    func speechCard(_ text: String, name: String) -> some View {
        VStack(alignment: .leading) {
            Text(name)
                .font(.headline)
                .foregroundColor(.blue)
            Text(text)
                .font(.body)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(16)
        .shadow(radius: 4)
        .padding(.horizontal, 64)
    }
    @ViewBuilder
    var speechCards: some View {
        if !speechRecognizer.transcript.isEmpty {
            speechCard(speechRecognizer.transcript, name: "Paul")
        } else if !viewModel.message.isEmpty {
            speechCard(viewModel.message, name: "Alla")
        }
    }
    @ViewBuilder
    var speakButton: some View {
        Image(systemName: "mic")
            .font(.title)
            .foregroundColor(isSpeaking ? .red : .black)
            .padding()
            .padding(.bottom, 64)
            .onPressGesture {
                let impactHeavy = UIImpactFeedbackGenerator(style: .heavy)
                impactHeavy.impactOccurred()
                isSpeaking = true
                speechRecognizer.reset()
                speechRecognizer.transcribe()
            } onRelease: {
                isSpeaking = false
                speechRecognizer.stopTranscribing()
            }
    }
    @ViewBuilder
    var shareActivity: some View {
        if viewModel.groupSession == nil && groupStateObserver.isEligibleForGroupSession {
            Button {
                viewModel.startSharing()
            } label: {
                Image(systemName: "person.2.fill")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
