//
//  SetTimes.swift
//  iw2RunWalk Watch App
//
//  Created by Don McKenzie on 13-04-2023.
//

import SwiftUI

struct SetTimes: View {
    @EnvironmentObject var appState: AppState
    
    @State private var runTime = AppState().secondsString(runOrWalk: .running)
    @State private var walkTime = AppState().secondsString(runOrWalk: .walking)
    
    var body: some View {
        VStack {
            HStack() {
                Text("Run")
                TextField("Run Seconds", text: $runTime)
            }
            HStack() {
                Text("Walk")
                TextField("Walk Seconds", text: $walkTime)
            }
            Button("Save", action: {
                appState.setTimes(runSecondsStr: runTime, walkSecondsStr: walkTime)
                appState.curStatus = .stopped
            })
        }
    }
}

struct SetTimes_Previews: PreviewProvider {
    static var previews: some View {
        SetTimes().environmentObject(AppState())
    }
}
