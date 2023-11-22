//
//  VibrateAccess.swift
//  MetalDetector
//
//  Created by Kirill Sedliarov on 15.11.22.
//

import Foundation

class VibrateSound {
    static let shared = VibrateSound()
    
    var isVabrateAccess: Bool {
        get {
            UserDefaults.standard.bool(forKey: #function)
        } set {
            UserDefaults.standard.setValue(newValue, forKey: #function )
        }
    }
}
