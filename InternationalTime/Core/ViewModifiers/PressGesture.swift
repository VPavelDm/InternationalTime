//
//  PressGesture.swift
//  InternationalTime
//
//  Created by Pavel Vaitsikhouski on 31.01.22.
//

import Foundation
import SwiftUI

struct PressGestureViewModifier: ViewModifier {
    @State private var isPressed = false
    var onPress: () -> Void
    var onRelease: () -> Void
    
    func body(content: Content) -> some View {
        content
            .simultaneousGesture(
                DragGesture(minimumDistance: 0)
                    .onChanged({ _ in
                        if !isPressed {
                            onPress()
                            isPressed = true
                        }
                    })
                    .onEnded({ _ in
                        if isPressed {
                            onRelease()
                            isPressed = false
                        }
                    })
            )
    }
}

extension View {
    func onPressGesture(onPress: @escaping (() -> Void), onRelease: @escaping (() -> Void)) -> some View {
        modifier(PressGestureViewModifier(onPress: {
            onPress()
        }, onRelease: {
            onRelease()
        }))
    }

}
