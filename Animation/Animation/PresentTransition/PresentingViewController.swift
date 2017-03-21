//
//  PresentingViewController.swift
//  test1111
//
//  Created by ldy on 16/9/13.
//  Copyright © 2016年 YNKJMACMINI2. All rights reserved.
//

import UIKit

class PresentingViewController: UIViewController,UIViewControllerTransitioningDelegate {

    @IBOutlet var addBtn: UIButton!
    
    var snapView:UIView?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        addBtn.layer.cornerRadius = 25
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK:- UIViewControllerTransitioningDelegate
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning?{
        if presented is PresentedViewController {
            return PresentTransition()
        }
        return nil
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning?{
        if dismissed is PresentedViewController {
            return PresentDismissTransition()
        }
        return nil
    }
    
    @IBAction func addBtnClicked(_ sender: AnyObject) {
        let presentedVC:PresentedViewController = self.storyboard?.instantiateViewController(withIdentifier: "PresentedViewControllerID") as! PresentedViewController
        //设置presented viewcontroller的transitioningDelegate，而不是presenting viewcontroller的
        presentedVC.transitioningDelegate = self
        self.present(presentedVC, animated: true, completion: nil)
    }
    @IBAction func back(_ sender: AnyObject) {
        self.navigationController?.popViewController(animated: true)
    }
}
