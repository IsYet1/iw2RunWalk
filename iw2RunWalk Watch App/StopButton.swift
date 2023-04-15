//
//  StopButton.swift
//  iw2RunWalk Watch App
//
//  Created by Don McKenzie on 12-03-2023.
//

import SwiftUI

struct StopButton: View {
    @EnvironmentObject var appState: AppState
    var body: some View {
        VStack {
            Button ( action: {
                appState.stopSegments()
            }, label: {
                Image(systemName: "figure.stand")
                Text("Stop")
            }
            )
        }
    }
}

struct StopButton_Previews: PreviewProvider {
    static var previews: some View {
        StopButton().environmentObject(AppState())
    }
}
