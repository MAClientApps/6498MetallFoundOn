//
//  ButtonEx.swift
//  BuilderHelper
//
//  Created by Kirill Sedliarov on 6.11.22.
//

import Foundation
import UIKit

class Button: UIButton {
    
    enum ButtonType {
        case startStopButton
        case circle
        case subscribeContinue
        case closeButton
        case restoreButton
        case chevron
        case doneButton
        case alertB
    }
    
    init(type: ButtonType, _ text: String?) {
        
        super.init(frame: .zero)
        self.setTitle(text, for: .normal)
        
        translatesAutoresizingMaskIntoConstraints = false
        
        switch type {
            
        case .alertB:
            setTitle(text, for: .normal)
            setTitleColor(UIColor(named: "orange"), for: .normal)
            backgroundColor = .clear
            //tintColor = UIColor(named: "orange")
    
            case .startStopButton:
                backgroundColor = .lightGray
            case .circle:
                backgroundColor = .lightGray
                layer.cornerRadius = 15
            case .subscribeContinue:
                setTitle(text, for: .normal)
                setTitleColor(UIColor.black, for: .normal)
                backgroundColor = UIColor(named: "orange")
                layer.cornerRadius = 14
            titleLabel?.font =  UIFont.systemFont(ofSize: 17, weight: .semibold)
            case .closeButton:
                setImage(UIImage(systemName: "xmark"), for: .normal)
                tintColor = UIColor(named: "orange")
                backgroundColor = .clear
            
                
            case .restoreButton:
                setTitle(text, for: .normal)
                setTitleColor(UIColor(named: "orange"), for: .normal)
                backgroundColor = .clear
            
        case .chevron:
            setImage(UIImage(systemName: "chevron.left"), for: .normal)
            tintColor = UIColor(named: "orange")
            widthAnchor.constraint(equalToConstant: 30).isActive = true
            heightAnchor.constraint(equalToConstant: 30).isActive = true
            
        case .doneButton:
            setTitle(text, for: .normal)
            setTitleColor(UIColor(named: "orange"), for: .normal)

        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
