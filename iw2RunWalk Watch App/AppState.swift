//
//  State.swift
//  iw2RunWalk Watch App
//
//  Created by Don McKenzie on 12-04-2023.
//

import Foundation

enum CurrentStatus: String {
    case running = "Running"
    case walking = "Walking"
    case stopped = "Stopped"
}

final class AppState: ObservableObject {
    @Published var runSeconds: Int
    @Published var walkSeconds: Int
    @Published var runSecondsRemaining: Int
    @Published var walkSecondsRemaining: Int
    @Published var curStatus: CurrentStatus
    @Published var iterations: Int
    @Published var iterationsRemaining: Int
    
    init() {
        let runSecondsStart = 5
        let walkSecondsStart = 3
        
        runSeconds = runSecondsStart
        runSecondsRemaining = runSecondsStart
        
        walkSeconds = walkSecondsStart
        walkSecondsRemaining = walkSecondsStart
        
        curStatus = .stopped
        
        iterations = 2
        iterationsRemaining = 2
    }
    
    func resetIterations() -> Void {
        iterationsRemaining = iterations
    }
    
    func resetRunSeconds() -> Void {
        runSecondsRemaining = runSeconds
    }
    
    func resetWalkSeconds() -> Void {
        walkSecondsRemaining = walkSeconds
    }
    
    func startRunSegment() -> Void {
        resetRunSeconds()
        iterationsRemaining -= 1
        curStatus = (iterationsRemaining >= 0) ? .running : .stopped
    }
    
    func startWalkSegment() -> Void {
        resetWalkSeconds()
        curStatus = .walking
    }
    
    func startSegments() -> Void {
        resetIterations()
        resetRunSeconds()
        resetWalkSeconds()
        curStatus = .running
    }
    func stopSegments() -> Void {
        curStatus = .stopped
        resetIterations()
        resetRunSeconds()
        resetWalkSeconds()
    }
}
