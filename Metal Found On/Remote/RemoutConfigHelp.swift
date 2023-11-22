//
//  RemoutConfigHelp.swift
//  MetalDetector
//
//  Created by Kirill Sedliarov on 25.11.22.
//

import Foundation
import UIKit
import FirebaseRemoteConfig

class RemoteConfigFetchHelp {

    static var shared = RemoteConfigFetch()
    let remoteConfig = RemoteConfig.remoteConfig()

    public func fetchValues(_ value: String, completion: @escaping (String) -> Void) {
        var returnName = ""
        let setting = RemoteConfigSettings()
        setting.minimumFetchInterval = 0
        remoteConfig.configSettings = setting
        remoteConfig.fetchAndActivate { (status, error) in

        switch value{
            case "welcomeTourScreenNumber":
                if error !=  nil {
                } else {
                    if status != .error {
                        if let stringValue =
                            self.remoteConfig["welcomeTourScreenNumber"].stringValue {
                            returnName = stringValue
                            print(returnName)
                            completion(returnName)
                        }
                    }
                }
            case "welcomeTourSubscription":
                if error !=  nil {
                } else {
                    if status != .error {
                        if let stringValue =
                            self.remoteConfig["welcomeTourSubscription"].stringValue {
                            returnName = stringValue
                            completion(returnName)
                        }
                    }
                }
            case "otherScreenNumber":
                if error !=  nil {
                } else {
                    if status != .error {
                        if let stringValue =
                            self.remoteConfig["otherScreenNumber"].stringValue {
                            returnName = stringValue
                            print(returnName)
                            completion(returnName)
                        }
                    }
                }
            case "otherSubscription":
                if error !=  nil {
                } else {
                    if status != .error {
                        if let stringValue =
                            self.remoteConfig["otherSubscription"].stringValue {
                            returnName = stringValue
                            completion(returnName)
                        }
                    }
                }
            case "closeButtonDelay":
                if error !=  nil {
                } else {
                    if status != .error {
                        if let stringValue =
                            self.remoteConfig["closeButtonDelay"].stringValue {
                            returnName = stringValue
                            print(returnName)
                            completion(returnName)
                        }
                    }
                }
            case "availableFreeDetector":
                if error !=  nil {
                } else {
                    if status != .error {
                        if let stringValue =
                            self.remoteConfig["availableFreeDetector"].stringValue {
                            returnName = stringValue
                            print(returnName)
                            completion(returnName)
                        }
                    }
                }

            case "availableFreeRuler":
                if error !=  nil {
                } else {
                    if status != .error {
                        if let stringValue =
                            self.remoteConfig["availableFreeRuler"].stringValue {
                            returnName = stringValue
                            print(returnName)
                            completion(returnName)
                        }
                    }
                }

            case "availableFreeLevel":
                if error !=  nil {
                } else {
                    if status != .error {
                        if let stringValue =
                            self.remoteConfig["availableFreeLevel"].stringValue {
                            returnName = stringValue
                            print(returnName)
                            completion(returnName)
                        }
                    }
                }

            case "availableFreeMeasure":
                if error !=  nil {
                } else {
                    if status != .error {
                        if let stringValue =
                            self.remoteConfig["availableFreeVirtualMeasure"].stringValue {
                            returnName = stringValue
                            print(returnName)
                            completion(returnName)
                        }
                    }
                }

            case "availableFreeProtractor":
                if error !=  nil {
                } else {
                    if status != .error {
                        if let stringValue =
                            self.remoteConfig["availableFreeProtractor"].stringValue {
                            returnName = stringValue
                            print(returnName)
                            completion(returnName)
                        }
                    }
                }

            case "rateUs":
                if error !=  nil {
                } else {
                    if status != .error {
                        if let stringValue =
                            self.remoteConfig["rateUs"].stringValue {
                            returnName = stringValue
                            print(returnName)
                            completion(returnName)
                        }
                    }
                }

            case "adsShow":
                if error !=  nil {
                } else {
                    if status != .error {
                        if let stringValue =
                            self.remoteConfig["adsShow"].stringValue {
                            returnName = stringValue
                            print(returnName)
                            completion(returnName)
                        }
                    }
                }

        default:
            print("error")
        }

        }
    }
}
