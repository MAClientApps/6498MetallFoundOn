//
//  SoundAccess.swift
//  MetalDetector
//
//  Created by Kirill Sedliarov on 15.11.22.
//

import Foundation

class SoundAccess {
    static let shared = SoundAccess()

    var isSoundAccess: Bool {
        get {
            UserDefaults.standard.bool(forKey: #function)
        } set {
            UserDefaults.standard.setValue(newValue, forKey: #function)
        }
    }
}
