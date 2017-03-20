//
//  PresentTransition.swift
//  test1111
//
//  Created by ldy on 16/9/13.
//  Copyright © 2016年 YNKJMACMINI2. All rights reserved.
//

import UIKit

class PresentTransition: NSObject,UIViewControllerAnimatedTransitioning {

    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval{
        return 0.6
    }
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning){
        
        //get from/to view controller and container view
        let fromVC:PresentingViewController = (transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from) as! UINavigationController).topViewController as! PresentingViewController
        let toVC:PresentedViewController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to) as! PresentedViewController
        let containerView:UIView = transitionContext.containerView
        
        fromVC.snapView = fromVC.view.snapshotView(afterScreenUpdates: false)
        
        containerView.addSubview(fromVC.snapView!)
        containerView.addSubview(toVC.view)
        
        fromVC.view.isHidden = true
        
        let finishFrame:CGRect = transitionContext.finalFrame(for: toVC)
        toVC.view.frame = CGRect(x: finishFrame.minX, y: finishFrame.maxY, width: finishFrame.width, height: finishFrame.height)
        
        UIView.animate(withDuration: self.transitionDuration(using: transitionContext), delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 1, options: .curveLinear, animations: {
            toVC.view.frame = finishFrame
            fromVC.snapView!.transform = fromVC.snapView!.transform.scaledBy(x: 0.7, y: 0.7)
            }) { (b) in
                print("animation finished")
                fromVC.view.isHidden = false
                transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        }
    }
}
