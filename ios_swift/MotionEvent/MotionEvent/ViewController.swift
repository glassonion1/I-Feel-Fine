//
//  ViewController.swift
//  MotionEvent
//
//  Created by taisuke fujita on 2014/06/19.
//  Copyright (c) 2014年 taisuke fujita. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
                            
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func canBecomeFirstResponder() -> Bool {
        return true;
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.becomeFirstResponder()
    }
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        self.resignFirstResponder()
    }
    override func motionBegan(motion: UIEventSubtype, withEvent event: UIEvent) {
        println("motion began")
    }
    override func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent) {
        println("motion ended")
    }
    override func motionCancelled(motion: UIEventSubtype, withEvent event: UIEvent) {
        println("motion cancelled")
    }

}

