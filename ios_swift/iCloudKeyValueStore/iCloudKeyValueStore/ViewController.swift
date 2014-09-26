//
//  ViewController.swift
//  iCloudKeyValueStore
//
//  Created by taisuke fujita on 2014/08/31.
//  Copyright (c) 2014年 taisuke fujita. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let center = NSNotificationCenter.defaultCenter()
        center.addObserver(self,
            selector: "ubiquitousDataDidChange:",
            name: NSUbiquitousKeyValueStoreDidChangeExternallyNotification,
            object: nil)
        let store = NSUbiquitousKeyValueStore.defaultStore()
        let num = store.doubleForKey("stepper")
        self.label.text = "\(num)"
        self.stepper.value = num
    }

    func ubiquitousDataDidChange(notification: NSNotification) {
        let store = NSUbiquitousKeyValueStore.defaultStore()
        if let info = notification.userInfo as? [String: [String]] {
            if let keys = info[NSUbiquitousKeyValueStoreChangedKeysKey] {
                for key in keys {
                    let num = store.doubleForKey(key)
                    self.label.text = "\(num)"
                    self.stepper.value = num
                }
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func stepValueChanged(sender: UIStepper) {
        let store = NSUbiquitousKeyValueStore.defaultStore()
        store.setDouble(sender.value, forKey:"stepper")
        store.synchronize()
        let num = sender.value;
        self.label.text = "\(num)"
    }
}

