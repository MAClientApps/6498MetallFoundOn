//
//  ProtractorUI.swift
//  BuilderHelper
//
//  Created by Kirill Sedliarov on 8.11.22.
//

import Foundation
import UIKit

extension ProtractorViewController {
    
    func setup(){
        
        pageTitle2.isHidden = true
        btnSetting2.isHidden = true
        btn2.isHidden = true
        
        view.backgroundColor = UIColor(named: "background")
        view.addSubview(pageTitle)
        view.addSubview(pageTitle2)
        view.addSubview(prot)
        view.addSubview(place)
        view.addSubview(btn)
        view.addSubview(btnSetting)
        view.addSubview(btn2)
        view.addSubview(btnSetting2)
        
        btn.backgroundColor = .black
        btn.setImage(UIImage(named:  "camera.fill")!.withTintColor(UIColor(named: "orange")!), for: .normal)
        btn.tintColor = UIColor(named: "orange")
        btn.contentVerticalAlignment = .fill
        btn.contentHorizontalAlignment = .fill
        
        btnSetting.backgroundColor = .black
        btnSetting.setImage(UIImage(named: "gearshape.fill")!.withTintColor(UIColor(named: "orange")!), for: .normal)
        btnSetting.tintColor = UIColor(named: "orange")
        btnSetting.contentVerticalAlignment = .fill
        btnSetting.contentHorizontalAlignment = .fill
        
        btn2.backgroundColor = .black
        btn2.setImage(UIImage(named:  "camera.fill")!.withTintColor(UIColor(named: "orange")!), for: .normal)
        btn2.tintColor = UIColor(named: "orange")
        btn2.contentVerticalAlignment = .fill
        btn2.contentHorizontalAlignment = .fill
        
        btnSetting2.backgroundColor = .black
        btnSetting2.setImage(UIImage(named: "gearshape.fill")!.withTintColor(UIColor(named: "orange")!), for: .normal)
        btnSetting2.tintColor = UIColor(named: "orange")
        btnSetting2.contentVerticalAlignment = .fill
        btnSetting2.contentHorizontalAlignment = .fill
        
        place.backgroundColor = .clear
        
        view.addSubview(vads)
        
        if baner != nil {
            vads.addSubview(baner)
            pageTitle2.isHidden = true
            btnSetting2.isHidden = true
            btn2.isHidden = true
            pageTitle.isHidden = false
            btnSetting.isHidden = false
            btn.isHidden = false
            NSLayoutConstraint.activate([
                baner.topAnchor.constraint(equalTo: vads.topAnchor),
                baner.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                
                pageTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: UIScreen.main.bounds.height / 10.175),
                pageTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                
            ])
        } else {
            pageTitle2.isHidden = false
            btnSetting2.isHidden = false
            btn2.isHidden = false
            pageTitle.isHidden = true
            btnSetting.isHidden = true
            btn.isHidden = true
            pageTitle.removeConstraints()
            view.addSubview(pageTitle)
            pageTitle.backgroundColor = .red
            pageTitle.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([pageTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: UIScreen.main.bounds.height / 19.566),
                                         pageTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),])
        }
        
        view.addSubview(rad)

        btn.addTarget(self, action: #selector(showCameraVC), for: .touchUpInside)
        btnSetting.addTarget(self, action: #selector(setting), for: .touchUpInside)
        btn2.addTarget(self, action: #selector(showCameraVC), for: .touchUpInside)
        btnSetting2.addTarget(self, action: #selector(setting), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            
            pageTitle2.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: UIScreen.main.bounds.height / 27.066),
            pageTitle2.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            btnSetting2.centerYAnchor.constraint(equalTo: pageTitle2.centerYAnchor),
            btnSetting2.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -21),
            btnSetting2.heightAnchor.constraint(equalToConstant: 20),
            btnSetting2.widthAnchor.constraint(equalToConstant: 20),
            
            btn2.centerYAnchor.constraint(equalTo: pageTitle2.centerYAnchor),
            btn2.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 21),
            btn2.heightAnchor.constraint(equalToConstant: 19),
            btn2.widthAnchor.constraint(equalToConstant: 24),
            
            vads.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            vads.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            btn.centerYAnchor.constraint(equalTo: pageTitle.centerYAnchor),
            btn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 21),
            btn.heightAnchor.constraint(equalToConstant: 19),
            btn.widthAnchor.constraint(equalToConstant: 24),
            
            btnSetting.centerYAnchor.constraint(equalTo: pageTitle.centerYAnchor),
            btnSetting.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -21),
            btnSetting.heightAnchor.constraint(equalToConstant: 20),
            btnSetting.widthAnchor.constraint(equalToConstant: 20),
            
            rad.topAnchor.constraint(equalTo: pageTitle.bottomAnchor, constant: 38),
            rad.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -41),
            
            place.topAnchor.constraint(equalTo: view.topAnchor, constant: move),
            
            prot.centerYAnchor.constraint(equalTo: place.centerYAnchor),
            
        ])
    }
    

}
