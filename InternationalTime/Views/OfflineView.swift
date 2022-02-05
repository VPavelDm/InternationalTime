//
//  OfflineView.swift
//  InternationalTime
//
//  Created by Pavel Vaitsikhouski on 4.02.22.
//

import SwiftUI

struct OfflineView: View {
    var body: some View {
        NavigationView {
            content
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button {
                            
                        } label: {
                            Image(systemName: "gearshape")
                        }
                    }
                }
        }
    }
    var content: some View {
        VStack(spacing: 16) {
            Spacer()
            texts
            actions
        }
        .padding(.bottom, 32)
    }
    var texts: some View {
        VStack(spacing: 12) {
            Text("Начать")
                .font(.system(size: 26, weight: .bold))
            Text("Пригласите своих друзей и позвоните им с помощью FaceTime, чтобы включить субтитры")
                .font(.system(size: 18, weight: .light))
                .multilineTextAlignment(.center)
                .padding(.horizontal, 22)
        }
    }
    var actions: some View {
        VStack(spacing: 12) {
            tutorialButton
            shareButton
        }
    }
    var tutorialButton: some View {
        Button {
            
        } label: {
            Text("Как пользоваться приложением")
                .font(.system(size: 20, weight: .semibold))
                .padding(.horizontal, 16)
                .padding(.vertical, 16)
                .foregroundColor(Color.white)
                .background(Color(hex: "3C9BF4"))
                .cornerRadius(16)
        }
    }
    var shareButton: some View {
        Button {
            
        } label: {
            HStack {
                Image(systemName: "square.and.arrow.up")
                Text("Поделиться")
            }
            .foregroundColor(Color(hex: "6C6C6C"))
            .font(.system(size: 20, weight: .semibold))
            .padding(12)
            .background(Color(hex: "e4e4e4"))
            .cornerRadius(20)
        }
    }
}

struct OfflineView_Previews: PreviewProvider {
    static var previews: some View {
        OfflineView()
    }
}
