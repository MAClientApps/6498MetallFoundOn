//
//  RulerUI.swift
//  BuilderHelper
//
//  Created by Kirill Sedliarov on 6.11.22.
//

import Foundation
import UIKit

extension RulerViewController {
    
    func setup(){
        
        pageTitle2.isHidden = true
        btnSetting2.isHidden = true
        
        view.backgroundColor = UIColor(named: "background")
        view.addSubview(pageTitle)
        view.addSubview(pageTitle2)
        view.addSubview(scrollView)

        
        view.addSubview(btnSetting)
        
        
        btnSetting.backgroundColor = UIColor(named: "background")
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
        
        btnSetting.addTarget(self, action: #selector(setting), for: .touchUpInside)
        btnSetting2.addTarget(self, action: #selector(setting), for: .touchUpInside)
        
        view.addSubview(vads)
        
        if baner != nil {
            vads.addSubview(baner)
            pageTitle2.isHidden = true
            btnSetting2.isHidden = true
            pageTitle.isHidden = false
            btnSetting.isHidden = false
            scrollView.removeFromSuperview()
            view.addSubview(scrollView)
            NSLayoutConstraint.activate([
                baner.topAnchor.constraint(equalTo: vads.topAnchor),
                baner.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                
                pageTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: UIScreen.main.bounds.height / 10.175),
                pageTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                
                scrollView.topAnchor.constraint(equalTo: pageTitle.bottomAnchor, constant: 20),
                scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                scrollView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height/1.5),
                scrollView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
                
            ])
        } else {
            pageTitle2.isHidden = false
            btnSetting2.isHidden = false
            pageTitle.isHidden = true
            btnSetting.isHidden = true
            pageTitle.removeConstraints()
            view.addSubview(pageTitle)
            scrollView.removeFromSuperview()
            view.addSubview(scrollView)
            pageTitle.backgroundColor = .red
            pageTitle.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                
                pageTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: UIScreen.main.bounds.height / 19.566),
                pageTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                                         
                scrollView.topAnchor.constraint(equalTo: pageTitle2.bottomAnchor, constant: 20),
                scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                scrollView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height/1.4),
                scrollView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
                                        
            ])
        }
        
        scrollView.addSubview(ruler)
        scrollView.addSubview(rulerInc)
        scrollView.addSubview(ruler2)

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
            
            ruler.leftAnchor.constraint(equalTo: scrollView.leftAnchor),    // attaching to the left
            ruler.topAnchor.constraint(equalTo: scrollView.topAnchor),      // attaching to the top
            ruler.rightAnchor.constraint(equalTo: scrollView.rightAnchor),  // attaching to the right
            ruler.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),

            rulerInc.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: UIScreen.main.bounds.width - 140),    // attaching to the left
            rulerInc.topAnchor.constraint(equalTo: scrollView.topAnchor),      // attaching to the top
            rulerInc.rightAnchor.constraint(equalTo: scrollView.rightAnchor, constant: UIScreen.main.bounds.width),  // attaching to the right
            rulerInc.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            
        ])
    }
}
