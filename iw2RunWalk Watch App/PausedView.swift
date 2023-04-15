//
//  PausedView.swift
//  iw2RunWalk Watch App
//
//  Created by Don McKenzie on 15-04-2023.
//

import SwiftUI

struct PausedView: View {
    var body: some View {
        VStack {
            Text("Paused")
                .font(.title)
            .foregroundColor(.purple)
            
            StartButton()
        }
    }
}

struct PausedView_Previews: PreviewProvider {
    static var previews: some View {
        PausedView()
    }
}
