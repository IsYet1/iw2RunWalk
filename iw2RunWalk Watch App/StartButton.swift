//
//  StartButton.swift
//  iw2RunWalk Watch App
//
//  Created by Don McKenzie on 12-03-2023.
//

import SwiftUI

struct StartButton: View {
    @EnvironmentObject var appState: AppState
    var body: some View {
        VStack {
            Button ( action: {
                appState.startSegments()
                print("Button clicked")
            }, label: {
                Image(systemName: "figure.run")
                Text("Start Run")
            }
            )
            Text("Status: \(appState.curStatus.rawValue)")
        }
        .font(.headline)
    }
}

struct StartButton_Previews: PreviewProvider {
    static var previews: some View {
        StartButton().environmentObject(AppState())
    }
}
