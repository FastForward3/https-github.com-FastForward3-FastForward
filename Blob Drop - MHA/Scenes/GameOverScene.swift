//
//  GameOverScene.swift
//  Blob Drop - MHA
//
//  Created by Zsolt Schleder on 30/11/2018.
//  Copyright © 2018 Zsolt Schleder. All rights reserved.
//

import Foundation
import SpriteKit

class GameOverScene: SKScene {
    
    let tapToPlayAgain = SKLabelNode(fontNamed: "Caviar Dreams")
    
    let backToMainMenu = SKLabelNode(fontNamed: "Caviar Dreams")
    
    func createLabel(label: String) -> SKLabelNode {
        let backToMainMenu = SKLabelNode(fontNamed: "Caviar Dreams")
        backToMainMenu.text = label
        backToMainMenu.fontSize = 100
        backToMainMenu.fontColor = SKColor.darkGray
        backToMainMenu.position = CGPoint(x:self.size.width/2 ,y: self.size.height/15)
        backToMainMenu.zPosition = 1
        return backToMainMenu
    }
    
    override func didMove(to view: SKView) {
        
        let gameOverbackground = SKSpriteNode(imageNamed: "gameBackground")
        gameOverbackground.size = self.size
        gameOverbackground.position = CGPoint(x: self.size.width/2, y: self.size.height/2)
        gameOverbackground.zPosition = -1
        self.addChild(gameOverbackground)
        
        let gameLogo = SKSpriteNode(imageNamed: "gameLogo")
        gameLogo.size = CGSize(width: 850, height: 740)
        gameLogo.position = CGPoint(x: self.size.width/2, y: self.size.height/1.3)
        gameLogo.zPosition = 1
        self.addChild(gameLogo)
        
        let gameOverLabel = SKLabelNode(fontNamed: "Caviar Dreams")
        gameOverLabel.text = "Game Over"
        gameOverLabel.fontSize = 200
        gameOverLabel.fontColor = SKColor.darkGray
        gameOverLabel.position = CGPoint(x: self.size.width/2, y: self.size.height/2.2)
        gameOverLabel.zPosition = 1
        self.addChild(gameOverLabel)
        
        let finalScoreLabel = SKLabelNode(fontNamed: "Caviar Dreams")
        finalScoreLabel.text = "Score: \(score)"
        finalScoreLabel.fontSize = 125
        finalScoreLabel.fontColor = SKColor.darkGray
        finalScoreLabel.position = CGPoint(x: self.size.width/2, y: self.size.height/3.1)
        finalScoreLabel.zPosition = 1
        self.addChild(finalScoreLabel)
     
        let finalHighScoreLabel = SKLabelNode(fontNamed: "Caviar Dreams")
        finalHighScoreLabel.text = "High Score: \(highScore)"
        finalHighScoreLabel.fontSize = 125
        finalHighScoreLabel.fontColor = SKColor.darkGray
        finalHighScoreLabel.position = CGPoint(x: self.size.width/2, y: self.size.height/4.2)
        finalHighScoreLabel.zPosition = 1
        self.addChild(finalHighScoreLabel)
        
        tapToPlayAgain.text = "Play Again"
        tapToPlayAgain.fontSize = 100
        tapToPlayAgain.fontColor = SKColor.darkGray
        tapToPlayAgain.position = CGPoint(x: self.size.width/2, y: self.size.height/7)
        tapToPlayAgain.zPosition = 1
        self.addChild(tapToPlayAgain)
        
        backToMainMenu.text = "Main Menu"
        backToMainMenu.fontSize = 100
        backToMainMenu.fontColor = SKColor.darkGray
        backToMainMenu.position = CGPoint(x:self.size.width/2 ,y: self.size.height/18)
        backToMainMenu.zPosition = 1
        self.addChild(backToMainMenu)
        
        func createLabel(label: String) -> SKLabelNode {
            let backToMainMenu = SKLabelNode(fontNamed: "Caviar Dreams")
            backToMainMenu.text = label
            backToMainMenu.fontSize = 100
            backToMainMenu.fontColor = SKColor.darkGray
            backToMainMenu.position = CGPoint(x:self.size.width/2 ,y: self.size.height/10)
            backToMainMenu.zPosition = 1
            return backToMainMenu
            
            let invisibletapToPlayAgain = SKSpriteNode(imageNamed: "gameBackground")
            
        }
    }
    //moo dfghjkgfdfgh
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    
    for touch: AnyObject in touches {
        
        let pointOfTouch = touch.location(in: self)
        
        if tapToPlayAgain.contains(pointOfTouch){
            
            let sceneToMoveTo1 = GameScene(size: self.size)
            sceneToMoveTo1.scaleMode = self.scaleMode
            let myTransition = SKTransition.fade(withDuration: 0.5)
            self.view?.presentScene(sceneToMoveTo1, transition: myTransition)
            
            
        }
        
        if backToMainMenu.contains(pointOfTouch){
            
            let sceneToMoveTo2 = MainMenuScene(size: self.size)
            sceneToMoveTo2.scaleMode = self.scaleMode
            let myTransition = SKTransition.fade(withDuration: 0.5)
            self.view?.presentScene(sceneToMoveTo2, transition: myTransition)
            
        }
    
     }
   }
 }
