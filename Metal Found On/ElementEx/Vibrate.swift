//
//  Vibrate.swift
//  MetalDetector
//
//  Created by Kirill Sedliarov on 15.11.22.
//

import Foundation
import UIKit
import AudioToolbox
import AVFoundation

public extension UIDevice {
    
    static func vibrate() {
        if VibrateSound.shared.isVabrateAccess {
            AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
        } else {
            print("no access to vibrate")
        }
    }
}
