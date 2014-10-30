//
//  ViewController.swift
//  UISample
//
//  Created by taisuke fujita on 2014/10/19.
//  Copyright (c) 2014年 taisuke fujita. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let blurEffect = UIBlurEffect(style: .Light)
        let effectView = UIVisualEffectView(effect: blurEffect)
        effectView.frame = self.imageView.bounds
        //self.imageView.addSubview(effectView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

