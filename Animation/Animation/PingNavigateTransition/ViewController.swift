//
//  ViewController.swift
//  test1111
//
//  Created by YNKJMACMINI2 on 16/3/29.
//  Copyright © 2016年 YNKJMACMINI2. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UINavigationControllerDelegate {

    @IBOutlet var addBtn: UIButton!
    @IBOutlet var bottomAddBtn: UIButton!
    
    var selectedBtn:UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        addBtn.layer.cornerRadius = 25
        bottomAddBtn.layer.cornerRadius = 25
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.delegate = self
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func addBtnClicked(_ sender: AnyObject) {
        self.selectedBtn = sender as! UIButton
        let toVC:SecondViewController = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewControllerID") as! SecondViewController
        self.navigationController?.pushViewController(toVC, animated: true)
    }
    
    @IBAction func back(_ sender: AnyObject) {
        self.navigationController?.popViewController(animated: true)
    }
    
    // MARK: - UINavigationControllerDelegate
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationControllerOperation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning?{
        if operation == UINavigationControllerOperation.push {
            return PingTransition()
        }
        return nil
    }

}

