//
//  LevelController.swift
//  BuilderHelper
//
//  Created by Kirill Sedliarov on 6.11.22.
//

import Foundation
import UIKit
import CoreMotion
import GoogleMobileAds
import AVFoundation

class LevelViewController: UIViewController {
    
    //MARK: Support var
    var getter3 = UserDefaults.standard.value(forKey: "getter3")
    let state = UserDefaults.standard.value(forKey: "checker")
    
    let motion = CMMotionManager()
    var saveAnchor = false
    var saveAnchor2 = false
    var saveAnchor3 = false
    
    let local = LocalizationVariables()
    var player: AVAudioPlayer?
    var previosTop = true
    var previosBottom = false
    
    let myAttribute = [ NSAttributedString.Key.font: UIFont.systemFont(ofSize: 24, weight: .regular), NSAttributedString.Key.strokeColor: UIColor.black]
    
    //MARK: Create UI elements
    var shapeY = CAShapeLayer()
    let wth = Double(UIScreen.main.bounds.width)
    let hght = Double(UIScreen.main.bounds.height)
    let v = UIView(frame: CGRect(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height / 2, width: UIScreen.main.bounds.width / 6, height: UIScreen.main.bounds.width / 6))
    let halfY = UIBezierPath(arcCenter: CGPoint(x: UIScreen.main.bounds.width/2, y: UIScreen.main.bounds.height/2),
                             radius: UIScreen.main.bounds.width/6,
                             startAngle: .pi,
                             endAngle: 0,
                             clockwise: true)
    
    lazy var pageTitle = Label(type: .pageTitle, local.titleLevel)
    lazy var pageTitle2 = Label(type: .pageTitle, local.titleLevel)
    lazy var sample = View(type: .circle)
    lazy var sample2 = View(type: .circle)
    lazy var tLine = View(type: .line)
    lazy var lLine = View(type: .line)
    lazy var rLine = View(type: .line)
    lazy var bLine = View(type: .line)
    lazy var xL = Label(type: .ads, "X")
    lazy var vads = View(type: .ads)
    lazy var btnSetting = Button(type: .circle, "")
    lazy var btnSetting2 = Button(type: .circle, "")
    var baner: GADBannerView!
    
    override func viewDidLoad() {
        UserDefaults.standard.setValue("4", forKey: "random")
        //setup()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        startAccelerometers()
        if UserDefaults.standard.value(forKey: "getter3") as? String != nil {
            getter3 = UserDefaults.standard.value(forKey: "getter3") as! String
        } else {
            getter3 = "2"
        }
        if UserDefaults.standard.value(forKey: "FullAccess") as! Int == 1 {
            getter3 = "0"
            baner = nil
        }
        if getter3 as! String == "0" {
            print("fullAccess")
            pageTitle2.isHidden = false
            btnSetting2.isHidden = false
            pageTitle.isHidden = true
            btnSetting.isHidden = true
            vads.isHidden = true
            setup()
        } else if getter3 as! String == "1"{
            pageTitle2.isHidden = true
            btnSetting2.isHidden = true
            pageTitle.isHidden = false
            btnSetting.isHidden = false
            baner = GADBannerView(adSize: GADAdSizeBanner)
            baner.adUnitID = "ca-app-pub-3940256099942544/2934735716"
            baner.rootViewController = self
            baner.load(GADRequest())
            setup()
        } else {
            pageTitle2.isHidden = true
            btnSetting2.isHidden = true
            pageTitle.isHidden = false
            btnSetting.isHidden = false
            baner = GADBannerView(adSize: GADAdSizeBanner)
            baner.adUnitID = "ca-app-pub-46022392424191301/9240248768"
            baner.rootViewController = self
            baner.load(GADRequest())
            setup()
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        motion.stopAccelerometerUpdates()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
       
        UserDefaults.standard.set(1, forKey: "FullAccess")
        
        var helper = UserDefaults.standard.value(forKey: "freeL") as! Int
        helper += 1
        UserDefaults.standard.set(helper, forKey: "freeL")
        if UserDefaults.standard.value(forKey: "FullAccess") as! Int == 1 { helper = 0 }
        var value = UserDefaults.standard.value(forKey: "availableFreeLevel")
        if value == nil {
            value = "20"
        }
        if helper > Int(value as! String)! || Int(value as! String)! == 0 {
            var getter2 = "1"
            if UserDefaults.standard.value(forKey: "getter2") as? String != nil {
                getter2 = UserDefaults.standard.value(forKey: "getter2") as! String
            } else {
                getter2 = "1"
            }
            if getter2 == "0" {
            }
//            else if getter2 == "2" {
//                let vc = FirstSubscribeViewController()
//                vc.modalPresentationStyle = .fullScreen
//                self.present(vc, animated: true)
//            } else {
//                let vc = SecondSubscribeViewController()
//                vc.modalPresentationStyle = .fullScreen
//                self.present(vc, animated: true)
//            }
        }
        startAccelerometers()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        motion.stopAccelerometerUpdates()
    }
    
}
