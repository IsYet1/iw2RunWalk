//
//  ContentView.swift
//  iw2RunWalk Watch App
//
//  Created by Don McKenzie on 12-03-2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            RunWalkController()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(AppState())
    }
}
