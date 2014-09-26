//
//  ViewController.swift
//  SharedData
//
//  Created by taisuke fujita on 2014/06/29.
//  Copyright (c) 2014年 taisuke fujita. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
                            
    override func viewDidLoad() {
        super.viewDidLoad()
        let app = UIApplication.sharedApplication().delegate
                as AppDelegate
        app.sharedData["item1"] = "an item"
        
        let button = UIButton.buttonWithType(UIButtonType.System) as UIButton
        button.frame = CGRect(x: 0, y: 0, width: 50, height: 44)
        button.setTitle("開く", forState: UIControlState.Normal)
        button.addTarget(self,
            action: "respondToButtonClick:",
            forControlEvents: UIControlEvents.TouchUpInside)
        view.addSubview(button)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func respondToButtonClick(sender: UIButton!) {
        let controller = ModalViewController()
        controller.view.backgroundColor = UIColor.whiteColor()
        self.presentViewController(controller,
            animated: true, completion: nil)
    }
}

