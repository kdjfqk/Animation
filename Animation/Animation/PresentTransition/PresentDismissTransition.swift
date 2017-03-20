//
//  PresentDismissTransition.swift
//  test1111
//
//  Created by ldy on 16/9/13.
//  Copyright © 2016年 YNKJMACMINI2. All rights reserved.
//

import UIKit

class PresentDismissTransition: NSObject, UIViewControllerAnimatedTransitioning {

    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval{
        return 1
    }
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning){
        
        //get from/to view controller and container view
        let fromVC:PresentedViewController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from) as! PresentedViewController
        let toVC:UINavigationController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to) as! UINavigationController
        let presentingVC:PresentingViewController = toVC.topViewController as! PresentingViewController
        let containerView:UIView = transitionContext.containerView
        
        let toView:UIView = transitionContext.view(forKey: UITransitionContextViewKey.to)!
        //回场动画中，toVC.view一定要插入到底层！！！！
        containerView.insertSubview(toView, belowSubview: presentingVC.snapView!)
        toView.alpha = 0
        
        toView.frame = transitionContext.finalFrame(for: toVC)
        
        let initFrame:CGRect = transitionContext.initialFrame(for: fromVC)
        let finishFrame:CGRect = CGRect(x: initFrame.minX, y: initFrame.maxY, width: initFrame.width, height: initFrame.height)
        
        UIView.animate(withDuration: self.transitionDuration(using: transitionContext), delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 1, options: .curveLinear, animations: {
            fromVC.view.frame = finishFrame
            presentingVC.snapView!.transform = presentingVC.snapView!.transform.scaledBy(x: 10/7, y: 10/7)
            presentingVC.snapView!.alpha = 0
            toView.alpha = 1
        }) { (b) in
            print("animation finished")
            presentingVC.snapView?.removeFromSuperview()
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        }
    }
}
