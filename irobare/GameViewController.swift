//
//  GameViewController.swift
//  irobare
//
//  Created by tcs17181 on 2018/09/21.
//  Copyright © 2018年 tcs17181. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //背景
//        let bg = UIImageView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height))
//        bg.image = UIImage(named: "playscreen.png")
//        bg.layer.zPosition = -1
//        self.view.addSubview(bg)
        let scene = GameScene(size:CGSize(width: 750,height: 1334))
        let skView = self.view as! SKView
        scene.scaleMode = .aspectFit
        skView.presentScene(scene)
        
    }

    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
