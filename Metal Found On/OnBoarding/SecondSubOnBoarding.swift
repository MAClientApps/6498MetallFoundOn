//
//  SecondSubOnBoarding.swift
//  MetalDetector
//
//  Created by Kirill Sedliarov on 22.11.22.
//

import Foundation
import UIKit
import SwiftyStoreKit

class SecondSubOnBoarding: UICollectionViewCell {
    
    public static var id = "secondSub"
    let swifty = IAPManager()
    
    var buttonDelay = UserDefaults.standard.value(forKey: "closeButtonDelay")
    //var sub = UserDefaults.standard.value(forKey: "sub")
    
    var first = "com.metaldetector.1wetr"
    var second = "com.metaldetector.1motr"
    var third = "com.metaldetector.1yetr"
    var wPrice = "$0.99"
    var mPrice = "$3.49"
    var yPrice = "$6.99"
    
    var standartHeight = UIScreen.main.bounds.height / 6.1984
    var selecredHeight = UIScreen.main.bounds.height / 5.075
    
    let local = LocalizationVariables()
    
    lazy var mainImage = ImageView(image: .boardingBig)
    
    lazy var header = Label(type: .subscribeHeader, local.subscribeHeader)
    lazy var titleFirst = Label(type: .subscribeTitle, local.subscribeTitleLim)
    lazy var titleSecond = Label(type: .subscribeTitle, local.subscribeTitleAds)
    
    lazy var firstSubView = View(type: .subscribeSubView)
    var firstTopLabel: Label?
    var firstBottomLabel: Label?
    lazy var firstSubPlace = View(type: .subscribeSubViewPlace)
    
    
    lazy var secondSubView = View(type: .subscribeSubView)
    var secondTopLabel: Label?
    var secondBottomLabel: Label?
    lazy var secondSubPlace = View(type: .subscribeSubViewPlace)
    
    lazy var thirdSubView = View(type: .subscribeSubView)
    var thirdTopLabel: Label?
    var thirdBottomLabel: Label?
    lazy var thirdSubPlace = View(type: .subscribeSubViewPlace)
    
    lazy var firstSelectedSubView = View(type: .subscribeSubView)
    var firstSelectedTopLabel: Label?
    var firstSelectedBottomLabel: Label?
    lazy var firstSelectedSubPlace = View(type: .subscribeSubViewPlace)
    
    lazy var secondSelectedSubView = View(type: .subscribeSubView)
    var secondSelectedTopLabel: Label?
    var secondSelectedBottomLabel: Label?
    lazy var secondSelectedSubPlace = View(type: .subscribeSubViewPlace)
    
    lazy var thirdSelectedSubView = View(type: .subscribeSubView)
    var thirdSelectedTopLabel: Label?
    var thirdSelectedBottomLabel: Label?
    lazy var thirdSelectedSubPlace = View(type: .subscribeSubViewPlace)
    
    lazy var continueButton = Button(type: .subscribeContinue, local.continueOnBoarding)
    
    lazy var restoreView = View(type: .dismissView)
    lazy var restoreLabel = Label(type: .restore, local.buttonRestore)
    lazy var dismissView = View(type: .dismissView)
    lazy var xmark = ImageView(image: .xmark)
    
    lazy var restoreTap = UITapGestureRecognizer(target: self, action: #selector(restoreTarget))
    lazy var dismissTap = UITapGestureRecognizer(target: self, action: #selector(closeTarget))
    lazy var recognizeFirst = UITapGestureRecognizer(target: self, action: #selector(firstSub))
    lazy var recognizeSecond = UITapGestureRecognizer(target: self, action: #selector(secondSub))
    lazy var recognizeThird = UITapGestureRecognizer(target: self, action: #selector(thirdSub))
    
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        NotificationCenter.default.addObserver(self, selector: #selector(methodOfReceivedNotification(notification:)), name: Notification.Name("SubscribeOk"), object: nil)
        
        let js = UserDefaults.standard.value(forKey: "wSub") as? String
        
        if js != nil {
            do{
                if let json = js!.data(using: String.Encoding.utf8){
                    if let jsonData = try JSONSerialization.jsonObject(with: json, options: .allowFragments) as? [String:AnyObject]{
                        self.first = jsonData["1"] as! String
                        self.second = jsonData["2"] as! String
                        self.third = jsonData["3"] as! String
                        print(self.first)
                        print(self.second)
                        print(self.third)
                    }
                }
            }catch {
                print(error.localizedDescription)
                
            }
        }
        
        
        let q = DispatchQueue.global(qos: .default)
        q.async {
            [self] in
            SwiftyStoreKit.retrieveProductsInfo([first]) { [self] result in
                if let product = result.retrievedProducts.first {
                    wPrice = product.localizedPrice!
                    if first == "com.metaldetector.1yetr" {
                        self.firstBottomLabel?.attributedText = noActiveBottom(wPrice, local.subscribeYearly)
                        self.firstSelectedBottomLabel?.attributedText = activeBottom(wPrice, local.subscribeYearly)
                    } else if first == "com.metaldetector.1motr" {
                        self.firstBottomLabel?.attributedText = noActiveBottom(wPrice, local.subscribeMonthly)
                        self.firstSelectedBottomLabel?.attributedText = activeBottom(wPrice, local.subscribeMonthly)
                    } else if first == "com.metaldetector.1wetr" {
                        self.firstBottomLabel?.attributedText = noActiveBottom(wPrice, local.subscribeWeekly)
                        self.firstSelectedBottomLabel?.attributedText = activeBottom(wPrice, local.subscribeWeekly)
                    } else {
                        self.firstBottomLabel?.text = wPrice
                        self.firstSelectedBottomLabel?.text = wPrice
                    }
                }
            }
            
            SwiftyStoreKit.retrieveProductsInfo([second]) { [self] result in
                if let product = result.retrievedProducts.first {
                    mPrice = product.localizedPrice!
                    if second == "com.metaldetector.1yetr" {
                        UserDefaults.standard.set("com.metaldetector.1yetr", forKey: "sub")
                        self.secondBottomLabel?.attributedText = noActiveBottom(mPrice, local.subscribeYearly)
                        self.secondSelectedBottomLabel?.attributedText = activeBottom(mPrice, local.subscribeYearly)
                    } else if second == "com.metaldetector.1motr" {
                        UserDefaults.standard.set("com.metaldetector.1motr", forKey: "sub")
                        self.secondBottomLabel?.attributedText = noActiveBottom(mPrice, local.subscribeMonthly)
                        self.secondSelectedBottomLabel?.attributedText = activeBottom(mPrice, local.subscribeMonthly)
                    } else if second == "com.metaldetector.1wetr" {
                        UserDefaults.standard.set("com.metaldetector.1wetr", forKey: "sub")
                        self.secondBottomLabel?.attributedText = noActiveBottom(mPrice, local.subscribeWeekly)
                        self.secondSelectedBottomLabel?.attributedText = activeBottom(mPrice, local.subscribeWeekly)
                    } else if second == "com.metaldetector.1we" {
                        UserDefaults.standard.set("com.metaldetector.1we", forKey: "sub")
                        self.secondBottomLabel?.text = mPrice
                        self.secondSelectedBottomLabel?.text = mPrice
                    } else if second == "com.metaldetector.1mo" {
                        UserDefaults.standard.set("com.metaldetector.1mo", forKey: "sub")
                        self.secondBottomLabel?.text = mPrice
                        self.secondSelectedBottomLabel?.text = mPrice
                    } else if second == "com.metaldetector.1ye" {
                        UserDefaults.standard.set("com.metaldetector.1ye", forKey: "sub")
                        self.secondBottomLabel?.text = mPrice
                        self.secondSelectedBottomLabel?.text = mPrice
                    }
                }
            }
            
            SwiftyStoreKit.retrieveProductsInfo([third]) { [self] result in
                if let product = result.retrievedProducts.first {
                    yPrice = product.localizedPrice!
                    if third == "com.metaldetector.1yetr" {
                        self.thirdBottomLabel?.attributedText = noActiveBottom(yPrice, local.subscribeYearly)
                        self.thirdSelectedBottomLabel?.attributedText = activeBottom(yPrice, local.subscribeYearly)
                    } else if third == "com.metaldetector.1motr" {
                        self.thirdBottomLabel?.attributedText = noActiveBottom(yPrice, local.subscribeMonthly)
                        self.thirdSelectedBottomLabel?.attributedText = activeBottom(yPrice, local.subscribeMonthly)
                    } else if third == "com.metaldetector.1wetr" {
                        self.thirdBottomLabel?.attributedText = noActiveBottom(yPrice, local.subscribeWeekly)
                        self.thirdSelectedBottomLabel?.attributedText = activeBottom(yPrice, local.subscribeWeekly)
                    } else {
                        self.thirdBottomLabel?.text = yPrice
                        self.thirdSelectedBottomLabel?.text = yPrice
                    }
                }
            }
        }
        
        if self.first == "com.metaldetector.1wetr"{
            self.firstBottomLabel = Label(type: .subscribeBottomPLeft, wPrice + "\n")
            self.firstSelectedBottomLabel = Label(type: .subscribeBottomPLeftActive, wPrice + "\n")
            self.firstTopLabel = Label(type: .subscribeTop, local.subscribeFreeTrial)
            self.firstSelectedTopLabel = Label(type: .subscribeTopActive, local.subscribeFreeTrial)
        } else if self.first == "com.metaldetector.1yetr"{
            self.firstBottomLabel = Label(type: .subscribeBottomPMidle, yPrice + "\n")
            self.firstSelectedBottomLabel = Label(type: .subscribeBottomPMidleActive, yPrice + "\n")
            self.firstTopLabel = Label(type: .subscribeTop, local.subscribeFreeTrial)
            self.firstSelectedTopLabel = Label(type: .subscribeTopActive, local.subscribeFreeTrial)
        } else if self.first == "com.metaldetector.1motr"{
            self.firstBottomLabel = Label(type: .subscribeBottomPRight, mPrice + "\n")
            self.firstSelectedBottomLabel = Label(type: .subscribeBottomPRightActive, mPrice + "\n")
            self.firstTopLabel = Label(type: .subscribeTop, local.subscribeFreeTrial)
            self.firstSelectedTopLabel = Label(type: .subscribeTopActive, local.subscribeFreeTrial)
        } else if self.first == "com.metaldetector.1we"{
            self.firstBottomLabel = Label(type: .priceBot, wPrice)
            self.firstSelectedBottomLabel = Label(type: .priceBotActive, wPrice)
            self.firstTopLabel = Label(type: .dayTop, local.subscribeWeekly.uppercased())
            self.firstSelectedTopLabel = Label(type: .dayTopActive, local.subscribeWeekly.uppercased())
        } else if self.first == "com.metaldetector.1ye"{
            self.firstBottomLabel = Label(type: .priceBot, yPrice)
            self.firstSelectedBottomLabel = Label(type: .priceBotActive, yPrice)
            self.firstTopLabel = Label(type: .dayTop, local.subscribeYearly.uppercased())
            self.firstSelectedTopLabel = Label(type: .dayTopActive, local.subscribeYearly.uppercased())
        } else if self.first == "com.metaldetector.1mo"{
            self.firstBottomLabel = Label(type: .priceBot, mPrice)
            self.firstSelectedBottomLabel = Label(type: .priceBotActive, mPrice)
            self.firstTopLabel = Label(type: .dayTop, local.subscribeMonthly.uppercased())
            self.firstSelectedTopLabel = Label(type: .dayTopActive, local.subscribeMonthly.uppercased())
        }
        
        
        if self.second == "com.metaldetector.1wetr"{
            self.secondBottomLabel = Label(type: .subscribeBottomPLeft, wPrice + "\n")
            self.secondSelectedBottomLabel = Label(type: .subscribeBottomPLeftActive, wPrice + "\n")
            self.secondTopLabel = Label(type: .subscribeTop, local.subscribeFreeTrial)
            self.secondSelectedTopLabel = Label(type: .subscribeTopActive, local.subscribeFreeTrial)
        } else if self.second == "com.metaldetector.1yetr"{
            self.secondBottomLabel = Label(type: .subscribeBottomPMidle, yPrice + "\n")
            self.secondSelectedBottomLabel = Label(type: .subscribeBottomPMidleActive, yPrice + "\n")
            self.secondTopLabel = Label(type: .subscribeTop, local.subscribeFreeTrial)
            self.secondSelectedTopLabel = Label(type: .subscribeTopActive, local.subscribeFreeTrial)
        } else if self.second == "com.metaldetector.1motr"{
            self.secondBottomLabel = Label(type: .subscribeBottomPRight, mPrice + "\n")
            self.secondSelectedBottomLabel = Label(type: .subscribeBottomPRightActive, mPrice + "\n")
            self.secondTopLabel = Label(type: .subscribeTop, local.subscribeFreeTrial)
            self.secondSelectedTopLabel = Label(type: .subscribeTopActive, local.subscribeFreeTrial)
        } else if self.second == "com.metaldetector.1we"{
            self.secondBottomLabel = Label(type: .priceBot, wPrice)
            self.secondSelectedBottomLabel = Label(type: .priceBotActive, wPrice)
            self.secondTopLabel = Label(type: .dayTop, local.subscribeWeekly.uppercased())
            self.secondSelectedTopLabel = Label(type: .dayTopActive, local.subscribeWeekly.uppercased())
        } else if self.second == "com.metaldetector.1ye"{
            self.secondBottomLabel = Label(type: .priceBot, yPrice)
            self.secondSelectedBottomLabel = Label(type: .priceBotActive, yPrice)
            self.secondTopLabel = Label(type: .dayTop, local.subscribeYearly.uppercased())
            self.secondSelectedTopLabel = Label(type: .dayTopActive, local.subscribeYearly.uppercased())
        } else if self.second == "com.metaldetector.1mo"{
            self.secondBottomLabel = Label(type: .priceBot, mPrice)
            self.secondSelectedBottomLabel = Label(type: .priceBotActive, mPrice)
            self.secondTopLabel = Label(type: .dayTop, local.subscribeMonthly.uppercased())
            self.secondSelectedTopLabel = Label(type: .dayTopActive, local.subscribeMonthly.uppercased())
        }
        
        
        if self.third == "com.metaldetector.1wetr"{
            self.thirdBottomLabel = Label(type: .subscribeBottomPLeft, wPrice + "\n")
            self.thirdSelectedBottomLabel = Label(type: .subscribeBottomPLeftActive, wPrice + "\n")
            self.thirdTopLabel = Label(type: .subscribeTop, local.subscribeFreeTrial)
            self.thirdSelectedTopLabel = Label(type: .subscribeTopActive, local.subscribeFreeTrial)
        } else if self.third == "com.metaldetector.1yetr"{
            self.thirdBottomLabel = Label(type: .subscribeBottomPMidle, yPrice + "\n")
            self.thirdSelectedBottomLabel = Label(type: .subscribeBottomPMidleActive, yPrice + "\n")
            self.thirdTopLabel = Label(type: .subscribeTop, local.subscribeFreeTrial)
            self.thirdSelectedTopLabel = Label(type: .subscribeTopActive, local.subscribeFreeTrial)
        } else if self.third == "com.metaldetector.1motr"{
            self.thirdBottomLabel = Label(type: .subscribeBottomPRight, mPrice + "\n")
            self.thirdSelectedBottomLabel = Label(type: .subscribeBottomPRightActive, mPrice + "\n")
            self.thirdTopLabel = Label(type: .subscribeTop, local.subscribeFreeTrial)
            self.thirdSelectedTopLabel = Label(type: .subscribeTopActive, local.subscribeFreeTrial)
        } else if self.third == "com.metaldetector.1we"{
            self.thirdBottomLabel = Label(type: .priceBot, wPrice)
            self.thirdSelectedBottomLabel = Label(type: .priceBotActive, wPrice)
            self.thirdTopLabel = Label(type: .dayTop, local.subscribeWeekly.uppercased())
            self.thirdSelectedTopLabel = Label(type: .dayTopActive, local.subscribeWeekly.uppercased())
        } else if self.third == "com.metaldetector.1ye"{
            self.thirdBottomLabel = Label(type: .priceBot, yPrice)
            self.thirdSelectedBottomLabel = Label(type: .priceBotActive, yPrice)
            self.thirdTopLabel = Label(type: .dayTop, local.subscribeYearly.uppercased())
            self.thirdSelectedTopLabel = Label(type: .dayTopActive, local.subscribeYearly.uppercased())
        } else if self.third == "com.metaldetector.1mo"{
            self.thirdBottomLabel = Label(type: .priceBot, mPrice)
            self.thirdSelectedBottomLabel = Label(type: .priceBotActive, mPrice)
            self.thirdTopLabel = Label(type: .dayTop, local.subscribeMonthly.uppercased())
            self.thirdSelectedTopLabel = Label(type: .dayTopActive, local.subscribeMonthly.uppercased())
        }
        
        self.setup()
        self.setupLogic()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
