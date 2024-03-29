//
//  SideObject.swift
//  Blob Drop - MHA
//
//  Created by Zsolt Schleder on 27/11/2018.
//  Copyright © 2018 Zsolt Schleder. All rights reserved.
//

import Foundation
import SpriteKit


class Side: SKSpriteNode {
    
    let type: colorType
    
    init (type: colorType) {
        
        self.type = type
        
        let sideTexture = SKTexture(imageNamed: "side_\(self.type)")
       
        super.init(texture: sideTexture, color: SKColor.clear, size: sideTexture.size())
        
        self.physicsBody = SKPhysicsBody(rectangleOf: self.size)
        self.physicsBody!.affectedByGravity = false
        self.physicsBody!.categoryBitMask = PhysicsCategories.Side
        self.physicsBody!.collisionBitMask = PhysicsCategories.None
        self.physicsBody!.contactTestBitMask = PhysicsCategories.Ball
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
