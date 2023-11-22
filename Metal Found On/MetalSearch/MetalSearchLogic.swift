//
//  MetalSearchLogic.swift
//  BuilderHelper
//
//  Created by Kirill Sedliarov on 6.11.22.
//

import Foundation
import CoreMotion
import CoreData
import UIKit
import GoogleMobileAds
import MessageUI
import StoreKit

extension MetalSearchViewController {
    
    func alert() {
        let vc = AlertMoveController()
        vc.modalPresentationStyle = .overCurrentContext
        self.present(vc, animated: true)
    }
    
    func rate() {
        let alert = UIAlertController(title: local.alertRate,
                                      message: "",
                                      preferredStyle: .alert)
        alert.view.tintColor = UIColor(named: "orange")
        alert.overrideUserInterfaceStyle = UIUserInterfaceStyle.dark
        let cancelAlertButton = UIAlertAction(title: local.alertNo, style: .default) {
            [self] UIAlertAction in
            support()
        }
        let saveAlertButton = UIAlertAction(title: local.alertYes, style: .default) { _ in
            SKStoreReviewController.requestReview()
        }
        alert.addAction(cancelAlertButton)
        alert.addAction(saveAlertButton)
        present(alert, animated: true)
    }
    
    func support() {
        if MFMailComposeViewController.canSendMail() {
            let mail = MFMailComposeViewController()
            mail.mailComposeDelegate = self
            let systemVersion = UIDevice.current.systemVersion
            let devicename = UIDevice.modelName
            let buildNumber: String = Bundle.main.object(forInfoDictionaryKey: "CFBundleVersion") as! String
            let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
            
            mail.setToRecipients(["support@mindateq.io"])
            mail.setSubject("Metal Detector — User Question ")
            mail.setMessageBody("<p></p><p>----------------</p><p> Device: \(devicename)</p><p>iOS: \(systemVersion)</p><p>App version: \(appVersion!) (\(buildNumber))</p>", isHTML: true)
            present(mail, animated: true)
        } else { }
    }
    
    func outputMagnetDataByDeviceMotion(magnet: CMCalibratedMagneticField) {
        if SoundAccess.shared.isSoundAccess {
            if self.presentedViewController == nil {
                self.playSound(rate: 0.5)
            } else {
                player?.pause()
                player = nil
                
            }
        }
        var total = abs(sqrt(pow(magnet.field.x, 2) + pow(magnet.field.y, 2) + pow(magnet.field.z, 2)))
        if f {
            startT = total
            f = false
        }
        total = abs(startT - total)
        total *= correctedX
        if total > 450 {
            stackViewChangeColor(sv: stackViewCenter, countColor: 25)
            speed22()
        }
        if total < 450 && total > 400 {
            stackViewChangeColor(sv: stackViewCenter, countColor: 24)
            speed22()
        }
        if total < 400 && total > 350 {
            stackViewChangeColor(sv: stackViewCenter, countColor: 23)
            speed22()
        }
        if total < 350 && total > 300 {
            stackViewChangeColor(sv: stackViewCenter, countColor: 22)
            speed22()
        }
        if total < 300 && total > 260 {
            stackViewChangeColor(sv: stackViewCenter, countColor: 21)
            speed22()
        }
        if total < 260 && total > 240 {
            stackViewChangeColor(sv: stackViewCenter, countColor: 20)
            speed22()
        }
        if total < 240 && total > 220 {
            speed22()
            stackViewChangeColor(sv: stackViewCenter, countColor: 19)
        }
        if total < 220 && total > 200 {
            speed215()
            stackViewChangeColor(sv: stackViewCenter, countColor: 18)
        }
        if total < 200 && total > 180 {
            speed215()
            stackViewChangeColor(sv: stackViewCenter, countColor: 17)
        }
        if total < 180 && total > 160 {
            speed215()
            stackViewChangeColor(sv: stackViewCenter, countColor: 16)
        }
        if total < 160 && total > 140 {
            speed215()
            stackViewChangeColor(sv: stackViewCenter, countColor: 15)
        }
        if total < 140 && total > 120 {
            speed215()
            stackViewChangeColor(sv: stackViewCenter, countColor: 14)
        }
        if total < 120 && total > 110 {
            speed215()
            stackViewChangeColor(sv: stackViewCenter, countColor: 13)
        }
        if total < 110 && total > 100 {
            speed21()
            stackViewChangeColor(sv: stackViewCenter, countColor: 12)
        }
        if total < 100 && total > 90 {
            speed21()
            stackViewChangeColor(sv: stackViewCenter, countColor: 11)
        }
        if total < 90 && total > 80 {
            stackViewChangeColor(sv: stackViewCenter, countColor: 10)
            speed21()
        }
        if total < 80 && total > 70 {
            stackViewChangeColor(sv: stackViewCenter, countColor: 9)
            speed21()
        }
        if total < 70 && total > 60 {
            stackViewChangeColor(sv: stackViewCenter, countColor: 8)
            speed21()
        }
        if total < 60 && total > 50 {
            stackViewChangeColor(sv: stackViewCenter, countColor: 7)
            speed11()
        }
        if total < 50 && total > 40 {
            stackViewChangeColor(sv: stackViewCenter, countColor: 6)
            speed11()
        }
        if total < 40 && total > 30 {
            stackViewChangeColor(sv: stackViewCenter, countColor: 5)
            speed11()
        }
        if total < 30 && total > 20 {
            stackViewChangeColor(sv: stackViewCenter, countColor: 4)
            speed11()
        }
        if total < 20 && total > 10 {
            stackViewChangeColor(sv: stackViewCenter, countColor: 3)
            speed11()
        }
        if total < 10 && total > 0 {
            stackViewChangeColor(sv: stackViewCenter, countColor: 2)
            speed11()
        }
        if total == 0 {
            stackViewChangeColor(sv: stackViewCenter, countColor: 1)
            speed11()
        }
        
        total -= 40
        if total > 450 {
            stackViewChangeColor(sv: stackViewLeft, countColor: 25)
        }
        if total < 450 && total > 400 {
            stackViewChangeColor(sv: stackViewLeft, countColor: 24)
        }
        if total < 400 && total > 350 {
            stackViewChangeColor(sv: stackViewLeft, countColor: 23)
        }
        if total < 350 && total > 300 {
            stackViewChangeColor(sv: stackViewLeft, countColor: 22)
        }
        if total < 300 && total > 260 {
            stackViewChangeColor(sv: stackViewLeft, countColor: 21)
        }
        if total < 260 && total > 240 {
            stackViewChangeColor(sv: stackViewLeft, countColor: 20)
        }
        if total < 240 && total > 220 {
            stackViewChangeColor(sv: stackViewLeft, countColor: 19)
        }
        if total < 220 && total > 200 {
            stackViewChangeColor(sv: stackViewLeft, countColor: 18)
        }
        if total < 200 && total > 180 {
            stackViewChangeColor(sv: stackViewLeft, countColor: 17)
        }
        if total < 180 && total > 160 {
            stackViewChangeColor(sv: stackViewLeft, countColor: 16)
        }
        if total < 160 && total > 140 {
            stackViewChangeColor(sv: stackViewLeft, countColor: 15)
        }
        if total < 140 && total > 120 {
            stackViewChangeColor(sv: stackViewLeft, countColor: 14)
        }
        if total < 120 && total > 110 {
            stackViewChangeColor(sv: stackViewLeft, countColor: 13)
        }
        if total < 110 && total > 100 {
            stackViewChangeColor(sv: stackViewLeft, countColor: 12)
        }
        if total < 100 && total > 90 {
            stackViewChangeColor(sv: stackViewLeft, countColor: 11)
        }
        if total < 90 && total > 80 {
            stackViewChangeColor(sv: stackViewLeft, countColor: 10)
        }
        if total < 80 && total > 70 {
            stackViewChangeColor(sv: stackViewLeft, countColor: 9)
        }
        if total < 70 && total > 60 {
            stackViewChangeColor(sv: stackViewLeft, countColor: 8)
        }
        if total < 60 && total > 50 {
            stackViewChangeColor(sv: stackViewLeft, countColor: 7)
        }
        if total < 50 && total > 40 {
            stackViewChangeColor(sv: stackViewLeft, countColor: 6)
        }
        if total < 40 && total > 30 {
            stackViewChangeColor(sv: stackViewLeft, countColor: 5)
        }
        if total < 30 && total > 20 {
            stackViewChangeColor(sv: stackViewLeft, countColor: 4)
        }
        if total < 20 && total > 10 {
            stackViewChangeColor(sv: stackViewLeft, countColor: 3)
        }
        if total < 10 && total > 0 {
            stackViewChangeColor(sv: stackViewLeft, countColor: 2)
        }
        if total == 0 {
            stackViewChangeColor(sv: stackViewLeft, countColor: 1)
        }
        if total < 0 {
            stackViewChangeColor(sv: stackViewLeft, countColor: 0)
        }
        
        total += 80
        if total > 450 {
            stackViewChangeColor(sv: stackViewRight, countColor: 25)
        }
        if total < 450 && total > 400 {
            stackViewChangeColor(sv: stackViewRight, countColor: 24)
        }
        if total < 400 && total > 350 {
            stackViewChangeColor(sv: stackViewRight, countColor: 23)
        }
        if total < 350 && total > 300 {
            stackViewChangeColor(sv: stackViewRight, countColor: 22)
        }
        if total < 300 && total > 260 {
            stackViewChangeColor(sv: stackViewRight, countColor: 21)
        }
        if total < 260 && total > 240 {
            stackViewChangeColor(sv: stackViewRight, countColor: 20)
        }
        if total < 240 && total > 220 {
            stackViewChangeColor(sv: stackViewRight, countColor: 19)
        }
        if total < 220 && total > 200 {
            stackViewChangeColor(sv: stackViewRight, countColor: 18)
        }
        if total < 200 && total > 180 {
            stackViewChangeColor(sv: stackViewRight, countColor: 17)
        }
        if total < 180 && total > 160 {
            stackViewChangeColor(sv: stackViewRight, countColor: 16)
        }
        if total < 160 && total > 140 {
            stackViewChangeColor(sv: stackViewRight, countColor: 15)
        }
        if total < 140 && total > 120 {
            stackViewChangeColor(sv: stackViewRight, countColor: 14)
        }
        if total < 120 && total > 110 {
            stackViewChangeColor(sv: stackViewRight, countColor: 13)
        }
        if total < 110 && total > 100 {
            stackViewChangeColor(sv: stackViewRight, countColor: 12)
        }
        if total < 100 && total > 90 {
            stackViewChangeColor(sv: stackViewRight, countColor: 11)
        }
        if total < 90 && total > 80 {
            stackViewChangeColor(sv: stackViewRight, countColor: 10)
        }
        if total < 80 && total > 70 {
            stackViewChangeColor(sv: stackViewRight, countColor: 9)
        }
        if total < 70 && total > 60 {
            stackViewChangeColor(sv: stackViewRight, countColor: 8)
        }
        if total < 60 && total > 50 {
            stackViewChangeColor(sv: stackViewRight, countColor: 7)
        }
        if total < 50 && total > 40 {
            stackViewChangeColor(sv: stackViewRight, countColor: 6)
        }
        if total < 40 && total > 30 {
            stackViewChangeColor(sv: stackViewRight, countColor: 5)
        }
        if total < 30 && total > 20 {
            stackViewChangeColor(sv: stackViewRight, countColor: 4)
        }
        if total < 20 && total > 10 {
            stackViewChangeColor(sv: stackViewRight, countColor: 3)
        }
        if total < 10 && total > 0 {
            stackViewChangeColor(sv: stackViewRight, countColor: 2)
        }
        if total <= 0 {
            stackViewChangeColor(sv: stackViewRight, countColor: 1)
        }
    }
    
    func speed22(){
        if player?.status == .none {
            if SoundAccess.shared.isSoundAccess {
                self.playSound(rate: 1.8)
            }
        } else {
            player?.rate = 1.8 }
        if self.presentedViewController == nil {
            UIDevice.vibrate()
        }
    }
    
    func speed215(){
        if player?.status == .none {
            if SoundAccess.shared.isSoundAccess {
                self.playSound(rate: 1.2)
            }
        } else {
            player?.rate = 1.2
        }
        
    }
    
    func speed21(){
        if player?.status == .none {
            if SoundAccess.shared.isSoundAccess {
                self.playSound(rate: 0.3)
            }
        } else {
            player?.rate = 0.3
        }
    }
    
    func speed11(){
        player = nil
    }
    
    func startMagnetometer() {
        
        isDetecting = false
        f = true
        let helper = CMCalibratedMagneticField(field: field, accuracy: accuracy!)
        if motionManager.isMagnetometerAvailable {
            motionManager.deviceMotionUpdateInterval = updateInterval
            motionManager.showsDeviceMovementDisplay = true
            updateDeviceMotionHandler = {(deviceMotion: CMDeviceMotion?, error: Error?) -> Void in
                self.outputMagnetDataByDeviceMotion(magnet: self.motionManager.deviceMotion?.magneticField ?? helper)
            }
        }
        guard let current = updateDeviceMotionHandler else {
            // some code
            return
        }
        motionManager.startDeviceMotionUpdates(using: CMAttitudeReferenceFrame.xArbitraryCorrectedZVertical, to: OperationQueue.main, withHandler: current)
        locationManager?.startUpdatingHeading()
    }
    
    func stopMagnetometer() {
        if (motionManager.isMagnetometerAvailable) {
            motionManager.stopDeviceMotionUpdates()
        }
        locationManager?.stopUpdatingHeading()
        headingTimer?.invalidate()
    }
    
    @objc func setting() {
        let vc = SettingViewController()
        present(vc, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    func stackViewChangeColor(sv :UIStackView, countColor :Int) {
        
        var index = 1
        for i in sv.arrangedSubviews.reversed() {
            if index <= countColor {
                i.backgroundColor = UIColor(named: "color\(index)")
                index += 1
            }
            else {
                i.backgroundColor = UIColor(named: "backgroundScale")
                index += 1
            }
            
        }
    }
    
    @objc func changeSlider(sender :UISlider) {
        if sender == slider {
            correctedX = Double(sender.value)
            print(correctedX)
        }
        
    }
    
}
