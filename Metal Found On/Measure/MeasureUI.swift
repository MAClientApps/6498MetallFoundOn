//
//  MeasureUI.swift
//  BuilderHelper
//
//  Created by Kirill Sedliarov on 8.11.22.
//

import Foundation
import SceneKit
import ARKit

extension MeasureViewController {
    
    func setup() {
        view.addSubview(sceneView)
        sceneView.addSubview(labelView)
        labelView.addSubview(label)
        labelView.addSubview(btnSetting)
    
        labelView.backgroundColor = UIColor(named: "orange")
        btnSetting.backgroundColor = .clear
        btnSetting.setImage(UIImage(named: "elips")!, for: .normal)
        btnSetting.tintColor = .lightGray
        btnSetting.contentVerticalAlignment = .fill
        btnSetting.contentHorizontalAlignment = .fill
        btnSetting.addTarget(self, action: #selector(remove), for: .touchUpInside)
        btnSetting.isEnabled = false

        sceneView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            labelView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
            labelView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            
            btnSetting.centerYAnchor.constraint(equalTo: labelView.centerYAnchor),
            btnSetting.trailingAnchor.constraint(equalTo: labelView.trailingAnchor, constant: -15),
            btnSetting.heightAnchor.constraint(equalToConstant: 30),
            btnSetting.widthAnchor.constraint(equalToConstant: 30),
            
            sceneView.topAnchor.constraint(equalTo: view.topAnchor),
            sceneView.leftAnchor.constraint(equalTo: view.leftAnchor),
            sceneView.rightAnchor.constraint(equalTo: view.rightAnchor),
            sceneView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            label.centerXAnchor.constraint(equalTo: labelView.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: labelView.centerYAnchor)
            
        ])
    }
}

