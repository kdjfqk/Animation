//
//  BubbleShakeAnimation.swift
//  Animation
//
//  Created by ldy on 17/3/21.
//  Copyright © 2017年 BJYN. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    func bubbleShake(){
        let pathAnimation:CAKeyframeAnimation = CAKeyframeAnimation(keyPath: "position")
        pathAnimation.calculationMode = kCAAnimationPaced
        pathAnimation.fillMode = kCAFillModeForwards
        pathAnimation.isRemovedOnCompletion = false
        pathAnimation.repeatCount = Float.infinity
        pathAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        pathAnimation.duration = 5
        
        let curvedPath:CGMutablePath = CGMutablePath()
        let circleContainer:CGRect = self.frame.insetBy(dx: self.bounds.size.width / 2 - 3, dy: self.bounds.size.width / 2 - 3)
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
        
        
        self.layer.add(pathAnimation, forKey: "myCircleAnimation")
        self.layer.add(scaleX, forKey: "scaleXAnimation")
        self.layer.add(scaleY, forKey: "scaleYAnimation")
    }
    
    func stopBubbleShake() {
        self.layer.removeAllAnimations()
    }
}
