//
//  RunWalkController.swift
//  iw2RunWalk Watch App
//
//  Created by Don McKenzie on 10-04-2023.
//

import SwiftUI

struct RunWalkController: View {
    @EnvironmentObject var appState: AppState
    
    var body: some View {
        switch appState.curStatus {
        case .stopped:
//            StartScreen()
            PausedView()
        case .running:
            RunCountdown()
        case .walking:
            WalkCountdown()
        case .settings:
            SetTimes()
        }
    }
}

struct RunWalkController_Previews: PreviewProvider {
    static var previews: some View {
        RunWalkController().environmentObject(AppState())
    }
}



