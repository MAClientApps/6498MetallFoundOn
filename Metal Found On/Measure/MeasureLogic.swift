//
//  MeasureLogic.swift
//  BuilderHelper
//
//  Created by Kirill Sedliarov on 8.11.22.
//

import Foundation
import UIKit
import ARKit

extension MeasureViewController {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touchLocation = touches.first?.location(in: sceneView) {
            let hitTestResults = sceneView.hitTest(touchLocation, types: .featurePoint)
            if let hitResult = hitTestResults.first {
                addDot(at: hitResult)
            }
        }
    }
    
    func alert() {
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
    
    @objc func remove() {
        if !dotNodes.isEmpty {
            for i in dotNodes
            {
                i.removeFromParentNode()
            }
            dotNodes = [SCNNode]()
        }
        if !lineNodes.isEmpty {
            for i in lineNodes
            {
                i.removeFromParentNode()
            }
            lineNodes = [SCNNode]()
        }
        if !textNodes.isEmpty {
            for i in textNodes
            {
                i.removeFromParentNode()
            }
            textNodes = [SCNNode]()
        }
        if !planeNodes.isEmpty {
            for i in planeNodes
            {
                i.removeFromParentNode()
            }
            planeNodes = [SCNNode]()
        }
        btnSetting.isEnabled = false
        label.text = "cm: 0 | inch: 0"
    }
    
    func addDot(at hitResult: ARHitTestResult) {
        if dotNodes.count < 2 {
            let dotGeometry = SCNSphere(radius: 0.005)
            let material = SCNMaterial()
            material.diffuse.contents = UIColor(named: "orange")
            dotGeometry.materials = [material]
            let dotNode = SCNNode(geometry: dotGeometry)
            dotNode.position = SCNVector3Make(hitResult.worldTransform.columns.3.x, hitResult.worldTransform.columns.3.y, hitResult.worldTransform.columns.3.z)
            dotNodes.append(dotNode)
            sceneView.scene.rootNode.addChildNode(dotNode)
            if dotNodes.count == 2 {
                calculate(start: dotNodes[dotNodes.count - 2].position, end: dotNodes[dotNodes.count - 1].position)
                btnSetting.isEnabled = true
            }
        } else {
            print("more")
        }
    }
    
    func calculate (start:SCNVector3, end:SCNVector3){
        let a = end.x - start.x
        let b = end.y - start.y
        let c = end.z - start.z
        let distance = abs(sqrt(pow(a, 2) + pow(b, 2) + pow(c, 2)))
        let rounded = "\((Double(distance * 10000).rounded(.toNearestOrEven) / 100))"
        let inch = "\((Double(distance * 0.3937 * 10000).rounded(.toNearestOrEven) / 100))"
        label.text = "cm: \(rounded) | inch: \(inch)"

        updateLine(start: start, end: end)
        updateText(text: "cm: \(rounded) | inch: \(inch)", atPosition: end, end: start)
    }
    
    func updateText(text: String, atPosition position:SCNVector3, end:SCNVector3) {
        let text = SCNText(string: text, extrusionDepth: 0.1)
        text.font = UIFont.systemFont(ofSize: 1)
        text.flatness = 0.005
        let textNode = SCNNode(geometry: text)
        textNode.worldPosition = SCNVector3Make(position.x, position.y + 0.01, position.z)
        textNode.geometry?.firstMaterial?.diffuse.contents = UIColor.white
        var fontScale: Float = 0.05
        if abs(position.z) < 0.5 {
            fontScale = 0.01
        }
        textNode.scale = SCNVector3(fontScale, fontScale, fontScale)
        let (min, max) = (text.boundingBox.min, text.boundingBox.max)
        let dx = min.x + 0.5 * (max.x - min.x)
        let dy = min.y + 0.5 * (max.y - min.y)
        textNode.pivot = SCNMatrix4MakeTranslation(dx, dy, 0)
        textNode.constraints = [SCNBillboardConstraint()]
        let width = (max.x - min.x) * (fontScale + 0.01)
        let height = (max.y - min.y) * (fontScale + 0.01)
        let plane = SCNPlane(width: CGFloat(width), height: CGFloat(height))
        plane.cornerRadius = 15
        let planeNode = SCNNode(geometry: plane)
        planeNode.geometry?.firstMaterial?.diffuse.contents = UIColor.lightGray.withAlphaComponent(0.6)
        planeNode.geometry?.firstMaterial?.isDoubleSided = true
        planeNode.position = textNode.position
        planeNode.constraints = [SCNBillboardConstraint()]
        
        planeNodes.append(planeNode)
        textNodes.append(textNode)
        sceneView.scene.rootNode.addChildNode(planeNode)
        sceneView.scene.rootNode.addChildNode(textNode)
    }
    
    func updateLine(start:SCNVector3, end:SCNVector3 ) {
        let line = SCNGeometry.line(from: start, to: end)
        line.firstMaterial?.diffuse.contents = UIColor.white
        let lineNode = SCNNode(geometry: line)
        lineNode.position = SCNVector3Zero
        lineNodes.append(lineNode)
        sceneView.scene.rootNode.addChildNode(lineNode)
    }
    
}

extension SCNGeometry {
    class func line(from vector1: SCNVector3, to vector2: SCNVector3) -> SCNGeometry {
        let indices: [Int32] = [0, 1]
        let source = SCNGeometrySource(vertices: [vector1, vector2])
        let element = SCNGeometryElement(indices: indices, primitiveType: .line)
        return SCNGeometry(sources: [source], elements: [element])
    }
}
