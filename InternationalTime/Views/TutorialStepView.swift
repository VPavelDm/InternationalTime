//
//  TutorialStepView.swift
//  InternationalTime
//
//  Created by Pavel Vaitsikhouski on 5.02.22.
//

import SwiftUI

struct TutorialStepView: View {
    var imageName: String
    var title: String
    var description: String
    
    var body: some View {
        VStack(spacing: 16) {
            Image(imageName)
                .frame(maxHeight: .infinity)
            VStack(alignment: .leading, spacing: 16) {
                Text(title)
                    .font(.title2.bold())
                Text(description)
                Spacer()
            }
            .frame(maxHeight: .infinity)
            .padding(.horizontal)
        }
    }
}
