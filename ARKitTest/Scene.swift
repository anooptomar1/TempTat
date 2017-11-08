//
//  Scene.swift
//  ARKitTest
//
//  Created by Charles Dickstein on 11/5/17.
//  Copyright © 2017 Charles Dickstein. All rights reserved.
//

import SpriteKit
import ARKit

class Scene: SKScene {
    
    let rightButton = SKLabelNode(text: "➡️")
    let leftButton = SKLabelNode(text: "⬅️")

    
    
    let numberOfGhostsLabel = SKLabelNode(text: "0")
    var creationTime : TimeInterval = 0
    var ghostCount = 0 {
        didSet{
            self.numberOfGhostsLabel.text = "\(ghostCount)"
        }
    }
    
    
    override func didMove(to view: SKView) {
        rightButton.fontSize = 60
        rightButton.fontName = "DevanagariSangamMN-Bold"
        rightButton.color = .red
        rightButton.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        rightButton.position = CGPoint(x: size.width * 0.1, y: size.height * -0.45)

        addChild(rightButton)
        
        leftButton.fontSize = 60
        leftButton.fontName = "DevanagariSangamMN-Bold"
        leftButton.color = .red
        leftButton.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.right

        leftButton.position = CGPoint(x: size.width * -0.1, y: size.height * -0.45)
        addChild(leftButton)
        

        
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let sceneView = self.view as? ARSKView else {
            return
        }
        
        // Create anchor using the camera's current position
        if let currentFrame = sceneView.session.currentFrame {
            
            // Create a transform with a translation of 0.2 meters in front of the camera
            var translation = matrix_identity_float4x4
            translation.columns.3.z = -0.2
            let transform = simd_mul(currentFrame.camera.transform, translation)
            
            // Add a new anchor to the session
            let anchor = ARAnchor(transform: transform)
            sceneView.session.add(anchor: anchor)
        }
        //sprite kit does not have UI buttons
        //
        // get location of touch
        let touch = touches.first!
        let location = touch.location(in: self)
        
        print("location  \(rightButton.contains(location))")
    }
}
