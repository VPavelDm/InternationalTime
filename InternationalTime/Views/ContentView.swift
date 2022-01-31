//
//  ContentView.swift
//  InternationalTime
//
//  Created by Pavel Vaitsikhouski on 30.01.22.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var speechRecognizer = SpeechRecognizer()
    @State private var isSpeaking = false
    
    var body: some View {
        content
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(hex: "#f3f3f4"))
    }
    @ViewBuilder
    var content: some View {
        VStack {
            Spacer()
            speechCard
            Spacer()
            speakButton
        }
    }
    @ViewBuilder
    var speechCard: some View {
        if !speechRecognizer.transcript.isEmpty {
            VStack(alignment: .leading) {
                Text("Paul")
                    .font(.headline)
                    .foregroundColor(.blue)
                Text(speechRecognizer.transcript)
                    .font(.body)
            }
            .padding()
            .background(Color.white)
            .cornerRadius(16)
            .shadow(radius: 4)
            .padding(.horizontal, 64)
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
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
