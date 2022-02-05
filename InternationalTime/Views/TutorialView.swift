//
//  TutorialView.swift
//  InternationalTime
//
//  Created by Pavel Vaitsikhouski on 4.02.22.
//

import SwiftUI

struct TutorialView: View {
    @Environment(\.presentationMode) private var presentation

    var body: some View {
        NavigationView {
            content
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            presentation.wrappedValue.dismiss()
                        } label: {
                            Image(systemName: "xmark.circle")
                        }
                    }
                }
        }
    }
    var content: some View {
        TabView {
            TutorialStepView(imageName: "FaceTime",
                             title: "Start a FaceTime Call",
                             description: "Start a video or audio call using FaceTime with a friend, family member or business partner")
            TutorialStepView(imageName: "FaceTime",
                             title: "Open the App",
                             description: "While staying on the call, return to your homescreen and open the App.")
            TutorialStepView(imageName: "FaceTime",
                             title: "Enable Subtitles",
                             description: "Tap the \"Enable Subtitles\" button to invite the other people on the FaceTime call to the App.")
            TutorialStepView(imageName: "FaceTime",
                             title: "Wait for others to join",
                             description: "The other people on the call will get a popup telling them to enable SharePlay, after which they can tap on \"Open\".")
        }
        .tabViewStyle(.page)
        .indexViewStyle(.page(backgroundDisplayMode: .always))
    }
}

struct TutorialView_Previews: PreviewProvider {
    static var previews: some View {
        TutorialView()
    }
}
