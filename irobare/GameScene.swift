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



class GameScene: SKScene, AVAudioPlayerDelegate{
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
    
    //0から3までの値を取得する
    let random = arc4random_uniform(4)
    
    //動きの変数
    var ugoki:Int = 0
    
    
    
    
    override func didMove(to view: SKView) {
        
        //背景
        self.playscreen = SKSpriteNode(imageNamed: "playscreen")
        self.playscreen.position = CGPoint(x: frame.midX, y: frame.midY)
        self.playscreen.xScale = 1
        self.playscreen.yScale = 1
        self.playscreen.zPosition = -1
        addChild(self.playscreen)
        //プレイヤー
        self.player = SKSpriteNode(imageNamed: "player")
        self.player.position = CGPoint(x: -frame.width / 4, y: frame.midY - view.frame.size.height / 5)
        self.player.xScale = 0.9
        self.player.yScale = 0.9
        self.player.zPosition = 1
        addChild(self.player)
        //敵プレイヤー
        self.enemyPlayer = SKSpriteNode(imageNamed: "enemyPlayer")
        self.enemyPlayer.position = CGPoint(x: frame.width / 4, y: frame.midY - view.frame.size.height / 5)
        self.enemyPlayer.xScale = 0.8
        self.enemyPlayer.yScale = 0.8
        self.enemyPlayer.zPosition = 1
        addChild(self.enemyPlayer)
        //右向き
        self.migimuki = SKSpriteNode(imageNamed: "migimuki")
        self.migimuki.position = CGPoint(x: frame.midX - view.frame.size.width / 6, y: frame.midY - view.frame.size.height / 3.2)
        self.migimuki.xScale = 0.3
        self.migimuki.yScale = 0.3
        self.migimuki.zPosition = 2
        addChild(self.migimuki)
        //左向き
        self.hidarimuki = SKSpriteNode(imageNamed: "hidarimuki")
        self.hidarimuki.position = CGPoint(x: frame.midX - view.frame.size.width / 3.6, y: frame.midY - view.frame.size.height / 3.2)
        self.hidarimuki.xScale = 0.3
        self.hidarimuki.yScale = 0.3
        self.hidarimuki.zPosition = 2
        addChild(self.hidarimuki)
        
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
        ball.position = CGPoint(x: 0, y: 0)
        ball.zPosition = 1
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
            let moveToRight = SKAction.moveTo(x: self.player.position.x + 35, duration: 0.2)
            //それを実行する
            player.run(moveToRight)
        //もしugokiが2なら
        }else if ugoki == 2 {
            //左に35px動く
            let moveToLeft = SKAction.moveTo(x: self.player.position.x - 35, duration: 0.2)
            //それを実行する
            player.run(moveToLeft)
        }
    }
}
