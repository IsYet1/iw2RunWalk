//
//  iw2RunWalkApp.swift
//  iw2RunWalk Watch App
//
//  Created by Don McKenzie on 12-03-2023.
//

import SwiftUI

@main
struct iw2RunWalk_Watch_AppApp: App {
    @StateObject private var appState = AppState()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(appState)
        }
    }
}
