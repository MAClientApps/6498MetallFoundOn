//
//  MetalSearchController.swift
//  BuilderHelper
//
//  Created by Kirill Sedliarov on 6.11.22.
//

import Foundation
import UIKit
import CoreMotion
import CoreLocation
import GoogleMobileAds
import AVFoundation
import StoreKit
import MessageUI

class MetalSearchViewController : UIViewController {
    
    //MARK: Support var
    
    let motionManager = CMMotionManager()
    var locationManager: CLLocationManager? = nil
    var isDetecting: Bool = false
    let local = LocalizationVariables()
    var getter3 = UserDefaults.standard.value(forKey: "getter3")
    var headingTimer: Timer?
    let updateInterval = 0.8
    var updateDeviceMotionHandler: CMDeviceMotionHandler? = nil
    var correctedX = 0.0
    var accuracy = CMMagneticFieldCalibrationAccuracy(rawValue: 1)
    var field = CMMagneticField(x: 1.0, y: 1.0, z: 1.0)
    var player: AVPlayer?
    var f = true
    var startT = 0.0
    
    
    //MARK: Create UI elements
    
    lazy var pageTitle = Label(type: .pageTitle, local.titleMetal)
    lazy var pageTitle2 = Label(type: .pageTitle, local.titleMetal)
    lazy var btnSetting = Button(type: .circle, "")
    lazy var btnSetting2 = Button(type: .circle, "")
    
    var baner: GADBannerView!
    lazy var vads = View(type: .ads)
    
    lazy var min = Label(type: .sliderLabel, local.min)
    lazy var medium = Label(type: .sliderLabel, local.medium)
    lazy var max = Label(type: .sliderLabel, local.max)
    
    lazy var imageCLiner = ImageView(image: .imageLiner)
    lazy var imageCPlace = View(type: .imagePlace)
    lazy var viewCStart = View(type: .segmentView)
    lazy var viewC2 = View(type: .segmentView)
    lazy var viewC3 = View(type: .segmentView)
    lazy var viewC4 = View(type: .segmentView)
    lazy var viewC5 = View(type: .segmentView)
    lazy var viewC6 = View(type: .segmentView)
    lazy var viewC7 = View(type: .segmentView)
    lazy var viewC8 = View(type: .segmentView)
    lazy var viewC9 = View(type: .segmentView)
    lazy var viewC10 = View(type: .segmentView)
    lazy var viewC11 = View(type: .segmentView)
    lazy var viewC12 = View(type: .segmentView)
    lazy var viewC13 = View(type: .segmentView)
    lazy var viewC14 = View(type: .segmentView)
    lazy var viewC15 = View(type: .segmentView)
    lazy var viewC16 = View(type: .segmentView)
    lazy var viewC17 = View(type: .segmentView)
    lazy var viewC18 = View(type: .segmentView)
    lazy var viewC19 = View(type: .segmentView)
    lazy var viewC20 = View(type: .segmentView)
    lazy var viewC21 = View(type: .segmentView)
    lazy var viewC22 = View(type: .segmentView)
    lazy var viewC23 = View(type: .segmentView)
    lazy var viewC24 = View(type: .segmentView)
    lazy var viewCEnd = View(type: .segmentView)
    
    lazy var imageLLiner = ImageView(image: .leftLiner)
    lazy var imageLPlace = View(type: .imagePlace)
    lazy var viewLStart = View(type: .segmentView)
    lazy var viewL2 = View(type: .segmentView)
    lazy var viewL3 = View(type: .segmentView)
    lazy var viewL4 = View(type: .segmentView)
    lazy var viewL5 = View(type: .segmentView)
    lazy var viewL6 = View(type: .segmentView)
    lazy var viewL7 = View(type: .segmentView)
    lazy var viewL8 = View(type: .segmentView)
    lazy var viewL9 = View(type: .segmentView)
    lazy var viewL10 = View(type: .segmentView)
    lazy var viewL11 = View(type: .segmentView)
    lazy var viewL12 = View(type: .segmentView)
    lazy var viewL13 = View(type: .segmentView)
    lazy var viewL14 = View(type: .segmentView)
    lazy var viewL15 = View(type: .segmentView)
    lazy var viewL16 = View(type: .segmentView)
    lazy var viewL17 = View(type: .segmentView)
    lazy var viewL18 = View(type: .segmentView)
    lazy var viewL19 = View(type: .segmentView)
    lazy var viewL20 = View(type: .segmentView)
    lazy var viewL21 = View(type: .segmentView)
    lazy var viewL22 = View(type: .segmentView)
    lazy var viewL23 = View(type: .segmentView)
    lazy var viewL24 = View(type: .segmentView)
    lazy var viewLEnd = View(type: .segmentView)
    
    lazy var imageRLiner = ImageView(image: .rightLiner)
    lazy var imageRPlace = View(type: .imagePlace)
    lazy var viewRStart = View(type: .segmentView)
    lazy var viewR2 = View(type: .segmentView)
    lazy var viewR3 = View(type: .segmentView)
    lazy var viewR4 = View(type: .segmentView)
    lazy var viewR5 = View(type: .segmentView)
    lazy var viewR6 = View(type: .segmentView)
    lazy var viewR7 = View(type: .segmentView)
    lazy var viewR8 = View(type: .segmentView)
    lazy var viewR9 = View(type: .segmentView)
    lazy var viewR10 = View(type: .segmentView)
    lazy var viewR11 = View(type: .segmentView)
    lazy var viewR12 = View(type: .segmentView)
    lazy var viewR13 = View(type: .segmentView)
    lazy var viewR14 = View(type: .segmentView)
    lazy var viewR15 = View(type: .segmentView)
    lazy var viewR16 = View(type: .segmentView)
    lazy var viewR17 = View(type: .segmentView)
    lazy var viewR18 = View(type: .segmentView)
    lazy var viewR19 = View(type: .segmentView)
    lazy var viewR20 = View(type: .segmentView)
    lazy var viewR21 = View(type: .segmentView)
    lazy var viewR22 = View(type: .segmentView)
    lazy var viewR23 = View(type: .segmentView)
    lazy var viewR24 = View(type: .segmentView)
    lazy var viewREnd = View(type: .segmentView)
    
    lazy var stackViewCenter: UIStackView = {
        let sv = UIStackView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.axis = .vertical
        sv.spacing = UIScreen.main.bounds.height/230
        sv.distribution = .equalSpacing
        sv.alignment = .center
        
        sv.addArrangedSubview(viewCEnd)
        sv.addArrangedSubview(viewC24)
        sv.addArrangedSubview(viewC23)
        sv.addArrangedSubview(viewC22)
        sv.addArrangedSubview(viewC21)
        sv.addArrangedSubview(viewC20)
        sv.addArrangedSubview(viewC19)
        sv.addArrangedSubview(viewC18)
        sv.addArrangedSubview(viewC17)
        sv.addArrangedSubview(viewC16)
        sv.addArrangedSubview(viewC15)
        sv.addArrangedSubview(viewC14)
        sv.addArrangedSubview(viewC13)
        sv.addArrangedSubview(viewC12)
        sv.addArrangedSubview(viewC11)
        sv.addArrangedSubview(viewC10)
        sv.addArrangedSubview(viewC9)
        sv.addArrangedSubview(viewC8)
        sv.addArrangedSubview(viewC7)
        sv.addArrangedSubview(viewC6)
        sv.addArrangedSubview(viewC5)
        sv.addArrangedSubview(viewC4)
        sv.addArrangedSubview(viewC3)
        sv.addArrangedSubview(viewC2)
        sv.addArrangedSubview(viewCStart)
        
        return sv
    }()
    
    lazy var stackViewLeft: UIStackView = {
        let sv = UIStackView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.axis = .vertical
        sv.spacing = UIScreen.main.bounds.height/230
        sv.distribution = .equalSpacing
        sv.alignment = .center
        
        sv.addArrangedSubview(viewLEnd)
        sv.addArrangedSubview(viewL24)
        sv.addArrangedSubview(viewL23)
        sv.addArrangedSubview(viewL22)
        sv.addArrangedSubview(viewL21)
        sv.addArrangedSubview(viewL20)
        sv.addArrangedSubview(viewL19)
        sv.addArrangedSubview(viewL18)
        sv.addArrangedSubview(viewL17)
        sv.addArrangedSubview(viewL16)
        sv.addArrangedSubview(viewL15)
        sv.addArrangedSubview(viewL14)
        sv.addArrangedSubview(viewL13)
        sv.addArrangedSubview(viewL12)
        sv.addArrangedSubview(viewL11)
        sv.addArrangedSubview(viewL10)
        sv.addArrangedSubview(viewL9)
        sv.addArrangedSubview(viewL8)
        sv.addArrangedSubview(viewL7)
        sv.addArrangedSubview(viewL6)
        sv.addArrangedSubview(viewL5)
        sv.addArrangedSubview(viewL4)
        sv.addArrangedSubview(viewL3)
        sv.addArrangedSubview(viewL2)
        sv.addArrangedSubview(viewLStart)
        
        return sv
    }()
    
    lazy var stackViewRight: UIStackView = {
        let sv = UIStackView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.axis = .vertical
        sv.spacing = UIScreen.main.bounds.height/230
        sv.distribution = .equalSpacing
        sv.alignment = .center
        
        sv.addArrangedSubview(viewREnd)
        sv.addArrangedSubview(viewR24)
        sv.addArrangedSubview(viewR23)
        sv.addArrangedSubview(viewR22)
        sv.addArrangedSubview(viewR21)
        sv.addArrangedSubview(viewR20)
        sv.addArrangedSubview(viewR19)
        sv.addArrangedSubview(viewR18)
        sv.addArrangedSubview(viewR17)
        sv.addArrangedSubview(viewR16)
        sv.addArrangedSubview(viewR15)
        sv.addArrangedSubview(viewR14)
        sv.addArrangedSubview(viewR13)
        sv.addArrangedSubview(viewR12)
        sv.addArrangedSubview(viewR11)
        sv.addArrangedSubview(viewR10)
        sv.addArrangedSubview(viewR9)
        sv.addArrangedSubview(viewR8)
        sv.addArrangedSubview(viewR7)
        sv.addArrangedSubview(viewR6)
        sv.addArrangedSubview(viewR5)
        sv.addArrangedSubview(viewR4)
        sv.addArrangedSubview(viewR3)
        sv.addArrangedSubview(viewR2)
        sv.addArrangedSubview(viewRStart)
        
        return sv
    }()
    
    lazy var slider: UISlider = {
        let sl = UISlider()
        sl.maximumValue = 16.0
        sl.minimumValue = 0.1
        sl.tintColor = UIColor(named: "orange")
        sl.thumbTintColor = .white
        sl.translatesAutoresizingMaskIntoConstraints = false
        return sl
    }()
    
    override func viewDidLoad() {
        
        if UserDefaults.standard.value(forKey: "FullAccess") as! Int != 1 {
                    IAPManager.shared.verifyPurcahse(product: .yearTrial)
                } else if UserDefaults.standard.value(forKey: "FullAccess") as! Int != 1 {
                    IAPManager.shared.verifyPurcahse(product: .weekTrial)
                } else if UserDefaults.standard.value(forKey: "FullAccess") as! Int != 1 {
                    IAPManager.shared.verifyPurcahse(product: .mounthTrial)
                } else if UserDefaults.standard.value(forKey: "FullAccess") as! Int != 1 {
                    IAPManager.shared.verifyPurcahse(product: .year)
                } else if UserDefaults.standard.value(forKey: "FullAccess") as! Int != 1 {
                    IAPManager.shared.verifyPurcahse(product: .mounth)
                } else if UserDefaults.standard.value(forKey: "FullAccess") as! Int != 1 {
                    IAPManager.shared.verifyPurcahse(product: .week)
                }
        if UserDefaults.standard.value(forKey: "note") as! Int == 2 && UserDefaults.standard.value(forKey: "rateUs") as! String == "0" {
            print("STAR REWIEW")
            SKStoreReviewController.requestReview()
        } else if UserDefaults.standard.value(forKey: "note") as! Int == 2 && UserDefaults.standard.value(forKey: "rateUs") as! String == "1" {
            DispatchQueue.main.async {
                self.rate()
            }
        }
        locationManager = CLLocationManager()
        locationManager?.headingFilter = kCLHeadingFilterNone
        startMagnetometer()
        if SoundAccess.shared.isSoundAccess {
            if self.presentedViewController == nil {
                self.playSound(rate: 0.5)
            }
        }
        
        
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(false)
        player?.pause()
        player = nil
        stopMagnetometer()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UserDefaults.standard.set(1, forKey: "FullAccess")
        
        var helper = UserDefaults.standard.value(forKey: "freeMD") as! Int
        helper += 1
        UserDefaults.standard.set(helper, forKey: "freeMD")
        if UserDefaults.standard.value(forKey: "FullAccess") as! Int == 1 { helper = 0 }
        var value = UserDefaults.standard.value(forKey: "availableFreeDetector")
        if value == nil {
            value = "1000"
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(false)
        RemoteConfigFetch.shared.fetchValues()
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
        locationManager = CLLocationManager()
        locationManager?.headingFilter = kCLHeadingFilterNone
        startMagnetometer()
        if !IsFirstLaunch.shared.isFirstLaunch {
            alert()
        }
        if SoundAccess.shared.isSoundAccess {
            if self.presentedViewController == nil {
                self.playSound(rate: 0.5)
            }
        }
        IsFirstLaunch.shared.isFirstLaunch = true
    }
    
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }
    
    
    func playSound(rate: Float) {
        guard let path = Bundle.main.path(forResource: "1", ofType:"mp3") else {
            return }
        let url = URL(fileURLWithPath: path)
        player = AVPlayer.init(url: url)
        player?.currentItem?.audioTimePitchAlgorithm = .timeDomain
        player?.volume = 0.1
        player?.rate = rate
        player?.play()
        
    }
    
    func applicationWillResignActive(application: UIApplication) {
        player = nil
        stopMagnetometer()
    }
    
    func applicationDidEnterBackground(application: UIApplication) {
        player = nil
        stopMagnetometer()
    }
    
    func applicationWillEnterForeground(application: UIApplication) {
        
        locationManager = CLLocationManager()
        locationManager?.headingFilter = kCLHeadingFilterNone
        
        startMagnetometer()
        
        if SoundAccess.shared.isSoundAccess {
            if self.presentedViewController == nil {
                self.playSound(rate: 0.5)
            }
        }
    }
}

extension MetalSearchViewController: MFMailComposeViewControllerDelegate {
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true)
    }
}
