//
//  FirstSubOnBoardingUI.swift
//  BuilderHelper
//
//  Created by Kirill Sedliarov on 10.11.22.
//

import Foundation
import UIKit

extension FirstSubOnBoarding {
    
    func setup() {
        
        backgroundColor = UIColor(named: "background")
        mainImage.image = UIImage(named: "icons")
        
        //MARK: add Subview
        
        addSubview(header)
        addSubview(titleFirst)
        addSubview(titleSecond)
        
        addSubview(mainImage)
        
        addSubview(restoreView)
        addSubview(restoreLabel)
        addSubview(dismissView)
        addSubview(xmark)
        
        addSubview(firstSubView)
        firstSubView.addSubview(firstSubPlace)
        firstSubView.addSubview(firstTopLabel!)
        firstSubView.addSubview(firstBottomLabel!)
        
        
        addSubview(secondSubView)
        secondSubView.addSubview(secondSubPlace)
        secondSubView.addSubview(secondTopLabel!)
        secondSubView.addSubview(secondBottomLabel!)
        
        
        addSubview(thirdSubView)
        thirdSubView.addSubview(thirdSubPlace)
        thirdSubView.addSubview(thirdTopLabel!)
        thirdSubView.addSubview(thirdBottomLabel!)
        
        
        addSubview(firstSelectedSubView)
        firstSelectedSubView.addSubview(firstSelectedSubPlace)
        firstSelectedSubView.addSubview(firstSelectedTopLabel!)
        firstSelectedSubView.addSubview(firstSelectedBottomLabel!)
        
        
        addSubview(secondSelectedSubView)
        secondSelectedSubView.addSubview(secondSelectedSubPlace)
        secondSelectedSubView.addSubview(secondSelectedTopLabel!)
        secondSelectedSubView.addSubview(secondSelectedBottomLabel!)
        
        
        addSubview(thirdSelectedSubView)
        thirdSelectedSubView.addSubview(thirdSelectedSubPlace)
        thirdSelectedSubView.addSubview(thirdSelectedTopLabel!)
        thirdSelectedSubView.addSubview(thirdSelectedBottomLabel!)
        
        
        
        firstSelectedSubView.isHidden = true
        firstSelectedTopLabel!.isHidden = true
        firstSelectedBottomLabel!.isHidden = true
        
        secondSubView.isHidden = true
        
        thirdSelectedSubView.isHidden = true
        thirdSelectedTopLabel!.isHidden = true
        thirdSelectedBottomLabel!.isHidden = true
        
        //MARK: Add target
        firstSubView.addGestureRecognizer(recognizeFirst)
        secondSubView.addGestureRecognizer(recognizeSecond)
        thirdSubView.addGestureRecognizer(recognizeThird)
        dismissView.addGestureRecognizer(dismissTap)
        restoreView.addGestureRecognizer(restoreTap)
        
        //MARK: Add constraint
        let constraint = [
            
            restoreView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 19),
            restoreView.leadingAnchor.constraint(equalTo: leadingAnchor),
            
            restoreLabel.centerYAnchor.constraint(equalTo: restoreView.centerYAnchor),
            restoreLabel.leadingAnchor.constraint(equalTo: restoreView.leadingAnchor, constant: 15),
            
            mainImage.topAnchor.constraint(equalTo: restoreLabel.bottomAnchor, constant: UIScreen.main.bounds.height / 12.6875),
            mainImage.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 9.2272),
            mainImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: UIScreen.main.bounds.width / 5.9524),
            mainImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -UIScreen.main.bounds.width / 5.9524),
            
            header.topAnchor.constraint(equalTo: mainImage.bottomAnchor, constant: UIScreen.main.bounds.height / 50.75),
            header.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            titleFirst.topAnchor.constraint(equalTo: header.bottomAnchor, constant: UIScreen.main.bounds.height / 25.375),
            titleFirst.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            titleSecond.topAnchor.constraint(equalTo: titleFirst.bottomAnchor, constant: UIScreen.main.bounds.height / 50.75),
            titleSecond.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            dismissView.centerYAnchor.constraint(equalTo: restoreView.centerYAnchor),
            dismissView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            xmark.centerYAnchor.constraint(equalTo: dismissView.centerYAnchor),
            xmark.trailingAnchor.constraint(equalTo: dismissView.trailingAnchor, constant: -15),
            
            firstSubView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -UIScreen.main.bounds.height / 4.5363),
            firstSubView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            firstSubView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 6.1984),
            firstSubView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 3.7128),
            
            firstSubPlace.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 12.3969),
            firstSubPlace.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 3.7128),
            
            firstTopLabel!.heightAnchor.constraint(equalTo: firstSubView.heightAnchor, multiplier: 0.5),
            firstTopLabel!.centerXAnchor.constraint(equalTo: firstSubView.centerXAnchor),
            firstTopLabel!.widthAnchor.constraint(equalTo: firstSubView.widthAnchor),
            
            firstBottomLabel!.heightAnchor.constraint(equalTo: firstSubView.heightAnchor, multiplier: 1.5),
            firstBottomLabel!.centerXAnchor.constraint(equalTo: firstSubView.centerXAnchor),
            firstBottomLabel!.widthAnchor.constraint(equalTo: firstSubView.widthAnchor),
            
            
            firstSelectedSubView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -UIScreen.main.bounds.height / 4.9512),            firstSelectedSubView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            firstSelectedSubView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 5.075),
            firstSelectedSubView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 2.9762),
            
            firstSelectedTopLabel!.heightAnchor.constraint(equalTo: firstSelectedSubView.heightAnchor, multiplier: 0.5),
            firstSelectedTopLabel!.centerXAnchor.constraint(equalTo: firstSelectedSubView.centerXAnchor),
            firstSelectedTopLabel!.widthAnchor.constraint(equalTo: firstSelectedSubView.widthAnchor),
            firstSelectedTopLabel!.centerYAnchor.constraint(equalTo: firstSelectedSubPlace.centerYAnchor),
            
            firstSelectedBottomLabel!.heightAnchor.constraint(equalTo: firstSelectedSubView.heightAnchor, multiplier: 1.4),
            firstSelectedBottomLabel!.centerXAnchor.constraint(equalTo: firstSelectedSubView.centerXAnchor),
            firstSelectedBottomLabel!.widthAnchor.constraint(equalTo: firstSelectedSubView.widthAnchor),
            
            firstSelectedSubPlace.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 11.6),
            firstSelectedSubPlace.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 2.9762),
            
            secondSubView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -UIScreen.main.bounds.height / 4.5363),
            secondSubView.leadingAnchor.constraint(equalTo: firstSubView.trailingAnchor, constant: 8),
            secondSubView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 6.1984),
            secondSubView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 3.7128),
            
            
            secondTopLabel!.heightAnchor.constraint(equalTo: secondSubView.heightAnchor, multiplier: 0.5),
            secondTopLabel!.centerXAnchor.constraint(equalTo: secondSubView.centerXAnchor),
            secondTopLabel!.widthAnchor.constraint(equalTo: secondSubView.widthAnchor),
            
            secondBottomLabel!.heightAnchor.constraint(equalTo: secondSubView.heightAnchor, multiplier: 1.5),
            secondBottomLabel!.centerXAnchor.constraint(equalTo: secondSubView.centerXAnchor),
            secondBottomLabel!.widthAnchor.constraint(equalTo: secondSubView.widthAnchor),
            
            secondSubPlace.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 12.3969),
            secondSubPlace.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 3.7128),
            
            secondSelectedSubView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -UIScreen.main.bounds.height / 4.9512),
            secondSelectedSubView.centerXAnchor.constraint(equalTo: centerXAnchor),
            secondSelectedSubView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 5.075),
            secondSelectedSubView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 2.9762),
            
            secondSelectedTopLabel!.heightAnchor.constraint(equalTo: secondSelectedSubView.heightAnchor, multiplier: 0.5),
            secondSelectedTopLabel!.centerXAnchor.constraint(equalTo: secondSelectedSubView.centerXAnchor),
            secondSelectedTopLabel!.widthAnchor.constraint(equalTo: secondSelectedSubView.widthAnchor),
            secondSelectedTopLabel!.centerYAnchor.constraint(equalTo: secondSelectedSubPlace.centerYAnchor),
            
            secondSelectedBottomLabel!.heightAnchor.constraint(equalTo: secondSelectedSubView.heightAnchor, multiplier: 1.4),
            secondSelectedBottomLabel!.centerXAnchor.constraint(equalTo: secondSelectedSubView.centerXAnchor),
            secondSelectedBottomLabel!.widthAnchor.constraint(equalTo: secondSelectedSubView.widthAnchor),
            
            secondSelectedSubPlace.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 11.6),
            secondSelectedSubPlace.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 2.9762),
            
         
            thirdSubView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -UIScreen.main.bounds.height / 4.5363),
            thirdSubView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            thirdSubView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 6.1984),
            thirdSubView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 3.7128),
            
            thirdTopLabel!.heightAnchor.constraint(equalTo: thirdSubView.heightAnchor, multiplier: 0.5),
            thirdTopLabel!.centerXAnchor.constraint(equalTo: thirdSubView.centerXAnchor),
            thirdTopLabel!.widthAnchor.constraint(equalTo: thirdSubView.widthAnchor),
            
            thirdBottomLabel!.heightAnchor.constraint(equalTo: thirdSubView.heightAnchor, multiplier: 1.5),
            thirdBottomLabel!.centerXAnchor.constraint(equalTo: thirdSubView.centerXAnchor),
            thirdBottomLabel!.widthAnchor.constraint(equalTo: thirdSubView.widthAnchor),
            
            thirdSubPlace.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 12.3969),
            thirdSubPlace.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 3.7128),
            
            thirdSelectedSubView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -UIScreen.main.bounds.height / 4.9512),
            thirdSelectedSubView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            thirdSelectedSubView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 5.075),
            thirdSelectedSubView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 2.9762),
            
            thirdSelectedSubPlace.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 11.6),
            thirdSelectedSubPlace.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 2.9762),
            
            
            thirdSelectedTopLabel!.heightAnchor.constraint(equalTo: thirdSelectedSubView.heightAnchor, multiplier: 0.5),
            thirdSelectedTopLabel!.centerXAnchor.constraint(equalTo: thirdSelectedSubView.centerXAnchor),
            thirdSelectedTopLabel!.widthAnchor.constraint(equalTo: thirdSelectedSubView.widthAnchor),
            thirdSelectedTopLabel!.centerYAnchor.constraint(equalTo: thirdSelectedSubPlace.centerYAnchor),
            
            thirdSelectedBottomLabel!.heightAnchor.constraint(equalTo: thirdSelectedSubView.heightAnchor, multiplier: 1.4),
            thirdSelectedBottomLabel!.centerXAnchor.constraint(equalTo: thirdSelectedSubView.centerXAnchor),
            thirdSelectedBottomLabel!.widthAnchor.constraint(equalTo: thirdSelectedSubView.widthAnchor),

        ]
        
        //MARK: Constraints
        NSLayoutConstraint.activate(constraint)
    }

}
