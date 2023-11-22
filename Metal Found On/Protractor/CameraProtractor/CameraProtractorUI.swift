//
//  CameraProtractorUI.swift
//  BuilderHelper
//
//  Created by Kirill Sedliarov on 9.11.22.
//

import Foundation
import UIKit

extension CameraProtractorViewController {
    
    func setup(){
        
        view.addSubview(prot)
        view.addSubview(place)
        
        view.addSubview(dismissView)
        dismissView.addGestureRecognizer(dismissTap)
        dismissView.addSubview(chevron)
        dismissView.addSubview(libraryDismisLabel)

        view.addSubview(frameRad)
        view.addSubview(rad)
        
        place.backgroundColor = .clear
        
        NSLayoutConstraint.activate([
            
            dismissView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 6),
            dismissView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            
            chevron.centerYAnchor.constraint(equalTo: dismissView.centerYAnchor),
            chevron.leadingAnchor.constraint(equalTo: dismissView.leadingAnchor, constant: 17),
            
            libraryDismisLabel.leadingAnchor.constraint(equalTo: chevron.trailingAnchor, constant: 8),
            libraryDismisLabel.centerYAnchor.constraint(equalTo: chevron.centerYAnchor),
            libraryDismisLabel.trailingAnchor.constraint(equalTo: dismissView.trailingAnchor),
            
            rad.topAnchor.constraint(equalTo: view.topAnchor, constant: UIScreen.main.bounds.height/4.3892),
            rad.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -39),
            
            frameRad.topAnchor.constraint(equalTo: view.topAnchor, constant: UIScreen.main.bounds.height/4.614),
            frameRad.heightAnchor.constraint(equalToConstant: 56),
            frameRad.widthAnchor.constraint(equalToConstant: 80),
            frameRad.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -31),
            
            place.topAnchor.constraint(equalTo: view.topAnchor, constant: UIScreen.main.bounds.height / 5.012),
            
            prot.topAnchor.constraint(equalTo: view.topAnchor, constant: UIScreen.main.bounds.height / 3.172),
         
        ])  
    }
}
