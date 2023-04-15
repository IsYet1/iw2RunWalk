//
//  State.swift
//  iw2RunWalk Watch App
//
//  Created by Don McKenzie on 12-04-2023.
//

// TODO: Convert the UserDefaults seconds storage to integer from string.

import Foundation

enum CurrentStatus: String {
    case running = "Running"
    case walking = "Walking"
    case stopped = "Stopped"
    case settings = "Settings"
}

final class AppState: ObservableObject {
    @Published var runSeconds: Int
    @Published var walkSeconds: Int
    @Published var runSecondsRemaining: Int
    @Published var walkSecondsRemaining: Int
    @Published var curStatus: CurrentStatus
    
    init() {
        var runSecondsStart = 5
        var walkSecondsStart = 3
        
        if let storedRunSeconds = (UserDefaults.standard.string(forKey: "storedRunSeconds")) {
            runSecondsStart = Int(storedRunSeconds)!
        }
        if let storedWalkSeconds = (UserDefaults.standard.string(forKey: "storedWalkSeconds")) {
            walkSecondsStart = Int(storedWalkSeconds)!
        }
        
        runSeconds = runSecondsStart
        runSecondsRemaining = runSecondsStart
    
        walkSeconds = walkSecondsStart
        walkSecondsRemaining = walkSecondsStart
        
        curStatus = .stopped
    }
    
    func resetRunSeconds() -> Void {
        runSecondsRemaining = runSeconds
    }
    
    func resetWalkSeconds() -> Void {
        walkSecondsRemaining = walkSeconds
    }
    
    func startRunSegment() -> Void {
        resetRunSeconds()
        curStatus = .running
    }
    
    func startWalkSegment() -> Void {
        resetWalkSeconds()
        curStatus = .walking
    }
    
    func startSegments() -> Void {
        resetRunSeconds()
        resetWalkSeconds()
        curStatus = .running
    }
    func stopSegments() -> Void {
        curStatus = .stopped
        resetRunSeconds()
        resetWalkSeconds()
    }
    
    func secondsString(runOrWalk: CurrentStatus) -> String {
        return String(runOrWalk == .running ? runSeconds : walkSeconds)
    }
    
    func setTimes(runSecondsStr: String, walkSecondsStr: String) -> Void {
        runSeconds = Int(runSecondsStr)!
        walkSeconds = Int(walkSecondsStr)!
        resetRunSeconds()
        resetWalkSeconds()
        
        UserDefaults.standard.set(String(runSeconds), forKey: "storedRunSeconds")
        UserDefaults.standard.set(String(walkSeconds), forKey: "storedWalkSeconds")
    }
}
