//
//  SecondViewController.swift
//  test1111
//
//  Created by ldy on 16/9/13.
//  Copyright © 2016年 YNKJMACMINI2. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UINavigationControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backBtnClicked(_ sender: AnyObject) {
        self.navigationController?.popViewController(animated: true)
    }
    // MARK: - UINavigationControllerDelegate
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationControllerOperation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning?{
        if operation == UINavigationControllerOperation.pop {
            return PingInverseTransition()
        }
        return nil
    }

}
