//
//  ViewController.swift
//  TouchEvent
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

    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        println("touch began")
    }
    
    override func touchesMoved(touches: NSSet, withEvent event: UIEvent) {
        println("touch moved")
    }
    
    override func touchesEnded(touches: NSSet, withEvent event: UIEvent) {
        println("touch ended")
    }
    
    override func touchesCancelled(touches: NSSet, withEvent event: UIEvent) {
        println("touch cancelled")
    }

}

