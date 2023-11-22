//
//  AppDelegate.swift
//  BuilderHelper
//
//  Created by Kirill Sedliarov on 6.11.22.
//

import UIKit
import Firebase
import GoogleMobileAds
import SwiftyStoreKit
import AVFAudio
import MobFlowiOS


@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var mobFlow: MobiFlowSwift?
    
    var orientationLock = UIInterfaceOrientationMask.portrait
    
    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
            return self.orientationLock
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        
        
        let oneSignalToken = "18bdbdeb-e553-4bf4-aa8e-e26d8c18ddee"
                let appLovinKey = "gvcyZqhgCmHnI7I-DHWLXoVhQkrqbHzcltIZAATT0RH-cWpBip16xde9wnuZq-I0CTLsqKAoe6z7U_6TdF12bx"
                let bannerID = "deaba5e372fb87b6"
                let interestialID = "6646ea6d08e0a2fe"
                let rewardedID = "b2a9fad404c35df7"
                let appOpenAdID = "b8fd0679f6f19335"

                self.mobFlow = MobiFlowSwift(initDelegate: self, oneSignalToken: oneSignalToken, appLovinKey: appLovinKey, bannerId: bannerID, interestialId: interestialID, rewardedId: rewardedID, appOpenAdId: appOpenAdID, launchOptions: launchOptions)

        
        
        UserDefaults.standard.set(1, forKey: "FullAccess")
        
        if UserDefaults.standard.value(forKey: "FullAccess") == nil {
            UserDefaults.standard.set(1, forKey: "FullAccess")
        }
        if UserDefaults.standard.value(forKey: "note") == nil {
            let setValue = 1
            UserDefaults.standard.set(setValue, forKey: "note")
        } else {
            var helper = UserDefaults.standard.value(forKey: "note") as! Int
            helper += 1
            UserDefaults.standard.set(helper, forKey: "note")
        }
        if UserDefaults.standard.value(forKey: "freeMD") == nil {
            let setValue = 0
            UserDefaults.standard.set(setValue, forKey: "freeMD")
        }
        if UserDefaults.standard.value(forKey: "freeM") == nil {
            let setValue = 0
            UserDefaults.standard.set(setValue, forKey: "freeM")
        }
        if UserDefaults.standard.value(forKey: "freeR") == nil {
            let setValue = 0
            UserDefaults.standard.set(setValue, forKey: "freeR")
        }
        if UserDefaults.standard.value(forKey: "freeP") == nil {
            let setValue = 0
            UserDefaults.standard.set(setValue, forKey: "freeP")
        }
        if UserDefaults.standard.value(forKey: "freeL") == nil {
            let setValue = 0
            UserDefaults.standard.set(setValue, forKey: "freeL")
        }
        UserDefaults.standard.set("0", forKey: "random")
        GADMobileAds.sharedInstance().start(completionHandler: nil)
        GADMobileAds.sharedInstance().requestConfiguration.testDeviceIdentifiers = [ "871653f84bb21809acf9ebff5324a0e7" ]
        //FirebaseApp.configure()
       
        
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "SplashViewController") as? SplashViewController
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.makeKeyAndVisible()
        
        window?.rootViewController = vc
        
//        if IsFirstLaunch.shared.isFirstLaunch {
//            window?.rootViewController = CustomTabBarController()
//        } else {
//            VibrateSound.shared.isVabrateAccess = true
//            SoundAccess.shared.isSoundAccess = true
//            window?.rootViewController = OnBoard()
//        }
        SwiftyStoreKit.completeTransactions(atomically: true) { purchases in
                for purchase in purchases {
                    switch purchase.transaction.transactionState {
                    case .purchased, .restored:
                        if purchase.needsFinishTransaction {
                            // Deliver content from server, then:
                            SwiftyStoreKit.finishTransaction(purchase.transaction)
                        }
                        // Unlock content
                    case .failed, .purchasing, .deferred:
                        break // do nothing
                    @unknown default:
                        fatalError()
                    }
                }
        }
        SwiftyStoreKit.retrieveProductsInfo(["com.metaldetector.1mo"]) {  result in
                    if let product = result.retrievedProducts.first {
                        let priceString = product.localizedPrice!
                        
                    }
                    else if result.invalidProductIDs.first != nil {
                    }
                    else {
                    }
                }
        SwiftyStoreKit.retrieveProductsInfo(["com.metaldetector.1ye"]) {  result in
                    if let product = result.retrievedProducts.first {
                        let priceString = product.localizedPrice!
                        
                    }
                    else if result.invalidProductIDs.first != nil {
                    }
                    else {
                    }
                }
        SwiftyStoreKit.retrieveProductsInfo(["com.metaldetector.1we"]) {  result in
                    if let product = result.retrievedProducts.first {
                        let priceString = product.localizedPrice!
                        
                    }
                    else if result.invalidProductIDs.first != nil {
                    }
                    else {
                    }
                }
        SwiftyStoreKit.retrieveProductsInfo(["com.metaldetector.1motr"]) {  result in
                    if let product = result.retrievedProducts.first {
                        let priceString = product.localizedPrice!
                        
                    }
                    else if result.invalidProductIDs.first != nil {
                    }
                    else {
                    }
                }
        SwiftyStoreKit.retrieveProductsInfo(["com.metaldetector.1yetr"]) {  result in
                    if let product = result.retrievedProducts.first {
                        let priceString = product.localizedPrice!
                        
                    }
                    else if result.invalidProductIDs.first != nil {
                    }
                    else {
                    }
                }
        SwiftyStoreKit.retrieveProductsInfo(["com.metaldetector.1wetr"]) {  result in
                    if let product = result.retrievedProducts.first {
                        let priceString = product.localizedPrice!
                        
                    }
                    else if result.invalidProductIDs.first != nil {
                    }
                    else {
                    }
                }
        
        UserDefaults.standard.set(1, forKey: "FullAccess")
        
        return true
    }
    
    static func sharedInstance() -> AppDelegate{
           return UIApplication.shared.delegate as! AppDelegate
       }

    func applicationDidBecomeActive(_ application: UIApplication) {

        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playback)
        } catch {
            print("AVAudioSessionCategoryPlayback not work")
        }
    }
}

extension AppDelegate : MobiFlowDelegate  {
    
  func present(dic: [String : Any]) {
      DispatchQueue.main.async {
          //self.window = UIWindow(frame: UIScreen.main.bounds)
         
          if IsFirstLaunch.shared.isFirstLaunch {
              self.window?.rootViewController = CustomTabBarController()
          } else {
              VibrateSound.shared.isVabrateAccess = true
              SoundAccess.shared.isSoundAccess = true
              self.window?.rootViewController = OnBoard()
          }
          self.window?.overrideUserInterfaceStyle = .dark
    }
}
    
    func unloadUnityOnNotificationClick() {
        
    }
}
