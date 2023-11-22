//
//  LevelUI.swift
//  BuilderHelper
//
//  Created by Kirill Sedliarov on 6.11.22.
//

import Foundation
import UIKit

extension LevelViewController{
    
    func setup(){
        
        view.backgroundColor = UIColor(named: "background")
        pageTitle2.isHidden = true
        btnSetting2.isHidden = true
        view.addSubview(pageTitle)
        view.addSubview(pageTitle2)
        view.addSubview(sample)
        view.addSubview(v)
        view.addSubview(sample2)
        view.bringSubviewToFront(sample2)
        view.addSubview(lLine)
        view.addSubview(rLine)
        view.addSubview(bLine)
        view.addSubview(tLine)
        view.addSubview(xL)
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
        
        btnSetting.backgroundColor = .black
        btnSetting.setImage(UIImage(named: "gearshape.fill")!.withTintColor(UIColor(named: "orange")!), for: .normal)
        btnSetting.tintColor = UIColor(named: "orange")
        btnSetting.contentVerticalAlignment = .fill
        btnSetting.contentHorizontalAlignment = .fill
        
        view.addSubview(btnSetting2)
        
        btnSetting2.backgroundColor = .black
        btnSetting2.setImage(UIImage(named: "gearshape.fill")!.withTintColor(UIColor(named: "orange")!), for: .normal)
        btnSetting2.tintColor = UIColor(named: "orange")
        btnSetting2.contentVerticalAlignment = .fill
        btnSetting2.contentHorizontalAlignment = .fill
        
        xL.textColor = .black
        v.layer.addSublayer(shapeY)
        v.backgroundColor = .clear
        shapeY.path = halfY.cgPath
        shapeY.lineCap = .round
        shapeY.strokeEnd = 1
        shapeY.bounds = CGRect(x: wth / 2 - wth / 6, y: hght / 2 - wth / 6, width: wth / 3, height: wth / 3)
        shapeY.fillColor = UIColor.white.cgColor
        sample.backgroundColor = UIColor(named: "orange")
        sample2.backgroundColor = .clear
        sample.layer.cornerRadius = UIScreen.main.bounds.width / 6
        
        if UIScreen.main.bounds.width > 500 {
            xL.font = UIFont.systemFont(ofSize: 80, weight: .semibold)
        }
        
        
        
        btnSetting.addTarget(self, action: #selector(setting), for: .touchUpInside)
        btnSetting2.addTarget(self, action: #selector(setting), for: .touchUpInside)
        
        
        NSLayoutConstraint.activate([
            
            pageTitle2.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: UIScreen.main.bounds.height / 27.066),
            pageTitle2.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            btnSetting.centerYAnchor.constraint(equalTo: pageTitle.centerYAnchor),
            btnSetting.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -21),
            btnSetting.heightAnchor.constraint(equalToConstant: 20),
            btnSetting.widthAnchor.constraint(equalToConstant: 20),
            
            btnSetting2.centerYAnchor.constraint(equalTo: pageTitle2.centerYAnchor),
            btnSetting2.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -21),
            btnSetting2.heightAnchor.constraint(equalToConstant: 20),
            btnSetting2.widthAnchor.constraint(equalToConstant: 20),
            
            vads.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            vads.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            sample.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            sample.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            sample.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 3),
            sample.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 3),
            
            sample2.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            sample2.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            sample2.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 3),
            sample2.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 3),
            
            lLine.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.height/12),
            lLine.heightAnchor.constraint(equalToConstant: 2),
            lLine.centerYAnchor.constraint(equalTo: sample.centerYAnchor),
            lLine.trailingAnchor.constraint(equalTo: sample.leadingAnchor, constant: -20),
            
            rLine.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.height/12),
            rLine.heightAnchor.constraint(equalToConstant: 2),
            rLine.centerYAnchor.constraint(equalTo: sample.centerYAnchor),
            rLine.leadingAnchor.constraint(equalTo: sample.trailingAnchor, constant: 20),
            
            tLine.widthAnchor.constraint(equalToConstant: 2),
            tLine.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height/12),
            tLine.bottomAnchor.constraint(equalTo: sample.topAnchor, constant: -20),
            tLine.centerXAnchor.constraint(equalTo: sample.centerXAnchor),
            
            bLine.widthAnchor.constraint(equalToConstant: 2),
            bLine.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height/12),
            bLine.topAnchor.constraint(equalTo: sample.bottomAnchor, constant: 20),
            bLine.centerXAnchor.constraint(equalTo: sample.centerXAnchor),
            
            xL.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            xL.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
}
