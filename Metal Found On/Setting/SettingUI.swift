//
//  SettingNUI.swift
//  BuilderHelper
//
//  Created by Kirill Sedliarov on 11.11.22.
//

import Foundation
import UIKit

extension SettingViewController {
    
    func setup() {
        
        view.backgroundColor = UIColor(named: "background")
        
        view.addSubview(header)
        view.addSubview(done)
        view.addSubview(tabbleView)
        tabbleView.backgroundColor = UIColor(named: "background")
        tabbleView.layer.cornerRadius = 7
        
        done.addTarget(self, action: #selector(dismis), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            
            done.centerYAnchor.constraint(equalTo: header.centerYAnchor),
            done.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            
            header.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            header.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            
            tabbleView.topAnchor.constraint(equalTo: header.bottomAnchor, constant: 39),
            tabbleView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            tabbleView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            tabbleView.heightAnchor.constraint(equalToConstant: 352),
        ])
    }
    
    
}

extension SettingViewController {
    
    @objc func dismis() {
        dismiss(animated: true)
    }
    
}


