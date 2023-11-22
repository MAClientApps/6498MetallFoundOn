//
//  SettingCell.swift
//  BuilderHelper
//
//  Created by Kirill Sedliarov on 11.11.22.
//

import Foundation
import UIKit

class SettingCell: UITableViewCell {
    
    private var icon: ImageView?
    private var label: Label?
    
    public var switchCheck: UISwitch?
    public var switchCheck1: UISwitch?
    private var chevron = ImageView(image: .nothing)
    private var bgIconView =  View(type: .settingView)
    
    init(reuseID: String, icon: ImageView, label: Label, useSwitch: Bool, chevron: ImageView, useSwitch1: Bool) {
        super.init(style: .default, reuseIdentifier: reuseID)
        
        self.chevron = chevron
        self.icon = icon
        self.label = label
        backgroundColor = .clear
        self.chevron.translatesAutoresizingMaskIntoConstraints = false
        self.icon!.translatesAutoresizingMaskIntoConstraints = false
        self.label!.translatesAutoresizingMaskIntoConstraints = false
        self.bgIconView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(chevron)
        addSubview(label)
        addSubview(bgIconView)
        bgIconView.addSubview(icon)
        
        icon.tintColor = .black
        chevron.tintColor = .gray.withAlphaComponent(0.4)
        
        setupConstraint()
        
        if useSwitch {
            switchCheck = UISwitch()
            
            if VibrateSound.shared.isVabrateAccess {
                switchCheck?.setOn(true, animated: true)
            } else {
                switchCheck?.setOn(false, animated: true)
            }
            
            switchCheck?.onTintColor = UIColor(named: "orange")
            switchCheck!.addTarget(self, action: #selector(toogleAutoRecord(_:)), for: .touchUpInside)
            
            accessoryView = switchCheck
        }
        
        if useSwitch1 {
            switchCheck1 = UISwitch()
            
            switchCheck1?.onTintColor = UIColor(named: "orange")
            switchCheck1!.addTarget(self, action: #selector(toogleAutoRecord1(_:)), for: .touchUpInside)
            if SoundAccess.shared.isSoundAccess {
                switchCheck1?.setOn(true, animated: true)
            } else {
                switchCheck1?.setOn(false, animated: true)
            }
          
            
            accessoryView = switchCheck1
        }

    }
    
    @objc private func toogleAutoRecord(_ sender: UISwitch) {
        if sender.isOn {
            VibrateSound.shared.isVabrateAccess = true
        } else {
            VibrateSound.shared.isVabrateAccess = false
            
        }
    }
    
    @objc private func toogleAutoRecord1(_ sender: UISwitch) {
        if sender.isOn {
            SoundAccess.shared.isSoundAccess = true
        } else {
            SoundAccess.shared.isSoundAccess = false
        
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SettingCell {
    
    func setupConstraint() {
        NSLayoutConstraint.activate([
        self.bgIconView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
        self.bgIconView.centerYAnchor.constraint(equalTo: centerYAnchor),
        
        self.icon!.centerYAnchor.constraint(equalTo: bgIconView.centerYAnchor),
        self.icon!.centerXAnchor.constraint(equalTo: bgIconView.centerXAnchor),
        
        self.label!.leadingAnchor.constraint(equalTo: self.icon!.trailingAnchor, constant: 20),
        self.label!.centerYAnchor.constraint(equalTo: centerYAnchor),
        
        self.chevron.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
        self.chevron.centerYAnchor.constraint(equalTo: centerYAnchor),
        self.chevron.widthAnchor.constraint(equalToConstant: 14),
        self.chevron.heightAnchor.constraint(equalToConstant: 17)
        ])
    }
}
