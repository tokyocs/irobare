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
        
        self.migimuki = SKSpriteNode(imageNamed: "migimuki")
        self.migimuki.position = CGPoint(x: -frame.width / 6, y: frame.midY - view.frame.size.height / 3)
        self.migimuki.xScale = 0.7
        self.migimuki.yScale = 0.7
        self.migimuki.zPosition = 2
        addChild(self.migimuki)
        
    }
    
    
    func touchDown(atPoint pos : CGPoint) {
        
    }
    
    func touchMoved(toPoint pos : CGPoint) {
        
    }
    
    func touchUp(atPoint pos : CGPoint) {
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
