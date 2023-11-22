//
//  TextEx.swift
//  BuilderHelper
//
//  Created by Kirill Sedliarov on 6.11.22.
//

import Foundation
import UIKit

class Label: UILabel {
    
    enum LabelType {
        case ads
        case xyzLabel
        case pageTitle
        case protractorLabel
        case boardingHeader
        case subscribeHeader
        case subscribeTitle
        case subscribeTop
        case subscribeTopActive
        case subscribeTopPMidle
        case subscribeTopPMidleActive
        case subscribeTopPLeft
        case subscribeTopPLeftActive
        case subscribeTopPRight
        case subscribeTopPRightActive
        case subscribeBottomPMidle
        case subscribeBottomPMidleActive
        case subscribeBottomPLeft
        case subscribeBottomPLeftActive
        case subscribeBottomPRight
        case subscribeBottomPRightActive
        case subscribeBottom
        case subscribeBottomActive
        case sliderLabel
        case folderDismiss
        case mainText
        case alertRate
        case alertMove
        case alertPermDenied
        case alertRestore
        case alertRestoreDiscription
        case restore
        case priceBot
        case priceBotActive
        case priceTop
        case priceTopActive
        case dayBot
        case dayBotActive
        case dayTop
        case dayTopActive
    }
    
    let local = LocalizationVariables()
    
    var paragraphStyle = NSMutableParagraphStyle()
    
    init(type: LabelType, _ text: String?) {
        
        super.init(frame: .zero)
        self.text = text
        translatesAutoresizingMaskIntoConstraints = false
        
        switch type {
        case .ads:
            textColor = .white
            font = UIFont.systemFont(ofSize: 37, weight: .semibold)
            textAlignment = .center
            centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
            centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        case .restore:
            textColor = UIColor(named: "orange")
            font = UIFont.systemFont(ofSize: 17, weight: .regular)
        case .alertRate:
            font = UIFont.systemFont(ofSize: 17, weight: .semibold)
            textAlignment = .center
            textColor = .white
            numberOfLines = 0
        case .alertMove:
            font = UIFont.systemFont(ofSize: 13, weight: .regular)
            textAlignment = .center
            paragraphStyle.lineHeightMultiple = 1.42
            paragraphStyle.alignment = .center
            textColor = .white
            numberOfLines = 0
            attributedText = NSMutableAttributedString(string: local.alertMove, attributes: [NSAttributedString.Key.kern: -0.41, NSAttributedString.Key.paragraphStyle: paragraphStyle])
        case .alertPermDenied:
            font = UIFont.systemFont(ofSize: 13, weight: .regular)
            textAlignment = .center
            paragraphStyle.lineHeightMultiple = 1.42
            paragraphStyle.alignment = .center
            textColor = .white
            numberOfLines = 0
            attributedText = NSMutableAttributedString(string: local.alertPermissionDenied, attributes: [NSAttributedString.Key.kern: -0.41, NSAttributedString.Key.paragraphStyle: paragraphStyle])
        case .xyzLabel:
            font = UIFont.systemFont(ofSize: 24, weight: .medium)
            textAlignment = .left
            textColor = .black
            numberOfLines = 0
        case .pageTitle:
            font = UIFont.systemFont(ofSize: 20, weight: .semibold)
            textAlignment = .center
            textColor = .white
            numberOfLines = 0
        case .protractorLabel:
            font = UIFont.systemFont(ofSize: 32, weight: .semibold)
            textAlignment = .center
            textColor = .white
            numberOfLines = 0
        case .boardingHeader:
            font = UIFont.rounded(ofSize: 36, weight: .semibold)
            textAlignment = .center
            textColor = .white
            numberOfLines = 0
            lineBreakMode = .byWordWrapping
            centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
            widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 40).isActive = true
        case .subscribeHeader:
            font = UIFont.rounded(ofSize: 36, weight: .semibold)
            textAlignment = .center
            textColor = UIColor(named: "orange")
            numberOfLines = 0
            lineBreakMode = .byWordWrapping
        case .subscribeTitle:
            font = UIFont.rounded(ofSize: 20, weight: .regular)
            textAlignment = .center
            textColor = .white
            numberOfLines = 0
        case .subscribeTopPMidle:
            let attString = NSMutableAttributedString()
            let header = NSAttributedString(
                string: text!,
                attributes: [NSAttributedString.Key.foregroundColor: UIColor.white,
                             NSAttributedString.Key.font: UIFont.rounded(ofSize: 12, weight: .medium)]
            )
            let wayText = NSAttributedString(
                string: local.subscribeYearly.uppercased(),
                attributes: [NSAttributedString.Key.foregroundColor: UIColor.white,
                             NSAttributedString.Key.font: UIFont.rounded(ofSize: 14, weight: .medium)]
            )
            attString.append(header)
            attString.append(wayText)
            attributedText = attString
            textAlignment = .center
            textColor = .white
            numberOfLines = 0
        case .subscribeTopPMidleActive:
            let attString = NSMutableAttributedString()
            let header = NSAttributedString(
                string: text!,
                attributes: [NSAttributedString.Key.foregroundColor: UIColor.white,
                             NSAttributedString.Key.font: UIFont.rounded(ofSize: 13, weight: .medium)]
            )
            let wayText = NSAttributedString(
                string: local.subscribeYearly.uppercased(),
                attributes: [NSAttributedString.Key.foregroundColor: UIColor.white,
                             NSAttributedString.Key.font: UIFont.rounded(ofSize: 16, weight: .medium)]
            )
            attString.append(header)
            attString.append(wayText)
            attributedText = attString
            textAlignment = .center
            textColor = .white
            numberOfLines = 0
        case .subscribeTopPLeft:
            let attString = NSMutableAttributedString()
            let header = NSAttributedString(
                string: text!,
                attributes: [NSAttributedString.Key.foregroundColor: UIColor.white,
                             NSAttributedString.Key.font: UIFont.rounded(ofSize: 12, weight: .medium)]
            )
            let wayText = NSAttributedString(
                string: local.subscribeWeekly.uppercased(),
                attributes: [NSAttributedString.Key.foregroundColor: UIColor.white,
                             NSAttributedString.Key.font: UIFont.rounded(ofSize: 14, weight: .medium)]
            )
            attString.append(header)
            attString.append(wayText)
            attributedText = attString
            textAlignment = .center
            textColor = .white
            numberOfLines = 0
        case .subscribeTopPLeftActive:
            let attString = NSMutableAttributedString()
            let header = NSAttributedString(
                string: text!,
                attributes: [NSAttributedString.Key.foregroundColor: UIColor.white,
                             NSAttributedString.Key.font: UIFont.rounded(ofSize: 13, weight: .medium)]
            )
            let wayText = NSAttributedString(
                string: local.subscribeWeekly.uppercased(),
                attributes: [NSAttributedString.Key.foregroundColor: UIColor.white,
                             NSAttributedString.Key.font: UIFont.rounded(ofSize: 16, weight: .medium)]
            )
            attString.append(header)
            attString.append(wayText)
            attributedText = attString
            textAlignment = .center
            textColor = .white
            numberOfLines = 0
        case .subscribeTopPRight:
            let attString = NSMutableAttributedString()
            let header = NSAttributedString(
                string: text!,
                attributes: [NSAttributedString.Key.foregroundColor: UIColor.white,
                             NSAttributedString.Key.font: UIFont.rounded(ofSize: 12, weight: .medium)]
            )
            let wayText = NSAttributedString(
                string: local.subscribeMonthly.uppercased(),
                attributes: [NSAttributedString.Key.foregroundColor: UIColor.white,
                             NSAttributedString.Key.font: UIFont.rounded(ofSize: 14, weight: .medium)]
            )
            attString.append(header)
            attString.append(wayText)
            attributedText = attString
            textAlignment = .center
            textColor = .white
            numberOfLines = 0
        case .subscribeTopPRightActive:
            let attString = NSMutableAttributedString()
            let header = NSAttributedString(
                string: text!,
                attributes: [NSAttributedString.Key.foregroundColor: UIColor.white,
                             NSAttributedString.Key.font: UIFont.rounded(ofSize: 13, weight: .medium)]
            )
            let wayText = NSAttributedString(
                string: local.subscribeMonthly.uppercased(),
                attributes: [NSAttributedString.Key.foregroundColor: UIColor.white,
                             NSAttributedString.Key.font: UIFont.rounded(ofSize: 16, weight: .medium)]
            )
            attString.append(header)
            attString.append(wayText)
            attributedText = attString
            textAlignment = .center
            textColor = .white
            numberOfLines = 0
        case .subscribeBottomPMidle:
            let attString = NSMutableAttributedString()
            let header = NSAttributedString(
                string: text!,
                attributes: [NSAttributedString.Key.foregroundColor: UIColor.white,
                             NSAttributedString.Key.font: UIFont.rounded(ofSize: 18, weight: .semibold)]
            )
            let wayText = NSAttributedString(
                string: local.subscribeYearly,
                attributes: [NSAttributedString.Key.foregroundColor: UIColor.white,
                             NSAttributedString.Key.font: UIFont.rounded(ofSize: 13, weight: .light)]
            )
            attString.append(header)
            attString.append(wayText)
            attributedText = attString
            textAlignment = .center
            textColor = .white
            numberOfLines = 0
        case .subscribeBottomPMidleActive:
            let attString = NSMutableAttributedString()
            let header = NSAttributedString(
                string: text!,
                attributes: [NSAttributedString.Key.foregroundColor: UIColor.white,
                             NSAttributedString.Key.font: UIFont.rounded(ofSize: 22, weight: .semibold)]
            )
            let wayText = NSAttributedString(
                string: local.subscribeYearly,
                attributes: [NSAttributedString.Key.foregroundColor: UIColor.white,
                             NSAttributedString.Key.font: UIFont.rounded(ofSize: 17, weight: .light)]
            )
            attString.append(header)
            attString.append(wayText)
            attributedText = attString
            textAlignment = .center
            textColor = .white
            numberOfLines = 0
        case .subscribeBottomPLeft:
            let attString = NSMutableAttributedString()
            let header = NSAttributedString(
                string: text!,
                attributes: [NSAttributedString.Key.foregroundColor: UIColor.white,
                             NSAttributedString.Key.font: UIFont.rounded(ofSize: 18, weight: .semibold)]
            )
            let wayText = NSAttributedString(
                string: local.subscribeWeekly,
                attributes: [NSAttributedString.Key.foregroundColor: UIColor.white,
                             NSAttributedString.Key.font: UIFont.rounded(ofSize: 13, weight: .light)]
            )
            attString.append(header)
            attString.append(wayText)
            attributedText = attString
            textAlignment = .center
            textColor = .white
            numberOfLines = 0
        case .subscribeBottomPLeftActive:
            let attString = NSMutableAttributedString()
            let header = NSAttributedString(
                string: text!,
                attributes: [NSAttributedString.Key.foregroundColor: UIColor.white,
                             NSAttributedString.Key.font: UIFont.rounded(ofSize: 22, weight: .semibold)]
            )
            let wayText = NSAttributedString(
                string: local.subscribeWeekly,
                attributes: [NSAttributedString.Key.foregroundColor: UIColor.white,
                             NSAttributedString.Key.font: UIFont.rounded(ofSize: 17, weight: .light)]
            )
            attString.append(header)
            attString.append(wayText)
            attributedText = attString
            textAlignment = .center
            textColor = .white
            numberOfLines = 0
        case .subscribeBottomPRight:
            let attString = NSMutableAttributedString()
            let header = NSAttributedString(
                string: text!,
                attributes: [NSAttributedString.Key.foregroundColor: UIColor.white,
                             NSAttributedString.Key.font: UIFont.rounded(ofSize: 18, weight: .semibold)]
            )
            let wayText = NSAttributedString(
                string: local.subscribeMonthly,
                attributes: [NSAttributedString.Key.foregroundColor: UIColor.white,
                             NSAttributedString.Key.font: UIFont.rounded(ofSize: 13, weight: .light)]
            )
            attString.append(header)
            attString.append(wayText)
            attributedText = attString
            textAlignment = .center
            textColor = .white
            numberOfLines = 0
        case .subscribeBottomPRightActive:
            let attString = NSMutableAttributedString()
            let header = NSAttributedString(
                string: text!,
                attributes: [NSAttributedString.Key.foregroundColor: UIColor.white,
                             NSAttributedString.Key.font: UIFont.rounded(ofSize: 22, weight: .semibold)]
            )
            let wayText = NSAttributedString(
                string: local.subscribeMonthly,
                attributes: [NSAttributedString.Key.foregroundColor: UIColor.white,
                             NSAttributedString.Key.font: UIFont.rounded(ofSize: 17, weight: .light)]
            )
            attString.append(header)
            attString.append(wayText)
            attributedText = attString
            textAlignment = .center
            textColor = .white
            numberOfLines = 0
        case .subscribeTop:
            font = UIFont.rounded(ofSize: 14, weight: .medium)
            textAlignment = .center
            textColor = .white
            numberOfLines = 0
        case .subscribeTopActive:
            font = UIFont.rounded(ofSize: 16, weight: .medium)
            textAlignment = .center
            textColor = .white
            numberOfLines = 0
        case .subscribeBottom:
            font = UIFont.rounded(ofSize: 16, weight: .semibold)
            textAlignment = .center
            textColor = .white
            numberOfLines = 0
        case .subscribeBottomActive:
            font = UIFont.rounded(ofSize: 20, weight: .semibold)
            textAlignment = .center
            textColor = .white
            numberOfLines = 0
        case .sliderLabel:
            font = UIFont.systemFont(ofSize: 15, weight: .regular)
            textAlignment = .center
            textColor = .white
        case .folderDismiss:
            font = UIFont.systemFont(ofSize: 17, weight: .regular)
            textColor = UIColor(named: "orange")
            textAlignment = .left
        case .mainText:
            font = UIFont.systemFont(ofSize: 17, weight: .regular)
            textColor = .white
            textAlignment = .left
        case .alertRestore:
            font = UIFont.systemFont(ofSize: 17, weight: .semibold)
            textAlignment = .center
            textColor = .white
            numberOfLines = 0
        case .alertRestoreDiscription:
            font = UIFont.systemFont(ofSize: 13, weight: .regular)
            textAlignment = .center
            paragraphStyle.lineHeightMultiple = 1.42
            paragraphStyle.alignment = .center
            textColor = .white
            numberOfLines = 0
            attributedText = NSMutableAttributedString(string: local.alertRestoreDiscription, attributes: [NSAttributedString.Key.kern: -0.41, NSAttributedString.Key.paragraphStyle: paragraphStyle])
        case .priceBot:
            font = UIFont.rounded(ofSize: 18, weight: .semibold)
            textAlignment = .center
            textColor = .white
            numberOfLines = 0
        case .priceBotActive:
            font = UIFont.rounded(ofSize: 22, weight: .semibold)
            textAlignment = .center
            textColor = .white
            numberOfLines = 0
        case .priceTop:
            font = UIFont.rounded(ofSize: 16, weight: .medium)
            textAlignment = .center
            textColor = .white
            numberOfLines = 0
        case .priceTopActive:
            font = UIFont.rounded(ofSize: 20, weight: .medium)
            textAlignment = .center
            textColor = .white
            numberOfLines = 0
        case .dayBot:
            font = UIFont.rounded(ofSize: 16, weight: .semibold)
            textAlignment = .center
            textColor = .white
            numberOfLines = 0
        case .dayBotActive:
            font = UIFont.rounded(ofSize: 20, weight: .semibold)
            textAlignment = .center
            textColor = .white
            numberOfLines = 0
        case .dayTop:
            font = UIFont.rounded(ofSize: 14, weight: .medium)
            textAlignment = .center
            textColor = .white
            numberOfLines = 0
        case .dayTopActive:
            font = UIFont.rounded(ofSize: 16, weight: .medium)
            textAlignment = .center
            textColor = .white
            numberOfLines = 0
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension UIFont {
    class func rounded(ofSize size: CGFloat, weight: UIFont.Weight) -> UIFont {
        let systemFont = UIFont.systemFont(ofSize: size, weight: weight)
        let font: UIFont
        
        if let descriptor = systemFont.fontDescriptor.withDesign(.rounded) {
            font = UIFont(descriptor: descriptor, size: size)
        } else {
            font = systemFont
        }
        return font
    }
}
