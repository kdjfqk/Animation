//
//  PingInverseTransition.swift
//  test1111
//
//  Created by ldy on 16/9/13.
//  Copyright © 2016年 YNKJMACMINI2. All rights reserved.
//

import UIKit

class PingInverseTransition: NSObject, UIViewControllerAnimatedTransitioning,CAAnimationDelegate{
    
    var transContext:UIViewControllerContextTransitioning?
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval{
        return 0.6
    }
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning){
        
        self.transContext = transitionContext
        
        //get from/to view controller and container view
        let fromVC:SecondViewController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from) as! SecondViewController
        let toVC:ViewController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to) as! ViewController
        let containerView:UIView = transitionContext.containerView
        
        //add to view to container
        containerView.insertSubview(toVC.view, belowSubview: fromVC.view)
        
        //create start path
        let finishPath:UIBezierPath = UIBezierPath(ovalIn: toVC.selectedBtn!.frame)
        //create finish path
        let btn:UIButton = toVC.selectedBtn!
        var x:CGFloat = 0
        var y:CGFloat = 0
        if btn.frame.minX>fromVC.view.bounds.width/2 {
            if btn.frame.minY<fromVC.view.bounds.height/2 {
                //第一象限
                x = btn.frame.minX
                y = toVC.view.bounds.height-btn.frame.minY
            }else{
                //第四象限
                x = btn.frame.minX
                y = btn.frame.minY
            }
        }else{
            if btn.frame.minY<fromVC.view.bounds.height/2 {
                //第二象限
                x = toVC.view.bounds.width-btn.frame.minX
                y = toVC.view.bounds.height-btn.frame.minY
            }else{
                //第三象限
                x = toVC.view.bounds.width-btn.frame.minX
                y = btn.frame.minY
            }
        }
        let radius:CGFloat = sqrt(x*x + y*y)
        let startRect:CGRect = toVC.selectedBtn!.frame.insetBy(dx: -radius, dy: -radius)
        let startPath:UIBezierPath = UIBezierPath(ovalIn: startRect)
        
        //create mask layer
        let maskLayer:CAShapeLayer = CAShapeLayer()
        
        //add mask layer to toVC
        fromVC.view.layer.mask = maskLayer
        
        //create animation
        let animation:CABasicAnimation = CABasicAnimation(keyPath: "path")
        animation.fromValue = startPath.cgPath
        animation.toValue = finishPath.cgPath
        animation.duration = self.transitionDuration(using: transitionContext)
        animation.delegate = self
        animation.timingFunction = CAMediaTimingFunction(name:kCAMediaTimingFunctionEaseInEaseOut)
        
        //add animation to mask layer
        maskLayer.add(animation, forKey: "path")
    }
//    
//    override func animationDidStop(_ anim: CAAnimation, finished flag: Bool){
//        self.transContext!.completeTransition(!(self.transContext!.transitionWasCancelled))
//        self.transContext?.viewController(forKey: UITransitionContextViewControllerKey.from)!.view.layer.mask = nil
//    }
    
    func animationDidStop(_: CAAnimation, finished: Bool){
        self.transContext!.completeTransition(!(self.transContext!.transitionWasCancelled))
        self.transContext?.viewController(forKey: UITransitionContextViewControllerKey.from)!.view.layer.mask = nil
    }
}
