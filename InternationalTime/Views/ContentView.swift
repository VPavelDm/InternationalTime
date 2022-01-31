//
//  ContentView.swift
//  InternationalTime
//
//  Created by Pavel Vaitsikhouski on 30.01.22.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var speechRecognizer = SpeechRecognizer()
    
    var body: some View {
        content
            .onAppear {
                speechRecognizer.reset()
                speechRecognizer.transcribe()
            }
            .onDisappear {
                speechRecognizer.stopTranscribing()
            }
    }
    @ViewBuilder
    var content: some View {
        if speechRecognizer.transcript.isEmpty {
            Text("Скажи что-нибудь")
        } else {
            Text(speechRecognizer.transcript)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
