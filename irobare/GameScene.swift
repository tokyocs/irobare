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
        self.playscreen.size = self.size
        addChild(self.playscreen)
        
        self.player = SKSpriteNode(imageNamed: "player")
        self.player.position = CGPoint(x: 0, y: 0)
        self.player.xScale = 2
        self.player.yScale = 3
        self.player.zPosition = 1
        addChild(self.player)
        
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
