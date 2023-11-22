//
//  Player.swift
//  MetalDetector
//
//  Created by Kirill Sedliarov on 15.11.22.
//

import Foundation
import UIKit
import AVFoundation

extension AVAudioPlayer {
    
    static func playStartSound(_ soundName: String, speed: Float) {
        if SoundAccess.shared.isSoundAccess {
            var player: AVAudioPlayer?
            guard let path = Bundle.main.path(forResource: soundName, ofType: "mp3") else { return }
            let url = URL(fileURLWithPath: path)
            do {
                player = try AVAudioPlayer(contentsOf: url)
                player?.enableRate = true
                player?.prepareToPlay()
                player?.rate = speed
                player?.play()
            } catch _ {
           }
        } else {
            print("no access to sound")
        }
        
    }
}
