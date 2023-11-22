//
//  CustomTapBar.swift
//  BuilderHelper
//
//  Created by Kirill Sedliarov on 6.11.22.
//

import Foundation
import UIKit
import AVFoundation

class CustomTabBarController: UITabBarController{

    let local = LocalizationVariables()
    let vc = UserDefaults.standard.value(forKey: "random")

    override func viewDidLoad() {
        
        super.viewDidLoad()
     
        viewGenerateTabBar()
        tabBar.tintColor = UIColor(named: "orange")
        tabBar.backgroundColor = UIColor(named: "background")
        tabBar.unselectedItemTintColor = UIColor(named: "gray")
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        RemoteConfigFetch.shared.fetchValues()
        if vc as! String == "0" {
            selectedIndex = 0
        } else if vc as! String == "1" {
            selectedIndex = 1
        } else if vc as! String == "2" {
            selectedIndex = 2
        } else if vc as! String == "3" {
            selectedIndex = 3
        } else if vc as! String == "4" {
            selectedIndex = 4
        } else {
            selectedIndex = 0
        }
    }
    
    public func viewGenerateTabBar(){
        viewControllers = [
            generateVC(viewController: MetalSearchViewController(), title: local.iconMetal, image: UIImage(named: "metal")!),
            generateVC(viewController: MeasureViewController(), title: local.iconMeasure, image: UIImage(named: "measure")!),
            generateVC(viewController: RulerViewController(), title: local.titleRuler, image: UIImage(named: "ruler")!),
            generateVC(viewController: ProtractorViewController(), title: local.titleProtractor, image: UIImage(named: "protractor")!),
            generateVC(viewController: LevelViewController(), title: local.titleLevel, image: UIImage(named: "level")!),
        ]
    }
    
    public func generateVC(viewController: UIViewController, title: String, image: UIImage) -> UIViewController {
        viewController.tabBarItem.title = title
        viewController.tabBarItem.image = image
        return viewController
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
    }
}

