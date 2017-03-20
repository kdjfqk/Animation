//
//  PresentedViewController.swift
//  test1111
//
//  Created by ldy on 16/9/13.
//  Copyright © 2016年 YNKJMACMINI2. All rights reserved.
//

import UIKit

class PresentedViewController: UIViewController {

    @IBOutlet var closeBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        closeBtn.layer.cornerRadius = closeBtn.bounds.width/2
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func closeBtnClicked(_ sender: AnyObject) {
        self.presentingViewController!.dismiss(animated: true, completion: nil)
        self.presentingViewController
    }
}
