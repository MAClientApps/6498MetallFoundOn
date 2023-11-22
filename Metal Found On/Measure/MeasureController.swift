//
//  MeasureController.swift
//  BuilderHelper
//
//  Created by Kirill Sedliarov on 8.11.22.
//

import Foundation
import UIKit
import SceneKit
import ARKit

class MeasureViewController: UIViewController, ARSCNViewDelegate{
    
    var sceneView: ARSCNView!
    let local = LocalizationVariables()
    
    lazy var btnSetting = Button(type: .circle, "")
    lazy var label = Label(type: .pageTitle, "cm: 0 | inch: 0")
    lazy var labelView = View(type: .ads)
    
    var dotNodes = [SCNNode]()
    var textNodes = [SCNNode]()
    var planeNodes = [SCNNode]()
    var lineNodes = [SCNNode]()
    
    var cameraNode = SCNNode()
    var configuration = ARWorldTrackingConfiguration()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.overrideUserInterfaceStyle = .dark
        UserDefaults.standard.set("2", forKey: "random")
        
        sceneView = ARSCNView()
        sceneView.delegate = self
        sceneView.session.run(configuration)
        sceneView.scene.rootNode.addChildNode(cameraNode)
        setup()
    } 
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        switch AVCaptureDevice.authorizationStatus(for: .video) {
        case .denied:
            alert()
        case .restricted, .authorized, .notDetermined:
            print("Ok")
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UserDefaults.standard.set(1, forKey: "FullAccess")
        var helper = UserDefaults.standard.value(forKey: "freeM") as! Int
        helper += 1
        UserDefaults.standard.set(helper, forKey: "freeM")
        var value = UserDefaults.standard.value(forKey: "availableFreeMeasure")
        if value == nil {
            value = "20"
        }
        if helper > Int(value as! String)! || Int(value as! String)! == 0 {
            var getter2 = "1"
            if UserDefaults.standard.value(forKey: "getter2") as? String != nil {
                getter2 = UserDefaults.standard.value(forKey: "getter2") as! String
            } else {
                getter2 = "1"
            }
            if getter2 == "0" {
            }
//            else if getter2 == "2" {
//                print("SubscribeController")
//                let vc = FirstSubscribeViewController()
//                vc.modalPresentationStyle = .fullScreen
//                self.present(vc, animated: true)
//            } else {
//                print("SubscribeController")
//                let vc = SecondSubscribeViewController()
//                vc.modalPresentationStyle = .fullScreen
//                self.present(vc, animated: true)
//            }
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        remove()
    }
}
