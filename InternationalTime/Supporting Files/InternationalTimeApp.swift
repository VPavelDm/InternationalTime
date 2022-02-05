//
//  InternationalTimeApp.swift
//  InternationalTime
//
//  Created by Pavel Vaitsikhouski on 30.01.22.
//

import SwiftUI

@main
struct InternationalTimeApp: App {
    var body: some Scene {
        WindowGroup {
            OfflineView()
                .environmentObject(UserSettings())
        }
    }
}
