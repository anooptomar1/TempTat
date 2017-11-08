//
//  ViewController.swift
//  ARKitTest
//
//  Created by Charles Dickstein on 11/5/17.
//  Copyright © 2017 Charles Dickstein. All rights reserved.
//

import UIKit
import SpriteKit
import ARKit

class ViewController: UIViewController, ARSKViewDelegate {

    @IBOutlet var sceneView: ARSKView!
    var index = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        // Show statistics such as fps and node count
        sceneView.showsFPS = true
        sceneView.showsNodeCount = true
        
        // Load the SKScene from 'Scene.sks'
        if let scene = SKScene(fileNamed: "Scene") {
            sceneView.presentScene(scene)
        }
        
        
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(swipeAction(swipe:)))
        leftSwipe.direction = UISwipeGestureRecognizerDirection.left
        
        
     
        
        

        
    }
    

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()

        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }
    
    
    
   
    
    func view(_ view: ARSKView, nodeFor anchor: ARAnchor) -> SKNode? {
        
        

        // Create and configure a node for the anchor added to the view's session.
        let rootNode = SKLabelNode(text: "")
      
        let imgNode = SKSpriteNode(imageNamed: "dogImg")
        imgNode.xScale = 0.05
        imgNode.yScale = 0.05

        rootNode.horizontalAlignmentMode = .center
        rootNode.verticalAlignmentMode = .center
        rootNode.addChild(imgNode)
        return rootNode;
    }
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
}
extension UIViewController{
    
    @objc func swipeAction(swipe: UISwipeGestureRecognizer){
        
        switch (swipe.direction.rawValue){
            
        case 2:
            print("you swiped");
            break;
            
        default:
            
            break;
            
        }
        
        
    }
    
}

