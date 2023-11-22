//
//  MetalSearchUI.swift
//  BuilderHelper
//
//  Created by Kirill Sedliarov on 6.11.22.
//

import Foundation
import UIKit

extension MetalSearchViewController{
    
    func setup(){
        
        pageTitle2.isHidden = true
        btnSetting2.isHidden = true
        view.addSubview(pageTitle)
        view.addSubview(pageTitle2)
        view.backgroundColor = UIColor(named: "background")
        view.addSubview(imageCLiner)
        view.addSubview(stackViewCenter)
        view.addSubview(imageLLiner)
        view.addSubview(stackViewLeft)
        view.addSubview(imageRLiner)
        view.addSubview(stackViewRight)
        view.addSubview(slider)
        view.addSubview(min)
        view.addSubview(medium)
        view.addSubview(max)
        view.addSubview(vads)
        
        if baner != nil {
            vads.addSubview(baner)
            pageTitle2.isHidden = true
            btnSetting2.isHidden = true
            pageTitle.isHidden = false
            btnSetting.isHidden = false
            NSLayoutConstraint.activate([
                baner.topAnchor.constraint(equalTo: vads.topAnchor),
                baner.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                
                pageTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: UIScreen.main.bounds.height / 10.175),
                pageTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                
            ])
        } else {
            pageTitle2.isHidden = false
            btnSetting2.isHidden = false
            pageTitle.isHidden = true
            btnSetting.isHidden = true
            pageTitle.removeConstraints()
            view.addSubview(pageTitle)
            pageTitle.backgroundColor = .red
            pageTitle.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([pageTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: UIScreen.main.bounds.height / 19.566),
                                         pageTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),])
        }

        
        
        view.addSubview(btnSetting)

        btnSetting.backgroundColor = UIColor(named: "background")
        btnSetting.setImage(UIImage(named: "gearshape.fill")!.withTintColor(UIColor(named: "orange")!), for: .normal)
        btnSetting.tintColor = UIColor(named: "orange")
        btnSetting.contentVerticalAlignment = .fill
        btnSetting.contentHorizontalAlignment = .fill
        btnSetting.addTarget(self, action: #selector(setting), for: .touchUpInside)
        
        view.addSubview(btnSetting2)

        btnSetting2.backgroundColor = UIColor(named: "background")
        btnSetting2.setImage(UIImage(named: "gearshape.fill")!.withTintColor(UIColor(named: "orange")!), for: .normal)
        btnSetting2.tintColor = UIColor(named: "orange")
        btnSetting2.contentVerticalAlignment = .fill
        btnSetting2.contentHorizontalAlignment = .fill
        
        btnSetting2.addTarget(self, action: #selector(setting), for: .touchUpInside)
        slider.addTarget(self, action: #selector(changeSlider), for: .valueChanged)
        
        
        NSLayoutConstraint.activate([
            
            pageTitle2.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: UIScreen.main.bounds.height / 27.066),
            pageTitle2.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            vads.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            vads.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            btnSetting.centerYAnchor.constraint(equalTo: pageTitle.centerYAnchor),
            btnSetting.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -21),
            btnSetting.heightAnchor.constraint(equalToConstant: 20),
            btnSetting.widthAnchor.constraint(equalToConstant: 20),
            
            btnSetting2.centerYAnchor.constraint(equalTo: pageTitle2.centerYAnchor),
            btnSetting2.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -21),
            btnSetting2.heightAnchor.constraint(equalToConstant: 20),
            btnSetting2.widthAnchor.constraint(equalToConstant: 20),
            
            stackViewCenter.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 170),
            stackViewCenter.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            imageRLiner.topAnchor.constraint(equalTo: stackViewRight.topAnchor),
            imageRLiner.leadingAnchor.constraint(equalTo: stackViewRight.trailingAnchor, constant: -3 ),
            imageRLiner.bottomAnchor.constraint(equalTo: stackViewRight.bottomAnchor),
            
            imageLLiner.topAnchor.constraint(equalTo: stackViewLeft.topAnchor),
            imageLLiner.trailingAnchor.constraint(equalTo: stackViewLeft.leadingAnchor, constant: 3),
            imageLLiner.bottomAnchor.constraint(equalTo: stackViewLeft.bottomAnchor),
        ])
        

        
        if UIScreen.main.bounds.width > 830 {

            imageCLiner.image = UIImage(named: "linerBig")
            
            NSLayoutConstraint.activate([
                
                imageCLiner.topAnchor.constraint(equalTo: stackViewCenter.topAnchor),
                imageCLiner.leadingAnchor.constraint(equalTo: stackViewCenter.leadingAnchor, constant: -20),
                imageCLiner.trailingAnchor.constraint(equalTo: stackViewCenter.trailingAnchor,constant: 20),
                imageCLiner.bottomAnchor.constraint(equalTo: stackViewCenter.bottomAnchor),
                
                slider.topAnchor.constraint(equalTo: min.bottomAnchor, constant: UIScreen.main.bounds.height / 100.5),
                slider.leadingAnchor.constraint(equalTo: stackViewLeft.leadingAnchor, constant: 5),
                slider.trailingAnchor.constraint(equalTo: stackViewRight.trailingAnchor, constant: -5),
                
                min.topAnchor.constraint(equalTo: stackViewCenter.bottomAnchor, constant: UIScreen.main.bounds.height / 12.6875 ),
                min.leadingAnchor.constraint(equalTo: slider.leadingAnchor),
                
                medium.topAnchor.constraint(equalTo: stackViewCenter.bottomAnchor, constant: UIScreen.main.bounds.height / 12.6875 ),
                medium.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                
                max.topAnchor.constraint(equalTo: stackViewCenter.bottomAnchor, constant: UIScreen.main.bounds.height / 12.6875 ),
                max.trailingAnchor.constraint(equalTo: slider.trailingAnchor),
                
                stackViewLeft.bottomAnchor.constraint(equalTo: stackViewCenter.bottomAnchor),
                stackViewLeft.heightAnchor.constraint(equalTo: stackViewCenter.heightAnchor, multiplier: 1),
                stackViewLeft.trailingAnchor.constraint(equalTo: stackViewCenter.leadingAnchor, constant: -5),
                
                stackViewRight.bottomAnchor.constraint(equalTo: stackViewCenter.bottomAnchor),
                stackViewRight.heightAnchor.constraint(equalTo: stackViewCenter.heightAnchor, multiplier: 1),
                stackViewRight.leadingAnchor.constraint(equalTo: stackViewCenter.trailingAnchor, constant: 5),
                
                imageLLiner.widthAnchor.constraint(equalTo: stackViewLeft.widthAnchor, multiplier: 0.4),
                imageRLiner.widthAnchor.constraint(equalTo: stackViewLeft.widthAnchor, multiplier: 0.4),
            ])

        } else if UIScreen.main.bounds.width > 500 && UIScreen.main.bounds.width < 830 {
            
            imageCLiner.isHidden = true
            
            NSLayoutConstraint.activate([
                
                imageCLiner.topAnchor.constraint(equalTo: stackViewCenter.topAnchor),
                imageCLiner.leadingAnchor.constraint(equalTo: stackViewCenter.leadingAnchor, constant: -20),
                imageCLiner.trailingAnchor.constraint(equalTo: stackViewCenter.trailingAnchor,constant: 20),
                imageCLiner.bottomAnchor.constraint(equalTo: stackViewCenter.bottomAnchor),
                
                slider.topAnchor.constraint(equalTo: min.bottomAnchor, constant: UIScreen.main.bounds.height / 100.5),
                slider.leadingAnchor.constraint(equalTo: stackViewLeft.leadingAnchor, constant: 5),
                slider.trailingAnchor.constraint(equalTo: stackViewRight.trailingAnchor, constant: -5),
                
                min.topAnchor.constraint(equalTo: stackViewCenter.bottomAnchor, constant: UIScreen.main.bounds.height / 12.6875 ),
                min.leadingAnchor.constraint(equalTo: slider.leadingAnchor),
                
                medium.topAnchor.constraint(equalTo: stackViewCenter.bottomAnchor, constant: UIScreen.main.bounds.height / 12.6875 ),
                medium.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                
                max.topAnchor.constraint(equalTo: stackViewCenter.bottomAnchor, constant: UIScreen.main.bounds.height / 12.6875 ),
                max.trailingAnchor.constraint(equalTo: slider.trailingAnchor),
                
                stackViewLeft.bottomAnchor.constraint(equalTo: stackViewCenter.bottomAnchor),
                stackViewLeft.heightAnchor.constraint(equalTo: stackViewCenter.heightAnchor, multiplier: 1),
                stackViewLeft.trailingAnchor.constraint(equalTo: stackViewCenter.leadingAnchor, constant: -25),
                
                stackViewRight.bottomAnchor.constraint(equalTo: stackViewCenter.bottomAnchor),
                stackViewRight.heightAnchor.constraint(equalTo: stackViewCenter.heightAnchor, multiplier: 1),
                stackViewRight.leadingAnchor.constraint(equalTo: stackViewCenter.trailingAnchor, constant: 25),
                
                imageLLiner.widthAnchor.constraint(equalTo: stackViewLeft.widthAnchor, multiplier: 0.4),
                imageRLiner.widthAnchor.constraint(equalTo: stackViewLeft.widthAnchor, multiplier: 0.4),
            ])

        } else {
            
            NSLayoutConstraint.activate([
                
                stackViewLeft.bottomAnchor.constraint(equalTo: stackViewCenter.bottomAnchor),
                stackViewLeft.heightAnchor.constraint(equalTo: stackViewCenter.heightAnchor, multiplier: 1),
                stackViewLeft.trailingAnchor.constraint(equalTo: stackViewCenter.leadingAnchor, constant: -18),
                stackViewLeft.widthAnchor.constraint(equalToConstant: 80),
                
                stackViewRight.bottomAnchor.constraint(equalTo: stackViewCenter.bottomAnchor),
                stackViewRight.heightAnchor.constraint(equalTo: stackViewCenter.heightAnchor, multiplier: 1),
                stackViewRight.leadingAnchor.constraint(equalTo: stackViewCenter.trailingAnchor, constant: 18),
                
                imageCLiner.topAnchor.constraint(equalTo: stackViewCenter.topAnchor),
                imageCLiner.leadingAnchor.constraint(equalTo: stackViewCenter.leadingAnchor, constant: -3),
                imageCLiner.trailingAnchor.constraint(equalTo: stackViewCenter.trailingAnchor,constant: 3),
                imageCLiner.bottomAnchor.constraint(equalTo: stackViewCenter.bottomAnchor),
                
                slider.topAnchor.constraint(equalTo: min.bottomAnchor, constant: UIScreen.main.bounds.height / 100.5),
                slider.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
                slider.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
                
                min.topAnchor.constraint(equalTo: stackViewCenter.bottomAnchor, constant: UIScreen.main.bounds.height / 12.6875 ),
                min.leadingAnchor.constraint(equalTo: slider.leadingAnchor),
                
                medium.topAnchor.constraint(equalTo: stackViewCenter.bottomAnchor, constant: UIScreen.main.bounds.height / 12.6875 ),
                medium.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                
                max.topAnchor.constraint(equalTo: stackViewCenter.bottomAnchor, constant: UIScreen.main.bounds.height / 12.6875 ),
                max.trailingAnchor.constraint(equalTo: slider.trailingAnchor),
                
                imageLLiner.widthAnchor.constraint(equalTo: stackViewLeft.widthAnchor, multiplier: 0.5),
                imageRLiner.widthAnchor.constraint(equalTo: stackViewLeft.widthAnchor, multiplier: 0.5),
            ])
            
        }
    }
}

