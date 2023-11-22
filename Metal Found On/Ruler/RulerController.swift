//
//  RulerController.swift
//  BuilderHelper
//
//  Created by Kirill Sedliarov on 6.11.22.
//

import Foundation
import GoogleMobileAds
import UIKit

class RulerViewController: UIViewController{
    
    let local = LocalizationVariables()
    var getter3 = UserDefaults.standard.value(forKey: "getter3")
    
    lazy var pageTitle = Label(type: .pageTitle, local.titleRuler)
    lazy var pageTitle2 = Label(type: .pageTitle, local.titleRuler)
    lazy var btnSetting = Button(type: .circle, "")
    lazy var btnSetting2 = Button(type: .circle, "")
    lazy var ruler = ImageView(image: .ruler)
    lazy var rulerInc = ImageView(image: .rulerInc)
    lazy var ruler2 = ImageView(image: .ruler)
    lazy var rulerInc2 = ImageView(image: .rulerInc)
    lazy var ruler3 = ImageView(image: .ruler)
    lazy var rulerInc3 = ImageView(image: .rulerInc)
    lazy var ruler4 = ImageView(image: .ruler)
    lazy var rulerInc4 = ImageView(image: .rulerInc)
    lazy var ruler5 = ImageView(image: .ruler)
    lazy var rulerInc5 = ImageView(image: .rulerInc)
    lazy var rulerInc6 = ImageView(image: .rulerInc)
    lazy var contentMode = View(type: .contentMode)
    
    lazy var vads = View(type: .ads)
    var baner: GADBannerView!
    
    
    lazy var scrollView: UIScrollView = {
        self.overrideUserInterfaceStyle = .dark
        
        let sv = UIScrollView()
        sv.backgroundColor = UIColor(named: "background")
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.showsVerticalScrollIndicator = false
        sv.contentSize = CGSize(width: sv.contentSize.width, height: UIScreen.main.bounds.height * 100)
        return sv
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
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
            baner.adUnitID = "ca-app-pub-4602239242191301/9270248768"
            baner.rootViewController = self
            baner.load(GADRequest())
            setup()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
      
        UserDefaults.standard.set(1, forKey: "FullAccess")
        var helper = UserDefaults.standard.value(forKey: "freeR") as! Int
        helper += 1
        UserDefaults.standard.set(helper, forKey: "freeR")
        if UserDefaults.standard.value(forKey: "FullAccess") as! Int == 1 { helper = 0 }
        var value = UserDefaults.standard.value(forKey: "availableFreeRuler")
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
