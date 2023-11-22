//
//  NewSettingController.swift
//  BuilderHelper
//
//  Created by Kirill Sedliarov on 11.11.22.
//

import Foundation
import UIKit
import MessageUI

class SettingViewController: UIViewController {
    
    //let remote = RemoteConfigFetch()
    let local = LocalizationVariables()
    var  value = "0"
    var rateUs = "0"
    var getter2 = UserDefaults.standard.value(forKey: "getter2")
    var cheker = false
    var chekerSound = false
    
    
    lazy var tabbleView: UITableView = {
        let tb = UITableView()
        tb.translatesAutoresizingMaskIntoConstraints = false
        tb.delegate = self
        tb.dataSource = self
        
        tb.backgroundColor = UIColor(named: "background")
        
        return tb
    }()
    
    lazy var done = Button(type: .doneButton, local.buttonDone)
    
    lazy var header = Label(type: .pageTitle, local.titleSetting)
    
    override func viewDidLoad() {

        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(methodOfReceivedNotification(notification:)), name: Notification.Name("reload"), object: nil)
        self.overrideUserInterfaceStyle = .dark
        setup()
    }
    
    @objc func methodOfReceivedNotification(notification: Notification) {
        tabbleView.reloadData()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
          return .lightContent
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        }
    }

extension SettingViewController: UIViewControllerTransitioningDelegate {
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return PresentTransition()
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return DismissTransition()
    }
}
