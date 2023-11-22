//
//  TableViewEx.swift
//  BuilderHelper
//
//  Created by Kirill Sedliarov on 11.11.22.
//

import Foundation
import UIKit
import MessageUI

extension SettingViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if UserDefaults.standard.value(forKey: "FullAccess") as! Int == 1 {
            return 7
        } else {
            return 8
        }

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = SettingCell(
            reuseID: "cell",
            icon: ImageView(image: .chevron),
            label: Label(type: .mainText, ""),
            useSwitch: false,
            chevron: ImageView(image: .nothing), useSwitch1: false
        )
        cell.backgroundColor = UIColor(named: "background")
        
       // if UserDefaults.standard.value(forKey: "FullAccess") as! Int == 1 {
            switch indexPath.row {
                case 0:
                    cell = SettingCell(
                       reuseID: "cell",
                       icon: ImageView(image: .star),
                       label: Label(type: .mainText, local.settingRateUs),
                       useSwitch: false,
                       chevron: ImageView(image: .chevron), useSwitch1: false
                   )
                    cell.backgroundColor = UIColor(named: "background")

                case 1:
                    cell = SettingCell(
                       reuseID: "cell",
                       icon: ImageView(image: .mail),
                       label: Label(type: .mainText, local.settingSupport),
                       useSwitch: false,
                       chevron: ImageView(image: .chevron), useSwitch1: false
                   )
                    cell.backgroundColor = UIColor(named: "background")
                  
                case 2:
                    cell = SettingCell(
                       reuseID: "cell",
                       icon: ImageView(image: .doc),
                       label: Label(type: .mainText, local.settingPrivacyPolicy),
                       useSwitch: false,
                       chevron: ImageView(image: .chevron), useSwitch1: false
                   )
                    cell.backgroundColor = UIColor(named: "background")
                    
                case 3:
                    cell = SettingCell(
                       reuseID: "cell",
                       icon: ImageView(image: .doc),
                       label: Label(type: .mainText, local.settingTermsOfUse),
                       useSwitch: false,
                       chevron: ImageView(image: .chevron), useSwitch1: false
                   )
                    cell.backgroundColor = UIColor(named: "background")
                    
                case 4:
                    cell = SettingCell(
                       reuseID: "cell",
                       icon: ImageView(image: .share),
                       label: Label(type: .mainText, local.settingShareTheApp),
                       useSwitch: false,
                       chevron: ImageView(image: .chevron), useSwitch1: false
                   )
                    cell.backgroundColor = UIColor(named: "background")
                    
                case 5:
                    cell = SettingCell(
                       reuseID: "cell",
                       icon: ImageView(image: .sound),
                       label: Label(type: .mainText, local.settingSound),
                       useSwitch: false,
                       chevron: ImageView(image: .nothing), useSwitch1: true
                   )
                    cell.backgroundColor = UIColor(named: "background")
                    
                case 6:
                    cell = SettingCell(
                       reuseID: "cell",
                       icon: ImageView(image: .vibro),
                       label: Label(type: .mainText, local.settingVibrate),
                       useSwitch: true,
                       chevron: ImageView(image: .nothing), useSwitch1: false
                   )
                    cell.backgroundColor = UIColor(named: "background")
                    cell.separatorInset = UIEdgeInsets(top: 0, left: tableView.bounds.size.width, bottom: 0, right: 0);
                default:
                    break
                }
        //}
//        else {
//            switch indexPath.row {
//                case 0:
//                    cell = SettingCell(
//                       reuseID: "cell",
//                       icon: ImageView(image: .crown),
//                       label: Label(type: .mainText, local.settingUnlock),
//                       useSwitch: false,
//                       chevron: ImageView(image: .chevron), useSwitch1: false
//                   )
//                    cell.backgroundColor = UIColor(named: "background")
//                case 1:
//                    cell = SettingCell(
//                       reuseID: "cell",
//                       icon: ImageView(image: .star),
//                       label: Label(type: .mainText, local.settingRateUs),
//                       useSwitch: false,
//                       chevron: ImageView(image: .chevron), useSwitch1: false
//                   )
//                    cell.backgroundColor = UIColor(named: "background")
//
//                case 2:
//                    cell = SettingCell(
//                       reuseID: "cell",
//                       icon: ImageView(image: .mail),
//                       label: Label(type: .mainText, local.settingSupport),
//                       useSwitch: false,
//                       chevron: ImageView(image: .chevron), useSwitch1: false
//                   )
//                    cell.backgroundColor = UIColor(named: "background")
//
//                case 3:
//                    cell = SettingCell(
//                       reuseID: "cell",
//                       icon: ImageView(image: .doc),
//                       label: Label(type: .mainText, local.settingPrivacyPolicy),
//                       useSwitch: false,
//                       chevron: ImageView(image: .chevron), useSwitch1: false
//                   )
//                    cell.backgroundColor = UIColor(named: "background")
//
//                case 4:
//                    cell = SettingCell(
//                       reuseID: "cell",
//                       icon: ImageView(image: .doc),
//                       label: Label(type: .mainText, local.settingTermsOfUse),
//                       useSwitch: false,
//                       chevron: ImageView(image: .chevron), useSwitch1: false
//                   )
//                    cell.backgroundColor = UIColor(named: "background")
//
//                case 5:
//                    cell = SettingCell(
//                       reuseID: "cell",
//                       icon: ImageView(image: .share),
//                       label: Label(type: .mainText, local.settingShareTheApp),
//                       useSwitch: false,
//                       chevron: ImageView(image: .chevron), useSwitch1: false
//                   )
//                    cell.backgroundColor = UIColor(named: "background")
//
//                case 6:
//                    cell = SettingCell(
//                       reuseID: "cell",
//                       icon: ImageView(image: .sound),
//                       label: Label(type: .mainText, local.settingSound),
//                       useSwitch: false,
//                       chevron: ImageView(image: .nothing), useSwitch1: true
//                   )
//                    cell.backgroundColor = UIColor(named: "background")
//
//                case 7:
//                    cell = SettingCell(
//                       reuseID: "cell",
//                       icon: ImageView(image: .vibro),
//                       label: Label(type: .mainText, local.settingVibrate),
//                       useSwitch: true,
//                       chevron: ImageView(image: .nothing), useSwitch1: false
//                   )
//                    cell.backgroundColor = UIColor(named: "background")
//                    cell.separatorInset = UIEdgeInsets(top: 0, left: tableView.bounds.size.width, bottom: 0, right: 0);
//                default:
//                    break
//                }
//        }
        
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if UserDefaults.standard.value(forKey: "FullAccess") as! Int == 1 {
            print("fullAccess")
            switch indexPath.row {
            case 0:
                rate()
            case 1:
                support()
                
            case 2:
                if let url = URL(string: "https://www.mindataaeq.io/privacy-policy") {
                    UIApplication.shared.open(url, options: [:], completionHandler: nil)
                }
            case 3:
                if let url = URL(string: "https://www.minaadateq.io/terms-of-use") {
                    UIApplication.shared.open(url, options: [:], completionHandler: nil)
                }
            case 4: shareAs()
            case 5: print("s")
            case 6: print("v")
            default:
                break
            }
        } else {
            print("No FullAccess")
            switch indexPath.row {
                
            case 0:
                if UserDefaults.standard.value(forKey: "getter2") as? String != nil {
                    getter2 = UserDefaults.standard.value(forKey: "getter2") as! String
                    print("screen chose loaded")
                } else {
                    print("screen chose not loaded")
                    getter2 = "1"
                }
                if getter2 as! String == "0" {
                    print("getter2 = 0")
                    
                }
//                else if getter2 as! String == "2" {
//                    print("SubscribeController")
//                    let vc = FirstSubscribeViewController()
//                    vc.modalPresentationStyle = .custom
//                    vc.transitioningDelegate = self
//                    present(vc, animated: true)
//                } else {
//                    print("SubscribeController")
//                    let vc = SecondSubscribeViewController()
//                    vc.modalPresentationStyle = .custom
//                    vc.transitioningDelegate = self
//                    present(vc, animated: true)
//                }
                
            case 1:
                rate()
            case 2:
                support()
                
            case 3:
                if let url = URL(string: "https://www.mindateq.io/privacy-policy") {
                    UIApplication.shared.open(url, options: [:], completionHandler: nil)
                }
            case 4:
                if let url = URL(string: "https://www.mindateq.io/terms-of-use") {
                    UIApplication.shared.open(url, options: [:], completionHandler: nil)
                }
            case 5: shareAs()
            case 6: print("s")
            case 7: print("v")
            default:
                break
            }
        }
       
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func rate() {
        
        //RemoteConfigFetch.shared.fetchValues("rateUs") { [self] rateUs in
        self.rateUs = UserDefaults.standard.value(forKey: "rateUs") as? String ?? "1"
            
            if Int(rateUs)! == 1 {
                
                let alert = UIAlertController(title: local.alertRate,
                                              message: "",
                                              preferredStyle: .alert)
                
                alert.view.tintColor = UIColor(named: "orange")
                alert.overrideUserInterfaceStyle = UIUserInterfaceStyle.dark
                
                let cancelAlertButton = UIAlertAction(title: local.alertNo, style: .default) {
                    [self] UIAlertAction in
                    support()
                }
                
                let saveAlertButton = UIAlertAction(title: local.alertYes, style: .default) { _ in
                    if let url = URL(string: "itms-apps://itunes.apple.com/app/id6444347206"),
                       UIApplication.shared.canOpenURL(url){
                        UIApplication.shared.open(url)
                    }
                }
                
                alert.addAction(cancelAlertButton)
                alert.addAction(saveAlertButton)
                
                present(alert, animated: true)
            } else {
                DispatchQueue.main.async {
                    let productURL = URL(string:  "itms-apps://itunes.apple.com/app/id6444347206")
                    var components = URLComponents(url: productURL!, resolvingAgainstBaseURL: false)
                    components?.queryItems = [
                      URLQueryItem(name: "action", value: "write-review")
                    ]
                    guard let writeReviewURL = components?.url else {
                      return
                    }
                    UIApplication.shared.open(writeReviewURL)
                }
                
            }
        
    }
    
    func support() {
        if MFMailComposeViewController.canSendMail() {
            let mail = MFMailComposeViewController()
            mail.mailComposeDelegate = self
            let systemVersion = UIDevice.current.systemVersion
            let devicename = UIDevice.modelName
            let buildNumber: String = Bundle.main.object(forInfoDictionaryKey: "CFBundleVersion") as! String
            let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String

            mail.setToRecipients(["support@mindateq.io"])
            mail.setSubject("Metal Detector — User Question ")
            mail.setMessageBody("<p></p><p>----------------</p><p> Device: \(devicename)</p><p>iOS: \(systemVersion)</p><p>App version: \(appVersion!) (\(buildNumber))</p>", isHTML: true)
            present(mail, animated: true)
        } else { }
    }
    
    private func shareAs() {
        var textToShare = "With this app you can easily find metal objects that are hidden nearby and take measurements: "
        textToShare += "https://apps.apple.com/app/id6444347206"
        
            let activityVC = UIActivityViewController(activityItems: [textToShare], applicationActivities: nil)
            self.present(activityVC, animated: true, completion: nil)
    }
    

    
}

extension SettingViewController: MFMailComposeViewControllerDelegate {
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true)
    }
}

extension UIAlertController {

    //Set background color of UIAlertController
    func setBackgroundColor(color: UIColor) {
        if let bgView = self.view.subviews.first, let groupView = bgView.subviews.first, let contentView = groupView.subviews.first {
            contentView.backgroundColor = color
        }
    }

    //Set title font and title color
    func setTitlet(font: UIFont?, color: UIColor?) {
        guard let title = self.title else { return }
        let attributeString = NSMutableAttributedString(string: title)//1
        if let titleFont = font {
            attributeString.addAttributes([NSAttributedString.Key.font : titleFont],//2
                                          range: NSMakeRange(0, title.utf8.count))
        }

        if let titleColor = color {
            attributeString.addAttributes([NSAttributedString.Key.foregroundColor : titleColor],//3
                                          range: NSMakeRange(0, title.utf8.count))
        }
        self.setValue(attributeString, forKey: "attributedTitle")//4
    }

    //Set message font and message color
    func setMessage(font: UIFont?, color: UIColor?) {
        guard let message = self.message else { return }
        let attributeString = NSMutableAttributedString(string: message)
        if let messageFont = font {
            attributeString.addAttributes([NSAttributedString.Key.font : messageFont],
                                          range: NSMakeRange(0, message.utf8.count))
        }

        if let messageColorColor = color {
            attributeString.addAttributes([NSAttributedString.Key.foregroundColor : messageColorColor],
                                          range: NSMakeRange(0, message.utf8.count))
        }
        self.setValue(attributeString, forKey: "attributedMessage")
    }

    //Set tint color of UIAlertController
    func setTint(color: UIColor) {
        self.view.tintColor = color
    }
    
    
}

