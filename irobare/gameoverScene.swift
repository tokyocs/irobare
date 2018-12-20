//
//  gameoverScene.swift
//  irobare
//
//  Created by tcs17181 on 2018/12/12.
//  Copyright © 2018年 tcs17181. All rights reserved.
//

import Foundation
import GameplayKit

class gameoverScene: SKScene, SKPhysicsContactDelegate{
    //負け画面
    var lose: SKSpriteNode!
    
    override func didMove(to view: SKView) {
        self.lose = SKSpriteNode(imageNamed: "unko")
        self.lose.position = CGPoint(x: frame.midX, y: frame.midY)
        self.lose.xScale = 1.1
        self.lose.yScale = 1.1
        self.lose.zPosition = 2
        addChild(self.lose)
    }
    
}
