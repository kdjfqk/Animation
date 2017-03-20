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
        bubbleBtn.layer.cornerRadius = bubbleBtn.frame.width/2
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
            self.addShakeAnimation(bubbleBtn)
            sender.setTitle("Stop", for: UIControlState())
        }else if sender.currentTitle == "Stop" {
            self.removeShakeAnimation(bubbleBtn)
            sender.setTitle("Start", for: UIControlState())
        }
        
    }

    func addShakeAnimation(_ view:UIView){
        let pathAnimation:CAKeyframeAnimation = CAKeyframeAnimation(keyPath: "position")
        pathAnimation.calculationMode = kCAAnimationPaced
        pathAnimation.fillMode = kCAFillModeForwards
        pathAnimation.isRemovedOnCompletion = false
        pathAnimation.repeatCount = Float.infinity
        pathAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        pathAnimation.duration = 5
        
        let curvedPath:CGMutablePath = CGMutablePath()
        let circleContainer:CGRect = view.frame.insetBy(dx: view.bounds.size.width / 2 - 3, dy: view.bounds.size.width / 2 - 3)
        curvedPath.addRect(circleContainer)
        pathAnimation.path = curvedPath
        
        
        let scaleX:CAKeyframeAnimation = CAKeyframeAnimation(keyPath:"transform.scale.x")
        scaleX.duration = 1;
        scaleX.values = [ 1.0, 1.1, 1.0 ]
        scaleX.keyTimes = [ 0.0, 0.5, 1.0 ]
        scaleX.repeatCount = Float.infinity
        scaleX.autoreverses = true
        scaleX.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        
        let scaleY:CAKeyframeAnimation = CAKeyframeAnimation(keyPath:"transform.scale.y")
        scaleY.duration = 1.5;
        scaleY.values = [ 1.0, 1.1, 1.0 ]
        scaleY.keyTimes = [ 0.0, 0.5, 1.0 ]
        scaleY.repeatCount = Float.infinity
        scaleY.autoreverses = true
        scaleY.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        

        view.layer.add(pathAnimation, forKey: "myCircleAnimation")
        view.layer.add(scaleX, forKey: "scaleXAnimation")
        view.layer.add(scaleY, forKey: "scaleYAnimation")
    }
   
    func removeShakeAnimation(_ view:UIView) {
        view.layer.removeAllAnimations()
    }

}
