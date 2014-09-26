//
//  ViewController.swift
//  FilePath
//
//  Created by taisuke fujita on 2014/07/05.
//  Copyright (c) 2014年 taisuke fujita. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
                            
    override func viewDidLoad() {
        super.viewDidLoad()
        
        println(NSHomeDirectory())
        
        println(NSBundle.mainBundle().bundlePath)
        
        let paths = NSSearchPathForDirectoriesInDomains(
            .DocumentDirectory,
            .UserDomainMask, true)
        println(paths[0])
    
        let paths2 = NSSearchPathForDirectoriesInDomains(
            .CachesDirectory,
            .UserDomainMask, true)
        println(paths2[0])
    
        println(NSTemporaryDirectory())
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

