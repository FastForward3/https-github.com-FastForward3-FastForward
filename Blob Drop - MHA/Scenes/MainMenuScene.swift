//
//  MainMenuScene.swift
//  Blob Drop - MHA
//
//  Created by Zsolt Schleder on 01/12/2018.
//  Copyright © 2018 Zsolt Schleder. All rights reserved.
//

import Foundation
import SpriteKit

class MainMenuScene: SKScene {
    
    let play = SKLabelNode(fontNamed: "Caviar Dreams")
    
    override func didMove(to view: SKView) {
        
        let mainMenubackground = SKSpriteNode(imageNamed: "gameBackground")
        mainMenubackground.zPosition = -1
        mainMenubackground.size = self.size
        mainMenubackground.position = CGPoint(x: self.size.width/2, y: self.size.height/2)
        self.addChild(mainMenubackground)
        
        let gameLogo = SKSpriteNode(imageNamed: "gameLogo")
        gameLogo.zPosition = 1
        gameLogo.size = CGSize(width: 1100, height: 930)
        gameLogo.position = CGPoint(x: self.size.width/2, y: self.size.height/1.5)
        self.addChild(gameLogo)
        
        let gameName1 = SKLabelNode(fontNamed: "Caviar Dreams")
        gameName1.text = "Blob"
        gameName1.zPosition = 1
        gameName1.fontColor = SKColor.blue
        gameName1.fontSize = 225
        gameName1.position = CGPoint(x: self.size.width/2, y: self.size.height/1.48)
        self.addChild(gameName1)
        
        let gameName2 = SKLabelNode(fontNamed: "Caviar Dreams")
        gameName2.text = "Drop"
        gameName2.zPosition = 1
        gameName2.fontColor = SKColor.red
        gameName2.fontSize = 225
        gameName2.position = CGPoint(x: self.size.width/2, y: self.size.height/1.73)
        self.addChild(gameName2)
        
        
        play.text = "Play"
        play.zPosition = 1
        play.fontColor = SKColor.darkGray
        play.fontSize = 250
        play.position = CGPoint(x: self.size.width/2, y: self.size.height/4.5)
        self.addChild(play)
        
        let howToPlay1 = SKLabelNode(fontNamed: "Caviar Dreams")
        howToPlay1.text = "How To Play:"
        howToPlay1.zPosition = 1
        howToPlay1.fontColor = SKColor.darkGray
        howToPlay1.fontSize = 68
        howToPlay1.position = CGPoint(x: self.size.width/2, y: self.size.height/8)
        self.addChild(howToPlay1)
        
        let howToPlay2 = SKLabelNode(fontNamed: "Caviar Dreams")
        howToPlay2.text = "Tap To Spin The Colour Wheel"
        howToPlay2.zPosition = 1
        howToPlay2.fontColor = SKColor.darkGray
        howToPlay2.fontSize = 68
        howToPlay2.position = CGPoint(x: self.size.width/2, y: self.size.height/11.3)
        self.addChild(howToPlay2)
        
        let howToPlay3 = SKLabelNode(fontNamed: "Caviar Dreams")
        howToPlay3.text = "Make The Ball Hit The Same Colour"
        howToPlay3.zPosition = 1
        howToPlay3.fontColor = SKColor.darkGray
        howToPlay3.fontSize = 68
        howToPlay3.position = CGPoint(x: self.size.width/2, y: self.size.height/19.3)
        self.addChild(howToPlay3)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch: AnyObject in touches {
            
            let pointOfTouch = touch.location(in: self)
            
            if play.contains(pointOfTouch) {
                
                let sceneToMoveTo = GameScene(size: self.size)
                
                sceneToMoveTo.scaleMode = self.scaleMode
                
                let myTransition = SKTransition.fade(withDuration: 0.5)
                
                self.view?.presentScene(sceneToMoveTo, transition: myTransition)
                
            }
            
        }
        
    }
    
}
