//
//  WalkCountdown.swift
//  iw2RunWalk Watch App
//
//  Created by Don McKenzie on 10-04-2023.
//

import SwiftUI

struct WalkCountdown: View {
    @EnvironmentObject var appState: AppState
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack {
            Text("Walk")
                .font(.title)
                .foregroundColor(.yellow)
            Text(String(appState.walkSecondsRemaining))
                .bold()
                .font(.system(size: 50))
                .onReceive(timer) {time in
                    if appState.walkSecondsRemaining > 0 {
                        appState.walkSecondsRemaining -= 1
                    } else {
                        appState.walkSecondsRemaining = 0
                        appState.startRunSegment()
                    }
                }
            
            StopButton()
        }
    }
}

struct WalkCountdown_Previews: PreviewProvider {
    static var previews: some View {
        WalkCountdown().environmentObject(AppState())
    }
}
