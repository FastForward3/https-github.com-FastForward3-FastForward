//
//  BallObject.swift
//  Blob Drop - MHA
//
//  Created by Zsolt Schleder on 27/11/2018.
//  Copyright © 2018 Zsolt Schleder. All rights reserved.
//

import Foundation
import SpriteKit

class Ball: SKSpriteNode {
    
    let type: colorType
    
    var isActuve: Bool = true
    
    init() {
        
        let randomTypeIndex = Int(arc4random()%6)
        self.type = colorWheelOrder[randomTypeIndex]
        
        let ballTexture = SKTexture(imageNamed: "ball_\(self.type)")
        
        super.init(texture: ballTexture, color: SKColor.clear, size: ballTexture.size())
        
        self.physicsBody = SKPhysicsBody(circleOfRadius: 55)
        self.physicsBody!.affectedByGravity = false
        self.physicsBody!.categoryBitMask = PhysicsCategories.Ball
        self.physicsBody!.collisionBitMask = PhysicsCategories.None
        self.physicsBody!.contactTestBitMask = PhysicsCategories.Side
        
        
        self.setScale(0)
        
        let scaleIn = SKAction.scale(to: 1.3, duration: 0.2)
        self.run(scaleIn)
        
        
        
        let moveToside = SKAction.moveTo(y: 670, duration: ballMovmentSpeed)
        
        let ballSpawnSequence = SKAction.sequence([scaleIn, moveToside])
        
        self.run(ballSpawnSequence)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func delete() {
        
        isActuve = false
        
        let scaleDown = SKAction.scale(to: 0, duration: 0.2)
        let deleteBall = SKAction.removeFromParent()
        let deleteSequence = SKAction.sequence([scaleDown, deleteBall])
        self.run(deleteSequence)
        
    }
    
    func flash() {
        
        self.removeAllActions()
        
        self.isActuve = false
        
        let fadeOut = SKAction.fadeOut(withDuration: 0.4)
        let fadeIn = SKAction.fadeIn(withDuration: 0.4)
        let flashSequence = SKAction.sequence([fadeOut, fadeIn])
        let repeatFlash = SKAction.repeat(flashSequence, count: 3)
        self.run(repeatFlash)
        
    }
    
}
