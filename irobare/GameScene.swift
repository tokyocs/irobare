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
    //音
    var audioPlayer: AVAudioPlayer!
    func playSound(name: String) {
        guard let path = Bundle.main.path(forResource: name, ofType: "mp3") else {
            print("音源ファイルが見つかりません")
            return
        }
        
        do {
            // AVAudioPlayerのインスタンス化
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            
            // AVAudioPlayerのデリゲートをセット
            audioPlayer.delegate = self
            
            // 音声の再生
            audioPlayer.play()
        } catch {
        }
    }
    
    
    
    override func didMove(to view: SKView) {
        
        
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
