//
//  ModelsAndData.swift
//  Blob Drop - MHA
//
//  Created by Zsolt Schleder on 27/11/2018.
//  Copyright © 2018 Zsolt Schleder. All rights reserved.
//

import Foundation


enum colorType {
    
    case Red
    case Blue
    case Purple
    case Orange
    case Green
    case Yellow
    
}

let colorWheelOrder:[colorType] = [
    
    
    colorType.Red,
    colorType.Orange,
    colorType.Yellow,
    colorType.Blue,
    colorType.Green,
    colorType.Purple
    
]

enum gameState {
    
    case beforeGame
    case inGame
    case afterGame
    
}

struct PhysicsCategories {
    
    static let None: UInt32 = 0
    static let Ball: UInt32 = 0b1
    static let Side: UInt32 = 0b10
    
    
}

var score: Int = 0

var ballMovmentSpeed: TimeInterval = 1.8

