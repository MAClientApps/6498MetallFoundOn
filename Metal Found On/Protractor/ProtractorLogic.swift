//
//  ProtractorLogic.swift
//  BuilderHelper
//
//  Created by Kirill Sedliarov on 8.11.22.
//

import Foundation
import UIKit
import AVFoundation


extension ProtractorViewController {
    
    
    @objc func showCameraVC() {
        switch AVCaptureDevice.authorizationStatus(for: .video) {
        case .denied:
            presentCameraSettings()
        case .restricted, .authorized, .notDetermined:
            let vc = CameraProtractorViewController()
            vc.modalPresentationStyle = .overCurrentContext
            present(vc, animated: true)
        }
    }
    
    @objc func setting() {
        let vc = SettingViewController()
        present(vc, animated: true)
    }

    func presentCameraSettings() {
        
        let alertController = UIAlertController(title: local.alertCameraPermission,
                                      message: local.alertPermissionDenied,
                                      preferredStyle: .alert)
        alertController.view.tintColor = UIColor(named: "orange")
        alertController.overrideUserInterfaceStyle = UIUserInterfaceStyle.dark
        let cancelAlertButton = UIAlertAction(title: local.alertCancel, style: .destructive)
        let settingAlertButton = UIAlertAction(title: local.alertSetting, style: .default) { _ in
            if let url = URL(string: UIApplication.openSettingsURLString) {
                UIApplication.shared.open(url, options: [:], completionHandler: { _ in
                })
            }
        }
        alertController.addAction(cancelAlertButton)
        alertController.addAction(settingAlertButton)
        present(alertController, animated: true)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let tap = touches.first?.location(in: self.view)
        if f || s {
            var promPoint = tap
            if tap!.x >= UIScreen.main.bounds.width - 30 && tap!.y < move{
                promPoint = CGPoint(x: tap!.x - 30, y: move)
            }
            if tap!.x >= UIScreen.main.bounds.width - 30 {
                promPoint = CGPoint(x: tap!.x - 30, y: tap!.y)
            }
            if tap!.y <= move {
                promPoint = CGPoint(x: tap!.x, y: move)
            }
            if tap!.y >= UIScreen.main.bounds.height - move / 1.5{
                promPoint = CGPoint(x: tap!.x, y: UIScreen.main.bounds.height - move / 1.5)
            }
            if f {
                shapeLayerFirst.removeFromSuperlayer()
                self.lastPosition = tap
                self.drawLineFromPoint(start: lastPosition!, toPoint: promPoint!, inView: self.place, first: true)

                let tr = CGPoint(x: promPoint!.x, y: promPoint!.y - move)
                self.firstPosition = tr
                rad.text = "\(String(format: "%.0f", angle(self.firstPosition!, end: secondPosition!)))°"
            } else {
                shapeLayerSecond.removeFromSuperlayer()
                self.drawLineFromPoint(start: lastPosition!, toPoint: promPoint!, inView: self.place, first: false)
                let tr = CGPoint(x: promPoint!.x, y: promPoint!.y - move)
                self.secondPosition = tr
                rad.text = "\(String(format: "%.0f", angle(self.firstPosition!, end: secondPosition!)))°"
            }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let tap = touches.first?.location(in: self.view)
                if touchRectFirst!.maxX > tap!.x && tap!.x > touchRectFirst!.minX && touchRectFirst!.maxY > tap!.y && tap!.y > touchRectFirst!.minY {
                    f = true
                }
                if touchRectSecond!.maxX > tap!.x && tap!.x > touchRectSecond!.minX && touchRectSecond!.maxY > tap!.y && tap!.y > touchRectSecond!.minY {
                    s = true
                }
        }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if f || s {
            if f {
                f = false
                touchRectFirst = CGRect(x: firstPosition!.x - 30, y: firstPosition!.y + move - 30, width: 60, height: 60)
            } else {
                touchRectSecond = CGRect(x: secondPosition!.x - 30, y: secondPosition!.y + move - 30, width: 60, height: 60)
                s = false
            }
        } else {
            print("wrong")
        }
                
    }
    
    func first() {
        let position = CGPoint(x: 1, y: move + 40)
        self.lastPosition = position
        touchRectFirst = CGRect(x: 0, y: move + 10, width: 60, height: 60)
        let path = UIBezierPath()
        let subY = CGPoint(x: startPosition.x, y: startPosition.y + move)
        path.move(to: subY)
        path.addLine(to: position)
        shapeLayerFirst.path = path.cgPath
        shapeLayerFirst.strokeColor = UIColor.white.cgColor
        shapeLayerFirst.lineWidth = 1.0
        shapeLayerFirst.lineDashPattern = [7, 3]
        view.layer.addSublayer(shapeLayerFirst)
        let tr = CGPoint(x: position.x, y: position.y - move)
        self.firstPosition = tr
        
    }
    
    func second() {
        let position = CGPoint(x: UIScreen.main.bounds.width-50, y: move + UIScreen.main.bounds.height / 1.43 / 2)
        touchRectSecond = CGRect(x: UIScreen.main.bounds.width-80, y: move + UIScreen.main.bounds.height / 1.43 / 2 - 30, width: 60, height: 60)
        let path = UIBezierPath()
        let subY = CGPoint(x: startPosition.x, y: startPosition.y + move)
        path.move(to: subY)
        path.addLine(to: position)
        shapeLayerSecond.path = path.cgPath
        shapeLayerSecond.strokeColor = UIColor.white.cgColor
        shapeLayerSecond.lineWidth = 1.0
        shapeLayerSecond.lineDashPattern = [7, 3]
        view.layer.addSublayer(shapeLayerSecond)
        let tr = CGPoint(x: position.x, y: position.y - move)
        self.secondPosition = tr
    }

    func drawLineFromPoint(start : CGPoint, toPoint end:CGPoint, inView view:UIView, first: Bool) {
        let subY = CGPoint(x: end.x, y: end.y - move)
        let path = UIBezierPath()
        path.move(to: startPosition)
        path.addLine(to: subY)
        if first {
            shapeLayerFirst.path = path.cgPath
            shapeLayerFirst.strokeColor = UIColor.white.cgColor
            shapeLayerFirst.lineWidth = 1.0
            shapeLayerFirst.lineDashPattern = [7, 3]
            view.layer.addSublayer(shapeLayerFirst)
        }
        else {
            shapeLayerSecond.path = path.cgPath
            shapeLayerSecond.strokeColor = UIColor.white.cgColor
            shapeLayerSecond.lineWidth = 1.0
            shapeLayerSecond.lineDashPattern = [7, 3]
            view.layer.addSublayer(shapeLayerSecond)
        }
    }
    
    func angle(_ start:CGPoint,end:CGPoint)->Double {
        let v1 = CGVector(dx: start.x - startPosition.x, dy: start.y - startPosition.y)
        let v2 = CGVector(dx: end.x - startPosition.x, dy: end.y - startPosition.y)
        print("v1: \(v1) , v2: \(v2)")
        let angle = atan2(v2.dy, v2.dx) - atan2(v1.dy, v1.dx)
        var deg = angle * CGFloat(180.0 / .pi)
        print("deg: \(deg)")
        if deg < 0 { deg += 360.0 }
        if deg > 180 { deg = 360.0 - deg }
        return Double(deg)
    }
}
