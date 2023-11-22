//
//  CameraProtractorController.swift
//  BuilderHelper
//
//  Created by Kirill Sedliarov on 9.11.22.
//

import Foundation
import UIKit
import AVFoundation

class CameraProtractorViewController: UIViewController{
    
    let local = LocalizationVariables()
    
    lazy var prot = ImageView(image: .protractorClear)
    lazy var rad = Label(type: .protractorLabel, "   ")
    lazy var frameRad = View(type: .disperse)
    
    var touchTap: CGPoint?
    var touchRectFirst: CGRect?
    var touchRectSecond: CGRect?
    
    lazy var dismissView = View(type: .dismissView)
    lazy var dismissTap = UITapGestureRecognizer(target: self, action: #selector(closed))
    lazy var chevron = ImageView(image: .chevronLeft)
    lazy var libraryDismisLabel = Label(type: .folderDismiss, local.buttonBack)
    
    
    lazy var place = View(type: .drawPlace)
    
    let shapeLayerFirst = CAShapeLayer()
    let shapeLayerSecond = CAShapeLayer()
    
    var startPosition = CGPoint(x: 0, y: UIScreen.main.bounds.height / 2.8692)
    var lastPosition: CGPoint?
    var rotateAngle: Double = 0.0
    
    var firstPosition: CGPoint?
    var secondPosition: CGPoint?
    
    var touch = 0
    
    var s = false
    var f = false
    
    let move = UIScreen.main.bounds.height / 5.012
    
    var imageVC: UIImagePickerController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.overrideUserInterfaceStyle = .dark
        switch AVCaptureDevice.authorizationStatus(for: .video) {
        case .denied, .restricted, .authorized:
            print("")
        case .notDetermined:
            closed()
        }
        
        setup()
        first()
        second()
        rad.text = "\(String(format: "%.0f", angle(firstPosition!, end: secondPosition!)))°"
        UserDefaults.standard.set("4", forKey: "random")
        
        
        showCameraVC()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }
}
