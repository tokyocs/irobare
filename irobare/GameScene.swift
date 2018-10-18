//
//  GameScene.swift
//  irobare
//
//  Created by tcs17181 on 2018/09/21.
//  Copyright © 2018年 tcs17181. All rights reserved.
//

import SpriteKit
import GameplayKit
//音
import AVFoundation



class GameScene: SKScene, SKPhysicsContactDelegate, AVAudioPlayerDelegate{
    
    let playerCategory: UInt32 = 1 << 1
    let enemyplayerCategory: UInt32 = 1 << 2
    let ballCategory: UInt32 = 1 << 3
    let platform1Category: UInt32 = 1 << 4
    let platform2Category: UInt32 = 1 << 5
    let netCategory: UInt32 = 1 << 6
    
    //プレイヤー
    var player: SKSpriteNode!
    //敵
    var enemyPlayer: SKSpriteNode!
    //バレーボール
    var bare_ball: SKSpriteNode!
    //ボーリングボール
    var boringball: SKSpriteNode!
    //左向きやじるし
    var hidarimuki: SKSpriteNode!
    //右向き矢印
    var migimuki: SKSpriteNode!
    //トマトボール
    var tomato: SKSpriteNode!
    //トマト罰ゲーム味方
    var tomatomikata: SKSpriteNode!
    //トマト罰ゲーム敵
    var tomatoteki: SKSpriteNode!
    //潰れた味方
    var tuburetamikata: SKSpriteNode!
    //潰れた敵
    var tuburetateki: SKSpriteNode!
    //ゲーム中の画面
    var playscreen: SKSpriteNode!
    //ネット
    var net: SKSpriteNode!
    //プラットフォーム１
    var platform1: SKSpriteNode!
    //プラットフォーム2
    var platform2: SKSpriteNode!

    //0から3までの値を取得する
    let random = arc4random_uniform(4)
    
    //動きの変数
    var ugoki:Int = 0
    
    
    
    
    override func didMove(to view: SKView) {
        self.physicsBody = SKPhysicsBody(edgeLoopFrom: self.frame)
        //ボール出す
        addBall()
        
        //背景
        self.playscreen = SKSpriteNode(imageNamed: "playscreen")
        self.playscreen.position = CGPoint(x: frame.midX, y: frame.midY)
        self.playscreen.xScale = 1.73
        self.playscreen.yScale = 1.73
        self.playscreen.zPosition = -1
        addChild(self.playscreen)
        //プレイヤー
        self.player = SKSpriteNode(imageNamed: "player")
        self.player.position = CGPoint(x: -frame.width / 4, y: frame.midY - view.frame.size.height / 5)
        self.player.xScale = 1.1
        self.player.yScale = 1.1
        self.player.zPosition = 2
        self.player.physicsBody = SKPhysicsBody(circleOfRadius: self.player.frame.width * 0.9)
        self.player.physicsBody?.categoryBitMask = playerCategory
        self.player.physicsBody?.affectedByGravity = true
        self.player.physicsBody?.allowsRotation = false
        addChild(self.player)
        //敵プレイヤー
        self.enemyPlayer = SKSpriteNode(imageNamed: "enemyPlayer")
        self.enemyPlayer.position = CGPoint(x: frame.width / 3.8, y: frame.midY - view.frame.size.height / 5)
        self.enemyPlayer.xScale = 1.1
        self.enemyPlayer.yScale = 1.1
        self.enemyPlayer.zPosition = 2
        self.enemyPlayer.physicsBody = SKPhysicsBody(circleOfRadius: self.enemyPlayer.frame.width * 0.9)
        self.enemyPlayer.physicsBody?.categoryBitMask = enemyplayerCategory
        self.enemyPlayer.physicsBody?.affectedByGravity = true
        self.enemyPlayer.physicsBody?.allowsRotation = false
        addChild(self.enemyPlayer)
        //右向き
        self.migimuki = SKSpriteNode(imageNamed: "migimuki")
        self.migimuki.position = CGPoint(x: frame.midX - view.frame.size.width / 3.1, y: frame.midY - view.frame.size.height / 2.8)
        self.migimuki.xScale = 0.5
        self.migimuki.yScale = 0.5
        self.migimuki.zPosition = 3
        addChild(self.migimuki)
        //左向き
        self.hidarimuki = SKSpriteNode(imageNamed: "hidarimuki")
        self.hidarimuki.position = CGPoint(x: frame.midX - view.frame.size.width / 2.3, y: frame.midY - view.frame.size.height / 2.8)
        self.hidarimuki.xScale = 0.5
        self.hidarimuki.yScale = 0.5
        self.hidarimuki.zPosition = 3
        addChild(self.hidarimuki)
        //プラットフォーム１
        self.platform1 = SKSpriteNode(imageNamed: "platform1")
        self.platform1.position = CGPoint(x: frame.midX - view.frame.size.width / 3.1, y: frame.midY - view.frame.size.height / 2)
        self.platform1.xScale = 0.7
        self.platform1.yScale = 0.7
        self.platform1.zPosition = -1
        self.platform1.physicsBody = SKPhysicsBody(rectangleOf: self.platform1.size)
        self.platform1.physicsBody?.categoryBitMask = platform1Category
        self.platform1.physicsBody?.affectedByGravity = false
        self.platform1.physicsBody?.isDynamic = false
        addChild(self.platform1)
        //プラットフォーム２
        self.platform2 = SKSpriteNode(imageNamed: "platform2")
        self.platform2.position = CGPoint(x: frame.midX + view.frame.size.width / 3.05, y: frame.midY - view.frame.size.height / 2)
        self.platform2.xScale = 0.7
        self.platform2.yScale = 0.7
        self.platform2.zPosition = -1
        self.platform2.physicsBody = SKPhysicsBody(rectangleOf: self.platform2.size)
        self.platform2.physicsBody?.categoryBitMask = platform2Category
        self.platform2.physicsBody?.affectedByGravity = false
        self.platform2.physicsBody?.isDynamic = false
        addChild(self.platform2)
        //ねっと
        self.net = SKSpriteNode(imageNamed: "net")
        self.net.position = CGPoint(x: frame.midX , y: frame.midY - view.frame.size.height / 3.5)
        self.net.xScale = 0.9
        self.net.yScale = 0.9
        self.net.zPosition = 1
        self.net.physicsBody?.categoryBitMask = netCategory
        self.net.physicsBody = SKPhysicsBody(rectangleOf: self.net.size)
        self.net.physicsBody?.affectedByGravity = false
        self.net.physicsBody?.isDynamic = false
        self.net.physicsBody?.allowsRotation = false
        addChild(self.net)
    }
    
    
    func touchDown(atPoint pos : CGPoint) {
        
    }
    
    func touchMoved(toPoint pos : CGPoint) {
        
    }
    
    func touchUp(atPoint pos : CGPoint) {
        
    }
    func addBall() {
        let names = ["bare-bo-ru", "bo-ringball", "tomato"]
        let index = Int(arc4random_uniform(UInt32(names.count)))
        let name = names[index]
        let ball = SKSpriteNode(imageNamed: name)
        ball.xScale = 0.06
        ball.yScale = 0.06
        ball.position = CGPoint(x: frame.midX, y: 280)
        ball.zPosition = 1
        ball.physicsBody = SKPhysicsBody(circleOfRadius: ball.frame.width * 0.9)
        ball.physicsBody?.categoryBitMask = ballCategory
        ball.physicsBody?.velocity = CGVector(dx: -180, dy: 100)
        ball.physicsBody?.affectedByGravity = true
        ball.physicsBody?.restitution = 1.0
        ball.physicsBody?.isDynamic = true
        addChild(ball)
    }
        
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch: AnyObject in touches {
            let location = touch.location(in: self)
            let touchNode = self.atPoint(location)
            if touchNode == migimuki {
                ugoki = 1
            }else if touchNode == hidarimuki {
                ugoki = 2
            }
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    //タッチが終わった時
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch: AnyObject in touches {
            let location = touch.location(in: self)
            let touchNode = self.atPoint(location)
            //ugokiの変数を0にする
            if touchNode == migimuki {
                ugoki = 0
            //同様
            }else if touchNode == hidarimuki {
                ugoki = 0
            }
        }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        //もしugokiが1なら
        if ugoki == 1 {
            //右に35px動く
            let moveToRight = SKAction.moveTo(x: self.player.position.x + 50, duration: 0.2)
            //それを実行する
            player.run(moveToRight)
        //もしugokiが2なら
        }else if ugoki == 2 {
            //左に35px動く
            let moveToLeft = SKAction.moveTo(x: self.player.position.x - 50, duration: 0.2)
            //それを実行する
            player.run(moveToLeft)
        }
    }
}
