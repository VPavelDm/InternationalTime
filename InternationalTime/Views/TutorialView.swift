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
            faceTime
            openApp
        }
        .tabViewStyle(.page)
        .indexViewStyle(.page(backgroundDisplayMode: .always))
    }
    var faceTime: some View {
        VStack {
            Image("FaceTime")
            Text("Start a FaceTime Call")
            Text("Start a video or audio call using FaceTime with a friend, family member or business partner")
        }
    }
    var openApp: some View {
        VStack {
            Text("Open the App")
            Text("While staying on the call, return to your homescreen and open the App.")
        }
    }
}

struct TutorialView_Previews: PreviewProvider {
    static var previews: some View {
        TutorialView()
    }
}
