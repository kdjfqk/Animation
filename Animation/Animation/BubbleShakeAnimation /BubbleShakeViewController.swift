//
//  BubbleShakeViewController.swift
//  test1111
//
//  Created by ldy on 16/9/14.
//  Copyright © 2016年 YNKJMACMINI2. All rights reserved.
//

import UIKit

class BubbleShakeViewController: UIViewController {

    @IBOutlet var bubbleBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        bubbleBtn.layer.cornerRadius = 25
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func startShake(_ sender: UIButton) {
        if sender.currentTitle == "Start" {
            bubbleBtn.bubbleShake()
            sender.setTitle("Stop", for: UIControlState())
        }else if sender.currentTitle == "Stop" {
            bubbleBtn.stopBubbleShake()
            sender.setTitle("Start", for: UIControlState())
        }
    }
}
