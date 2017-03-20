//
//  BoomViewController.swift
//  test1111
//
//  Created by ldy on 16/9/14.
//  Copyright © 2016年 YNKJMACMINI2. All rights reserved.
//

import UIKit

class BoomViewController: UIViewController {

    @IBOutlet var boomView: UIImageView!
    fileprivate var oldFrame:CGRect = CGRect.zero
    fileprivate var timer:Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        boomView.layer.cornerRadius = boomView.bounds.width/2
        
        let panges:UIPanGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(panEventHandler(_:)))
        boomView.addGestureRecognizer(panges)
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
    

    func panEventHandler(_ ges:UIPanGestureRecognizer){
        if ges.state == .began {
            oldFrame = boomView.frame
            boomView.center = ges.location(in: self.view)
        }
        if ges.state == .changed {
            boomView.center = ges.location(in: self.view)
        }else if ges.state == .ended || ges.state == .cancelled {
            boomView.center = ges.location(in: self.view)
            boomView.boom()
            Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerEvent), userInfo: nil, repeats: false)
        }
    }
    
    func timerEvent(){
        UIView.animate(withDuration: 0.5, animations: {
            self.boomView.frame = self.oldFrame
            }, completion: { (b) in
                //恢复view样式
                self.boomView.reset()
        }) 
    }

}
