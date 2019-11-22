//
//  GameScene.swift
//  Blob Drop - MHA
//
//  Created by Zsolt Schleder on 26/11/2018.
//  Copyright © 2018 Zsolt Schleder. All rights reserved.
//

import SpriteKit
import GameplayKit

var highScore = UserDefaults.standard.integer(forKey: "highScoreSaved")

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    var colorWheelBase = SKShapeNode()
    
    let spinColorWheel = SKAction.rotate(byAngle: -convertDegreesToRadians(degrees: 360/6), duration: 0.2)
    
    var currentGameState: gameState = gameState.beforeGame
    
    let tapTostartLabel = SKLabelNode(fontNamed: "Caviar Dreams")
    
    let scoreLabel = SKLabelNode(fontNamed: "Caviar Dreams")
    
    let highScoreLabel = SKLabelNode(fontNamed: "Caviar Dreams")
    
    
    
    override func didMove(to view: SKView) {
        
        score = 0
        
        ballMovmentSpeed = 1.8
        
        self.physicsWorld.contactDelegate = self
        
        let background = SKSpriteNode(imageNamed: "gameBackground")
        background.size = self.size
        background.position = CGPoint(x: self.size.width/2, y: self.size.height/2)
        background.zPosition = -1
        self.addChild(background)
        
        colorWheelBase = SKShapeNode(rectOf: CGSize(width: self.size.width*0.47, height: self.size.width*0.47))
        colorWheelBase.position = CGPoint(x: self.size.width/2, y: self.size.height/5.6)
        colorWheelBase.fillColor = SKColor.clear
        colorWheelBase.strokeColor = SKColor.clear
        self.addChild(colorWheelBase)
        
        prepColorWheel()
        
        tapTostartLabel.text = "Tap To Start"
        tapTostartLabel.fontSize = 100
        tapTostartLabel.fontColor = SKColor.darkGray
        tapTostartLabel.position = CGPoint(x: self.size.width/2, y: self.size.height/2)
        self.addChild(tapTostartLabel)
        
        scoreLabel.text = "0"
        scoreLabel.position = CGPoint(x: self.size.width/2, y: self.size.height*0.85)
        scoreLabel.fontColor = SKColor.darkGray
        scoreLabel.fontSize = 225
        self.addChild(scoreLabel)
        
        highScoreLabel.text = "Best: \(highScore)"
        highScoreLabel.position = CGPoint(x: self.size.width/2, y: self.size.height*0.8)
        highScoreLabel.fontColor = SKColor.darkGray
        highScoreLabel.fontSize = 100
        self.addChild(highScoreLabel)
        
    }
    
    func prepColorWheel() {
        
        for i in 0...5 {
        
        let side = Side(type: colorWheelOrder[i])
        let basePosition = CGPoint(x: self.size.width/2, y: self.size.height*0.32)
        side.setScale(0.7)
        side.position = convert(basePosition, to: colorWheelBase)
        side.zRotation = -colorWheelBase.zRotation
        colorWheelBase.addChild(side)
        
        colorWheelBase.zRotation += convertDegreesToRadians(degrees: 360/6)
            
        }
    }
    func spawnBall() {
        
        let ball = Ball()
        ball.position = CGPoint(x: self.size.width/2, y: self.size.height/1)
        self.addChild(ball)
    }
    
    func startGame() {
        
        spawnBall()
        currentGameState = gameState.inGame
        
        let scaleDown = SKAction.scale(to: 0, duration: 0.2)
        let deleteLabel = SKAction.removeFromParent()
        let deleteSequence = SKAction.sequence([scaleDown, deleteLabel])
        tapTostartLabel.run(deleteSequence)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if currentGameState == gameState.beforeGame {
            
            startGame()
            
        }
        else if currentGameState == gameState.inGame {
            
            colorWheelBase.run(spinColorWheel)
            
        }
        
    
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        
        let ball: Ball
        let side: Side
        
        if contact.bodyA.categoryBitMask == PhysicsCategories.Ball {
            
            ball = contact.bodyA.node! as! Ball
            side = contact.bodyB.node! as! Side
            
        } else {
            
            ball = contact.bodyB.node! as! Ball
            side = contact.bodyA.node! as! Side
            
        }
        
    if ball.isActuve == true {
        
        checkMatch(ball: ball, side: side)
        
        }
        
    }
    
    func checkMatch(ball: Ball, side: Side) {
        
        if ball.type == side.type {
            
            print("Correct!")
            
            correctMatch(ball: ball)

        } else {
            
            print("Incorrect!")
            
            wrongMatch(ball: ball)
            
        }
        
    }
    
    func correctMatch(ball: Ball) {
        
        ball.delete()
        
        score += 1
        scoreLabel.text = "\(score)"
        
        switch score {
            
        case 10: ballMovmentSpeed = 1.7
            
        case 20: ballMovmentSpeed = 1.6
            
        case 30: ballMovmentSpeed = 1.5
            
        case 40: ballMovmentSpeed = 1.4
            
        case 50: ballMovmentSpeed = 1.3
            
        default: print("")
            
        }
        
        spawnBall()
        
        if score > highScore {
            
            highScoreLabel.text = "Best: \(score)"
            
        }
        
    }
    
    func wrongMatch(ball: Ball) {
        
        if score > highScore {
            
            highScore = score
            
            UserDefaults.standard.set(highScore, forKey: "highScoreSaved")
            
        }
        
        currentGameState = gameState.afterGame
        ball.flash()
        colorWheelBase.removeAllActions()
        
        let waitToChangeScene = SKAction.wait(forDuration: 3)
        
        let changeScene = SKAction.run {
            
            let sceneToMoveTo = GameOverScene(size: self.size)
            
            sceneToMoveTo.scaleMode = self.scaleMode
            
            let myTransition = SKTransition.fade(withDuration: 0.5)
            
            self.view?.presentScene(sceneToMoveTo, transition: myTransition)
            
            
        }
        
        let sceneChangeSequence = SKAction.sequence([waitToChangeScene, changeScene])
        
        self.run(sceneChangeSequence)
        
    }
    
}
