//
//  ContentView.swift
//  iw2RunWalk Watch App
//
//  Created by Don McKenzie on 12-03-2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            RunWalkController().tabItem {
                Label("Run", systemImage: "airplane.departure")
            }
            .tag(1)
            StartScreen().tabItem {
                Label("Settings", systemImage: "gear")
            }
            .tag(2)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(AppState())
    }
}
