//
//  ViewController.swift
//  PropertyList3
//
//  Created by taisuke fujita on 2014/07/25.
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

    @IBAction func respondToLoadButtonClick() {
        // プロジェクトに保存されたプロパティリストのパスを取得する
        let filePath = NSBundle.mainBundle().pathForResource("sample", ofType: "plist")
        // データをプロパティリストから読み込む
        let array = NSArray(contentsOfFile: filePath!)!
        for data in array {
            println(data)
        }
    }
}

