//
//  ViewController.swift
//  UserDefaults
//
//  Created by taisuke fujita on 2014/08/05.
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

    @IBAction func respondToSaveButtonClick() {
        let defaults = NSUserDefaults.standardUserDefaults()
        // データの作成
        let array: [NSString] = [
            "http://www.apple.com",
            "https://twitter.com/",
            "http://www.9revolution9.com",
        ]
        defaults.setObject(array, forKey: "bookmarks")
        let successful = defaults.synchronize()
        if successful {
            println("データの保存に成功しました。")
        }
    }
    
    @IBAction func respondToLoadButtonClick() {
        let defaults = NSUserDefaults.standardUserDefaults()
        if let bookmarks = defaults.arrayForKey("bookmarks") {
            println(bookmarks)
        }
    }
}

