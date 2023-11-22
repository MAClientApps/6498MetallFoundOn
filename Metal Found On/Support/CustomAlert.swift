//
//  AlertMoveController.swift
//  MetalDetector
//
//  Created by Kirill Sedliarov on 13.11.22.
//

import Foundation
import UIKit

class AlertMoveController: UIViewController {
    
    lazy var activityViewController: UIActivityViewController? = nil
    
    let local = LocalizationVariables()
    
    lazy var header = Label(type: .alertMove, "")
    lazy var viewBoard = UIView()
    lazy var img = ImageView(image: .infinity)
    lazy var ok = Button(type: .alertB, local.alertOk)
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(viewBoard)
        
        view.backgroundColor = UIColor(named: "some")
        
        viewBoard.applyBlurEffect()
        viewBoard.translatesAutoresizingMaskIntoConstraints = false
        
        viewBoard.addSubview(header)
        viewBoard.addSubview(img)
        viewBoard.addSubview(ok)
        ok.addTopBorder(with: UIColor(red: 0.29, green: 0.294, blue: 0.306, alpha: 1), andWidth: 0.5)
       
        viewBoard.backgroundColor = .clear
        viewBoard.layer.cornerRadius = 14
        
        ok.addTarget(self, action: #selector(handleClose), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            
            viewBoard.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            viewBoard.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            viewBoard.heightAnchor.constraint(equalToConstant: 198),
            viewBoard.widthAnchor.constraint(equalToConstant: 270),
            
            img.topAnchor.constraint(equalTo: viewBoard.topAnchor, constant: 16),
            img.centerXAnchor.constraint(equalTo: viewBoard.centerXAnchor),
            
            header.topAnchor.constraint(equalTo: img.bottomAnchor, constant: 12),
            header.centerXAnchor.constraint(equalTo: viewBoard.centerXAnchor),
            
            ok.widthAnchor.constraint(equalToConstant: 270),
            ok.heightAnchor.constraint(equalToConstant: 44),
            ok.bottomAnchor.constraint(equalTo: viewBoard.bottomAnchor),
            ok.leadingAnchor.constraint(equalTo: viewBoard.leadingAnchor),
        
        ])
    }
    
    @objc func handleClose(paramSander: Any){
        dismiss(animated: true, completion: nil)
    }
    
    
}

import UIKit


extension UIView {
    func applyBlurEffect() {
        let blurEffect = UIBlurEffect(style: .systemThinMaterialDark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = bounds
        blurEffectView.layer.cornerRadius = 14
        blurEffectView.clipsToBounds = true
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(blurEffectView)
    }
}
