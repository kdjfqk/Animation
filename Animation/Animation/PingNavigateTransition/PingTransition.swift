//
//  PingTransition.swift
//  test1111
//
//  Created by ldy on 16/9/13.
//  Copyright © 2016年 YNKJMACMINI2. All rights reserved.
//

import UIKit

class PingTransition: NSObject, UIViewControllerAnimatedTransitioning,CAAnimationDelegate{

    var transContext:UIViewControllerContextTransitioning?
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval{
        return 0.6
    }
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning){
        
        self.transContext = transitionContext
        
        //get from/to view controller and container view
        let fromVC:ViewController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from) as! ViewController
        let toVC:SecondViewController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to) as! SecondViewController
        let containerView:UIView = transitionContext.containerView
        
        //add to view to container
        containerView.addSubview(toVC.view)
        
        //create start path
        let startPath:UIBezierPath = UIBezierPath(ovalIn: fromVC.addBtn.frame)
        //create finish path
        let btn:UIButton = fromVC.addBtn
        var x:CGFloat = 0
        var y:CGFloat = 0
        if btn.frame.minX>toVC.view.bounds.width/2 {
            if btn.frame.minY<toVC.view.bounds.height/2 {
                //第一象限
                x = btn.frame.minX
                y = toVC.view.bounds.height-btn.frame.minY
            }else{
                //第四象限
                x = btn.frame.minX
                y = btn.frame.minY
            }
        }else{
            if btn.frame.minY<toVC.view.bounds.height/2 {
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
        let finishRect:CGRect = fromVC.addBtn.frame.insetBy(dx: -radius, dy: -radius)
        let finishPaht:UIBezierPath = UIBezierPath(ovalIn: finishRect)
        
        //create mask layer
        let maskLayer:CAShapeLayer = CAShapeLayer()
        //maskLayer.path = finishPaht.CGPath
        
        //add mask layer to toVC
        toVC.view.layer.mask = maskLayer
        
        //create animation
        let animation:CABasicAnimation = CABasicAnimation(keyPath: "path")
        animation.fromValue = startPath.cgPath
        animation.toValue = finishPaht.cgPath
        animation.duration = self.transitionDuration(using: transitionContext)
        animation.delegate = self
        animation.timingFunction = CAMediaTimingFunction(name:kCAMediaTimingFunctionEaseInEaseOut)
        
        //add animation to mask layer
        maskLayer.add(animation, forKey: "path")
        
    }
    
//    override func animationDidStop(_ anim: CAAnimation, finished flag: Bool){
//        self.transContext!.completeTransition(!(self.transContext!.transitionWasCancelled))
//        self.transContext?.viewController(forKey: UITransitionContextViewControllerKey.to)!.view.layer.mask = nil
//    }
    
    func animationDidStop(_: CAAnimation, finished: Bool){
        self.transContext!.completeTransition(!(self.transContext!.transitionWasCancelled))
        self.transContext?.viewController(forKey: UITransitionContextViewControllerKey.to)!.view.layer.mask = nil
    }
}
