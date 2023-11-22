//
//  SecondSubscribeLogic.swift
//  BuilderHelper
//
//  Created by Kirill Sedliarov on 12.11.22.
//

import Foundation
import UIKit

extension SecondSubscribeViewController {
    
    func activeBottom(_ text: String, _ period: String) -> NSMutableAttributedString {
        let attString = NSMutableAttributedString()
        
        let header = NSAttributedString(
            string: text + "\n",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white,
                         NSAttributedString.Key.font: UIFont.rounded(ofSize: 22, weight: .semibold)]
        )
        let wayText = NSAttributedString(
            string: period,
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white,
                         NSAttributedString.Key.font: UIFont.rounded(ofSize: 17, weight: .light)]
        )
        
        attString.append(header)
        attString.append(wayText)
        
        return attString
    }
    
    func noActiveBottom(_ text: String, _ period: String) -> NSMutableAttributedString {
        let attString = NSMutableAttributedString()
        
        let header = NSAttributedString(
            string: text + "\n",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white,
                         NSAttributedString.Key.font: UIFont.rounded(ofSize: 18, weight: .semibold)]
        )
        let wayText = NSAttributedString(
            string: period,
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white,
                         NSAttributedString.Key.font: UIFont.rounded(ofSize: 13, weight: .light)]
        )
        
        attString.append(header)
        attString.append(wayText)
        
        return attString
    }
    
    @objc func sub() {
        if subs != ""{
            switch subs {
            case "com.metaldetector.1wetr": swifty.purchase(purchase: .weekTrial)
            case "com.metaldetector.1motr": swifty.purchase(purchase: .mounthTrial)
            case "com.metaldetector.1yetr": swifty.purchase(purchase: .yearTrial)
            case "com.metaldetector.1we": swifty.purchase(purchase: .week)
            case "com.metaldetector.1mo": swifty.purchase(purchase: .mounth)
            case "com.metaldetector.1ye": swifty.purchase(purchase: .year)
            default:
                print("subError")
            }
            view.isUserInteractionEnabled = false
            let subV = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
            subV.backgroundColor = UIColor(named: "subView")
            self.view.addSubview(subV)
            self.view.bringSubviewToFront(spiner)
            spiner.startAnimating()
            let _ = Timer.scheduledTimer(withTimeInterval: 7, repeats: false) { Timer in
                self.spiner.stopAnimating()
                subV.removeFromSuperview()
                self.view.isUserInteractionEnabled = true
            }
        }
    }
    
    @objc func restoreTarget() {
        IAPManager.shared.restorePurchases()
    }
    
    @objc func fingerTapGrad() {
        continueButton.setTitleColor(.white, for: .normal)
    }
    
    @objc func defaultButtonGradState() {
        continueButton.setTitleColor(.black, for: .normal)
    }
    
    @objc func firstSub() {
        
        subs = first
        
        firstSelectedSubView.isHidden = false
        firstSelectedTopLabel!.isHidden = false
        firstSelectedBottomLabel!.isHidden = false
        
        secondSubView.isHidden = false
        
        secondSelectedSubView.isHidden = true
        secondSelectedTopLabel!.isHidden = true
        secondSelectedBottomLabel!.isHidden = true
        
        thirdSelectedSubView.isHidden = true
        thirdSelectedTopLabel!.isHidden = true
        thirdSelectedBottomLabel!.isHidden = true
        
        let constraint = [
            secondSubView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -UIScreen.main.bounds.height / 4.5363),
            secondSubView.leadingAnchor.constraint(equalTo: firstSelectedSubView.trailingAnchor, constant: 8),
            secondSubView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 6.1984),
            secondSubView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 3.7128),
            
            secondTopLabel!.heightAnchor.constraint(equalTo: secondSubView.heightAnchor, multiplier: 0.5),
            secondTopLabel!.centerXAnchor.constraint(equalTo: secondSubView.centerXAnchor),
            secondTopLabel!.widthAnchor.constraint(equalTo: secondSubView.widthAnchor),
            
            secondSubPlace.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 12.3969),
            secondSubPlace.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 3.7128),
            
            secondBottomLabel!.heightAnchor.constraint(equalTo: secondSubView.heightAnchor, multiplier: 1.5),
            secondBottomLabel!.centerXAnchor.constraint(equalTo: secondSubView.centerXAnchor),
            secondBottomLabel!.widthAnchor.constraint(equalTo: secondSubView.widthAnchor),
        ]
        
        let constraintBig = [
            secondSubView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -UIScreen.main.bounds.height / 4.5363),
            secondSubView.trailingAnchor.constraint(equalTo: thirdSubView.leadingAnchor, constant: -50),
            secondSubView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 6.1984),
            secondSubView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 3.7128),
            
            secondTopLabel!.heightAnchor.constraint(equalTo: secondSubView.heightAnchor, multiplier: 0.5),
            secondTopLabel!.centerXAnchor.constraint(equalTo: secondSubView.centerXAnchor),
            secondTopLabel!.widthAnchor.constraint(equalTo: secondSubView.widthAnchor),
            
            secondSubPlace.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 12.3969),
            secondSubPlace.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 3.7128),
            
            secondBottomLabel!.heightAnchor.constraint(equalTo: secondSubView.heightAnchor, multiplier: 1.5),
            secondBottomLabel!.centerXAnchor.constraint(equalTo: secondSubView.centerXAnchor),
            secondBottomLabel!.widthAnchor.constraint(equalTo: secondSubView.widthAnchor),
        ]
        
        let constraintMiddle = [
            secondSubView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -UIScreen.main.bounds.height / 4.5363),
            secondSubView.trailingAnchor.constraint(equalTo: thirdSubView.leadingAnchor, constant: -25),
            secondSubView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 6.1984),
            secondSubView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 3.7128),
            
            secondTopLabel!.heightAnchor.constraint(equalTo: secondSubView.heightAnchor, multiplier: 0.5),
            secondTopLabel!.centerXAnchor.constraint(equalTo: secondSubView.centerXAnchor),
            secondTopLabel!.widthAnchor.constraint(equalTo: secondSubView.widthAnchor),
            
            secondSubPlace.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 12.3969),
            secondSubPlace.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 3.7128),
            
            secondBottomLabel!.heightAnchor.constraint(equalTo: secondSubView.heightAnchor, multiplier: 1.5),
            secondBottomLabel!.centerXAnchor.constraint(equalTo: secondSubView.centerXAnchor),
            secondBottomLabel!.widthAnchor.constraint(equalTo: secondSubView.widthAnchor),
        ]
        
        secondSubView.deactivateAllConstraints()
        
        if UIScreen.main.bounds.width > 830 {
            NSLayoutConstraint.activate(constraintBig)
        } else if UIScreen.main.bounds.width < 830 && UIScreen.main.bounds.width > 500 {
            NSLayoutConstraint.activate(constraintMiddle)
        } else {
            NSLayoutConstraint.activate(constraint)
        }
        
    }
    
    @objc func secondSub() {
        
        subs = second
        
        firstSelectedSubView.isHidden = true
        firstSelectedTopLabel!.isHidden = true
        firstSelectedBottomLabel!.isHidden = true
        
        secondSubView.isHidden = true
        
        secondSelectedSubView.isHidden = false
        secondSelectedTopLabel!.isHidden = false
        secondSelectedBottomLabel!.isHidden = false
        
        thirdSelectedSubView.isHidden = true
        thirdSelectedTopLabel!.isHidden = true
        thirdSelectedBottomLabel!.isHidden = true
        
    }
    
    @objc func thirdSub() {
        
        subs = third
        
        secondSubView.isHidden = false
        
        firstSelectedSubView.isHidden = true
        firstSelectedTopLabel!.isHidden = true
        firstSelectedBottomLabel!.isHidden = true
        
        secondSelectedSubView.isHidden = true
        secondSelectedTopLabel!.isHidden = true
        secondSelectedBottomLabel!.isHidden = true
        
        thirdSelectedSubView.isHidden = false
        thirdSelectedTopLabel!.isHidden = false
        thirdSelectedBottomLabel!.isHidden = false
        
        let constraint = [
            secondSubView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -UIScreen.main.bounds.height / 4.5363),
            secondSubView.trailingAnchor.constraint(equalTo: thirdSelectedSubView.leadingAnchor, constant: -8),
            secondSubView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 6.1984),
            secondSubView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 3.7128),
            
            secondTopLabel!.heightAnchor.constraint(equalTo: secondSubView.heightAnchor, multiplier: 0.5),
            secondTopLabel!.centerXAnchor.constraint(equalTo: secondSubView.centerXAnchor),
            secondTopLabel!.widthAnchor.constraint(equalTo: secondSubView.widthAnchor),
            
            secondSubPlace.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 12.3969),
            secondSubPlace.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 3.7128),
            
            secondBottomLabel!.heightAnchor.constraint(equalTo: secondSubView.heightAnchor, multiplier: 1.5),
            secondBottomLabel!.centerXAnchor.constraint(equalTo: secondSubView.centerXAnchor),
            secondBottomLabel!.widthAnchor.constraint(equalTo: secondSubView.widthAnchor),
        ]
        
        let constraintBig = [
            secondSubView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -UIScreen.main.bounds.height / 4.5363),
            secondSubView.leadingAnchor.constraint(equalTo: firstSubView.trailingAnchor, constant: 50),
            secondSubView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 6.1984),
            secondSubView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 3.7128),
            
            secondTopLabel!.heightAnchor.constraint(equalTo: secondSubView.heightAnchor, multiplier: 0.5),
            secondTopLabel!.centerXAnchor.constraint(equalTo: secondSubView.centerXAnchor),
            secondTopLabel!.widthAnchor.constraint(equalTo: secondSubView.widthAnchor),
            
            secondSubPlace.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 12.3969),
            secondSubPlace.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 3.7128),
            
            secondBottomLabel!.heightAnchor.constraint(equalTo: secondSubView.heightAnchor, multiplier: 1.5),
            secondBottomLabel!.centerXAnchor.constraint(equalTo: secondSubView.centerXAnchor),
            secondBottomLabel!.widthAnchor.constraint(equalTo: secondSubView.widthAnchor),
        ]
        
        let constraintMiddle = [
            secondSubView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -UIScreen.main.bounds.height / 4.5363),
            secondSubView.leadingAnchor.constraint(equalTo: firstSubView.trailingAnchor, constant: 25),
            secondSubView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 6.1984),
            secondSubView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 3.7128),
            
            secondTopLabel!.heightAnchor.constraint(equalTo: secondSubView.heightAnchor, multiplier: 0.5),
            secondTopLabel!.centerXAnchor.constraint(equalTo: secondSubView.centerXAnchor),
            secondTopLabel!.widthAnchor.constraint(equalTo: secondSubView.widthAnchor),
            
            secondSubPlace.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 12.3969),
            secondSubPlace.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 3.7128),
            
            secondBottomLabel!.heightAnchor.constraint(equalTo: secondSubView.heightAnchor, multiplier: 1.5),
            secondBottomLabel!.centerXAnchor.constraint(equalTo: secondSubView.centerXAnchor),
            secondBottomLabel!.widthAnchor.constraint(equalTo: secondSubView.widthAnchor),
        ]
        
        secondSubView.deactivateAllConstraints()
        
        if UIScreen.main.bounds.width > 830 {
            NSLayoutConstraint.activate(constraintBig)
        } else if UIScreen.main.bounds.width < 830 && UIScreen.main.bounds.width > 500 {
            NSLayoutConstraint.activate(constraintMiddle)
        } else {
            NSLayoutConstraint.activate(constraint)
        }
        
    }
    
    @objc func closeTarget() {
        dismiss(animated: true)
        NotificationCenter.default.post(name: Notification.Name("reload"), object: nil)
    }
    
    @objc func methodOfReceivedNotification(notification: Notification) {
        dismiss(animated: true)
        NotificationCenter.default.post(name: Notification.Name("reload"), object: nil)
    }
    
}
