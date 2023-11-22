//
//  LevelLogic.swift
//  BuilderHelper
//
//  Created by Kirill Sedliarov on 6.11.22.
//

import Foundation
import UIKit
import CoreMotion
import AudioToolbox
import AVFAudio
import AVFoundation


extension LevelViewController {
    
    @objc func setting() {
        let vc = SettingViewController()
        present(vc, animated: true)
    }
    
    func addSubLayer() {
        shapeY.frame = CGRect(x: UIScreen.main.bounds.width/2 - UIScreen.main.bounds.width/12, y: UIScreen.main.bounds.height/2 - UIScreen.main.bounds.width/12, width: UIScreen.main.bounds.width/6, height: UIScreen.main.bounds.width/12)
        shapeY.path = halfY.cgPath
        shapeY.lineCap = .round
        shapeY.strokeEnd = 1
        shapeY.fillColor = UIColor.white.cgColor
        view.layer.addSublayer(shapeY)
    }
    
    func startAccelerometers() {
        motion.accelerometerUpdateInterval = 1.0 / 10// 10 Hz
        motion.startAccelerometerUpdates(to: OperationQueue.current!) { [self] (data, error) in
            
            if let dataValue = data {
                self.view.reloadInputViews()
                let x = dataValue.acceleration.x
                let y = dataValue.acceleration.y
                var angle = -atan2(y, x);
                angle -= 1.57
                var promY = (Double(y * 100).rounded(.toNearestOrEven) / 100)
                var promX = (Double(x * 100).rounded(.toNearestOrEven) / 100)
                var degreesX = (Double(promX / 0.011 * 10).rounded(.toNearestOrEven) / 10)
                var degreesY = (Double(promY / 0.011 * 10).rounded(.toNearestOrEven) / 10)
                
                shapeY.transform = CATransform3DMakeRotation(angle, 0, 0, 1)
                if (degreesX == abs(0.0)) || (degreesX == 0.9) || (degreesX == -0.9) {
                    promX = 0
                    degreesX = 0
                }
                if (degreesY == abs(0.0)) || (degreesY == 0.9) || (degreesY == -0.9){
                    promY = 0
                    degreesY = 0
                }
                if (degreesX == -90.9) || (degreesX == -91.8) {
                    promX = 1
                    degreesX = -90
                }
                if (degreesX == 90.9) || (degreesX == 91.8) {
                    promX = 1
                    degreesX = 90
                }
                if (degreesY == -90.9) || (degreesY == -91.8) {
                    promY = 1
                    degreesY = -90
                }
                if (degreesY == 90.9) || (degreesY == 91.8) {
                    promY = 1
                    degreesY = 90
                }
                if promY == abs(0.0) {
                    self.sample.backgroundColor = UIColor(named: "green")
                }
                else {
                    self.sample.backgroundColor = UIColor(named: "orange")
                }
                
                if UIDevice.current.orientation == UIDeviceOrientation.landscapeRight {
                    xL.text = "\(degreesY)°"
                    if degreesY == 0.0{
                        if self.presentedViewController == nil {
                            UIDevice.vibrate()
                        }
                    }
                }
                
                if UIDevice.current.orientation == UIDeviceOrientation.portraitUpsideDown {
                    xL.text = "\(degreesX)°"
                    if degreesX == 0.0{
                        if self.presentedViewController == nil {
                            UIDevice.vibrate()
                        }
                        self.sample.backgroundColor = UIColor(named: "green")
                    } else {
                        self.sample.backgroundColor = UIColor(named: "orange")
                    }
                }
                
                if UIDevice.current.orientation == UIDeviceOrientation.landscapeLeft {
                    xL.text = "\(degreesY)°"
                    if degreesY == 0.0{
                        if self.presentedViewController == nil {
                            UIDevice.vibrate()
                        }
                    }
                }
                
                if UIDevice.current.orientation == UIDeviceOrientation.portrait {
                    xL.text = "\(degreesX)°"
                    if degreesX == 0.0{
                        if self.presentedViewController == nil {
                            UIDevice.vibrate()
                        }
                        self.sample.backgroundColor = UIColor(named: "green")
                    } else {
                        self.sample.backgroundColor = UIColor(named: "orange")
                    }
                }
                
                if UIDevice.current.orientation == UIDeviceOrientation.faceUp {
                    let deg = abs(degreesX)-abs(degreesY)
                    if deg <= 1 && deg >= -1 {
                        if degreesX <= 1 && degreesX >= -1 {
                            xL.text = "\(Double(deg * 10).rounded(.toNearestOrEven) / 10)°"
                            if self.presentedViewController == nil {
                                UIDevice.vibrate()
                            }
                            self.shapeY.fillColor = UIColor(named: "green")?.cgColor
                        } else {
                            self.shapeY.fillColor = UIColor.white.cgColor
                        }
                    } else {
                        self.shapeY.fillColor = UIColor.white.cgColor
                        if abs(degreesX) > abs(degreesY) {
                            xL.text = "\(degreesX)°"
                        } else {
                            xL.text = "\(degreesY)°"
                        }
                    }
                }
                
                UIView.animate(withDuration: 1.0 / 10) { () -> Void in
                    self.xL.layer.transform = CATransform3DMakeRotation(angle, 0, 0, 1)
                }
                
            }
        }
        
    }
    
}
