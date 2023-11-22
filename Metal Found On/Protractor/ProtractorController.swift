//
//  ProtractorController.swift
//  BuilderHelper
//
//  Created by Kirill Sedliarov on 8.11.22.
//

import Foundation
import UIKit
import GoogleMobileAds

class ProtractorViewController: UIViewController{
    
    let local = LocalizationVariables()
    var getter3 = "1"
    let move = UIScreen.main.bounds.height / 5.012
    
    var touchTap: CGPoint?
    var touchRectFirst: CGRect?
    var touchRectSecond: CGRect?
    var startPosition = CGPoint(x: 0, y: UIScreen.main.bounds.height / 2.8692)
    var lastPosition: CGPoint?
    var rotateAngle: Double = 0.0
    var firstPosition: CGPoint?
    var secondPosition: CGPoint?
    var s = false
    var f = false
    var negative = false
    
    lazy var prot = ImageView(image: .protractorOrange)
    lazy var pageTitle = Label(type: .pageTitle, local.titleProtractor)
    lazy var pageTitle2 = Label(type: .pageTitle, local.titleProtractor)
    lazy var rad = Label(type: .protractorLabel, "")
    lazy var btn = Button(type: .circle, "")
    lazy var btn2 = Button(type: .circle, "")
    lazy var btnSetting = Button(type: .circle, "")
    lazy var btnSetting2 = Button(type: .circle, "")
    lazy var place = View(type: .drawPlace)
    lazy var vads = View(type: .ads)
    var baner: GADBannerView!
    
    let shapeLayerFirst = CAShapeLayer()
    let shapeLayerSecond = CAShapeLayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
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
            btn2.isHidden = false
            pageTitle.isHidden = true
            btnSetting.isHidden = true
            btn.isHidden = true
            vads.isHidden = true
            setup()
            first()
            second()
            rad.text = "\(String(format: "%.0f", angle(firstPosition!, end: secondPosition!)))°"
        } else if getter3 as! String == "1"{
            pageTitle2.isHidden = true
            btnSetting2.isHidden = true
            btn2.isHidden = true
            pageTitle.isHidden = false
            btnSetting.isHidden = false
            btn.isHidden = false
            baner = GADBannerView(adSize: GADAdSizeBanner)
            baner.adUnitID = "ca-app-pub-3940256099942544/2934735716"
            baner.rootViewController = self
            baner.load(GADRequest())
            setup()
            first()
            second()
            rad.text = "\(String(format: "%.0f", angle(firstPosition!, end: secondPosition!)))°"
        } else {
            pageTitle2.isHidden = true
            btnSetting2.isHidden = true
            btn2.isHidden = true
            pageTitle.isHidden = false
            btnSetting.isHidden = false
            btn.isHidden = false
            baner = GADBannerView(adSize: GADAdSizeBanner)
            baner.adUnitID = "ca-app-pub-4602239242191301/9270248768"
            baner.rootViewController = self
            baner.load(GADRequest())
            setup()
            first()
            second()
            rad.text = "\(String(format: "%.0f", angle(firstPosition!, end: secondPosition!)))°"
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        UserDefaults.standard.set(1, forKey: "FullAccess")
        var helper = UserDefaults.standard.value(forKey: "freeP") as! Int
        helper += 1
        UserDefaults.standard.set(helper, forKey: "freeP")
        if UserDefaults.standard.value(forKey: "FullAccess") as! Int == 1 { helper = 0 }
        var value = UserDefaults.standard.value(forKey: "availableFreeProtractor")
        if value == nil {
            value = "20"
        }
        if helper > Int(value as! String)! || Int(value as! String)! == 0{
            var getter2 = "1"
            if UserDefaults.standard.value(forKey: "getter2") as? String != nil {
                getter2 = UserDefaults.standard.value(forKey: "getter2") as! String
            } else {
                getter2 = "1"
            }
            if getter2 == "0" {
            }
//            else if getter2 == "2" {
//                print("SubscribeController")
//                let vc = FirstSubscribeViewController()
//                vc.modalPresentationStyle = .fullScreen
//                self.present(vc, animated: true)
//            } else {
//                print("SubscribeController")
//                let vc = SecondSubscribeViewController()
//                vc.modalPresentationStyle = .fullScreen
//                self.present(vc, animated: true)
//            }
        }
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }
}
