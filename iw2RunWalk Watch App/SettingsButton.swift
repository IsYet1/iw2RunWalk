//
//  SettingsButton.swift
//  iw2RunWalk Watch App
//
//  Created by Don McKenzie on 15-04-2023.
//

import SwiftUI

struct SettingsButton: View {
    @EnvironmentObject var appState: AppState
    
    var body: some View {
        VStack {
            NavigationStack {
                NavigationLink(destination: SetTimes()) {
                    Text("Set Run-Walk Times")
                }.navigationTitle("Settings")
                Spacer()
            }
        }
    }
}

struct SettingsButton_Previews: PreviewProvider {
    static var previews: some View {
        SettingsButton()
    }
}
