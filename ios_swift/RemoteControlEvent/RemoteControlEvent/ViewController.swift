//
//  ViewController.swift
//  RemoteControlEvent
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
        UIApplication.sharedApplication().beginReceivingRemoteControlEvents()
        self.becomeFirstResponder()
    }
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        UIApplication.sharedApplication().endReceivingRemoteControlEvents()
        self.resignFirstResponder()
    }
    override func remoteControlReceivedWithEvent(event: UIEvent) {
        if event.type == UIEventType.RemoteControl {
            switch event.subtype {
            case UIEventSubtype.RemoteControlTogglePlayPause:
                println("Play")
            case UIEventSubtype.RemoteControlPreviousTrack:
                println("Prev")
            case UIEventSubtype.RemoteControlNextTrack:
                println("Next")
            default:
                println("Other")
            }
        }
    }
}

