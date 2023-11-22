//
//  RemoteConfig.swift
//  MetalDetector
//
//  Created by Kirill Sedliarov on 15.11.22.
//

import Foundation
import UIKit
import FirebaseRemoteConfig

class RemoteConfigFetch {
    
    static var shared = RemoteConfigFetch()
    let remoteConfig = RemoteConfig.remoteConfig()
    
    let defaults: [String: NSObject] = [
        "welcomeTourScreenNumber" : "1" as NSObject,
        "welcomeTourSubscription" : "{\"1\": \"com.metaldetector.1wetr\",                                                           \"2\": \"com.metaldetector.1motr\",                                                           \"3\": \"com.metaldetector.1yetr\" }" as NSObject,
        "closeButtonDelay"        : "0" as NSObject,
        "adsShow"                 : "2" as NSObject,
        "availableFreeDetector"   : "1000" as NSObject,
        "availableFreeProtractor" : "20" as NSObject,
        "availableFreeMeasure"    : "20" as NSObject,
        "availableFreeLevel"      : "20" as NSObject,
        "availableFreeRuler"      : "20" as NSObject,
        "rateUs"                  : "1" as NSObject,
        "otherScreenNumber"       : "1" as NSObject,
        "otherSubscription"       : "{\"1\": \"com.metaldetector.1we\",                                                             \"2\": \"com.metaldetector.1mo\",                                                             \"3\": \"com.metaldetector.1ye\" }" as NSObject,
        
    ]
    
    public func fetchValuesOnBoard() {
        let setting = RemoteConfigSettings()
        setting.minimumFetchInterval = 0
        remoteConfig.setDefaults(defaults)
        remoteConfig.configSettings = setting
        remoteConfig.fetchAndActivate { (status, error) in
            
            if error != nil {
                
            } else {
                if status != .error{
                    UserDefaults.standard.set(self.remoteConfig["welcomeTourScreenNumber"].stringValue, forKey: "getter")
                    UserDefaults.standard.set(self.remoteConfig["welcomeTourSubscription"].stringValue, forKey: "wSub")
                    UserDefaults.standard.set(self.remoteConfig["closeButtonDelay"].stringValue, forKey: "closeButtonDelay")
                    UserDefaults.standard.set(self.remoteConfig["adsShow"].stringValue, forKey: "getter3")
                    UserDefaults.standard.set(self.remoteConfig["availableFreeDetector"].stringValue, forKey: "availableFreeDetector")
                    UserDefaults.standard.set(self.remoteConfig["availableFreeLevel"].stringValue, forKey: "availableFreeLevel")
                    UserDefaults.standard.set(self.remoteConfig["availableFreeProtractor"].stringValue, forKey: "availableFreeProtractor")
                    UserDefaults.standard.set(self.remoteConfig["availableFreeMeasure"].stringValue, forKey: "availableFreeMeasure")
                    UserDefaults.standard.set(self.remoteConfig["availableFreeRuler"].stringValue, forKey: "availableFreeRuler")
                    UserDefaults.standard.set(self.remoteConfig["otherScreenNumber"].stringValue, forKey: "getter2")
                    UserDefaults.standard.set(self.remoteConfig["otherSubscription"].stringValue, forKey: "oSub")
                    UserDefaults.standard.set(self.remoteConfig["rateUs"].stringValue, forKey: "rateUs")
                    print("Remoute Loaded")
                }
                if status == .error{
                    UserDefaults.standard.set("1", forKey: "getter")
                    UserDefaults.standard.set("{   \"1\": \"com.metaldetector.1wetr\",   \"2\": \"com.metaldetector.1motr\",   \"3\": \"com.metaldetector.1yetr\" }", forKey: "wSub")
                    UserDefaults.standard.set("0", forKey: "closeButtonDelay")
                    UserDefaults.standard.set("2", forKey: "getter3")
                    UserDefaults.standard.set("1000", forKey: "availableFreeDetector")
                    UserDefaults.standard.set("20", forKey: "availableFreeLevel")
                    UserDefaults.standard.set("20", forKey: "availableFreeProtractor")
                    UserDefaults.standard.set("20", forKey: "availableFreeMeasure")
                    UserDefaults.standard.set("20", forKey: "availableFreeRuler")
                    UserDefaults.standard.set("1", forKey: "getter2")
                    UserDefaults.standard.set("{   \"1\": \"com.metaldetector.1we\",   \"2\": \"com.metaldetector.1mo\",   \"3\": \"com.metaldetector.1ye\" }", forKey: "oSub")
                    UserDefaults.standard.set("1", forKey: "rateUs")
                    print("Eror: Remoute UnLoaded")
                }
            }
        }
    }
    
    public func fetchValues() {
        
        let setting = RemoteConfigSettings()
        setting.minimumFetchInterval = 0
        remoteConfig.setDefaults(defaults)
        remoteConfig.configSettings = setting
        remoteConfig.fetchAndActivate { (status, error) in
            
            if error != nil {
                
            } else {
                if status != .error{
                    UserDefaults.standard.set(self.remoteConfig["adsShow"].stringValue, forKey: "getter3")
                    UserDefaults.standard.set(self.remoteConfig["rateUs"].stringValue, forKey: "rateUs")
                    UserDefaults.standard.set(self.remoteConfig["availableFreeDetector"].stringValue, forKey: "availableFreeDetector")
                    UserDefaults.standard.set(self.remoteConfig["availableFreeLevel"].stringValue, forKey: "availableFreeLevel")
                    UserDefaults.standard.set(self.remoteConfig["availableFreeProtractor"].stringValue, forKey: "availableFreeProtractor")
                    UserDefaults.standard.set(self.remoteConfig["availableFreeMeasure"].stringValue, forKey: "availableFreeMeasure")
                    UserDefaults.standard.set(self.remoteConfig["availableFreeRuler"].stringValue, forKey: "availableFreeRuler")
                    UserDefaults.standard.set(self.remoteConfig["otherScreenNumber"].stringValue, forKey: "getter2")
                    UserDefaults.standard.set(self.remoteConfig["otherSubscription"].stringValue, forKey: "oSub")
                    UserDefaults.standard.set(self.remoteConfig["closeButtonDelay"].stringValue, forKey: "closeButtonDelay")
                    print("Remoute Loaded")
                }
                if status == .error{
                    UserDefaults.standard.set("2", forKey: "getter3")
                    UserDefaults.standard.set("1", forKey: "rateUs")
                    UserDefaults.standard.set("1000", forKey: "availableFreeDetector")
                    UserDefaults.standard.set("20", forKey: "availableFreeLevel")
                    UserDefaults.standard.set("20", forKey: "availableFreeProtractor")
                    UserDefaults.standard.set("20", forKey: "availableFreeMeasure")
                    UserDefaults.standard.set("20", forKey: "availableFreeRuler")
                    UserDefaults.standard.set("1", forKey: "getter2")
                    UserDefaults.standard.set("{   \"1\": \"com.metaldetector.1we\",   \"2\": \"com.metaldetector.1mo\",   \"3\": \"com.metaldetector.1ye\" }", forKey: "oSub")
                    UserDefaults.standard.set("0", forKey: "closeButtonDelay")
                    print("Eror: Remoute UnLoaded")
                }
            }
        }
    }
}
