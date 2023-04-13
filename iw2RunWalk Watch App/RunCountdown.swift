//
//  RunCountdown.swift
//  iw2RunWalk Watch App
//
//  Created by Don McKenzie on 12-03-2023.
//

import SwiftUI

struct RunCountdown: View {
    @EnvironmentObject var appState: AppState
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack {
            Text("Run")
                .font(.title)
                .foregroundColor(.green)
            Text(String(appState.runSecondsRemaining))
                .bold()
                .font(.system(size: 50))
                .onReceive(timer) {time in
                    if appState.runSecondsRemaining > 0 {
                        appState.runSecondsRemaining -= 1
                    } else {
                        appState.runSecondsRemaining = 0
                        appState.startWalkSegment()
                    }
                }
            
            StopButton()
        }
    }
}

struct RunCountdown_Previews: PreviewProvider {
    static var previews: some View {
        RunCountdown().environmentObject(AppState())
    }
}
