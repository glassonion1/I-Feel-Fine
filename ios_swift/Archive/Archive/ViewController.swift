//
//  ViewController.swift
//  Archive
//
//  Created by taisuke fujita on 2014/07/07.
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

    @IBAction func respondToArchiveButton() {
        let arr = ["aaa", "bbb"] as Array
        let paths = NSSearchPathForDirectoriesInDomains(
            .DocumentDirectory,
            .UserDomainMask, true) as [String]
        let filePath = String(paths[0]) + "data.dat"
        let array = ["山田太郎", "104-0061", "東京都", "中央区", "銀座1丁目"]
        let successful = NSKeyedArchiver.archiveRootObject(array, toFile: filePath)
        if successful {
            println("データの保存に成功しました。")
        }
    }
    
    @IBAction func respondToUnarchiveButton() {
        let paths = NSSearchPathForDirectoriesInDomains(
            .DocumentDirectory,
            .UserDomainMask, true) as Array<String>
        let filePath = String(paths[0]) + "data.dat"
        if let array = NSKeyedUnarchiver.unarchiveObjectWithFile(filePath) as? Array<String> {
            for str in array {
                println(str)
            }
        } else {
            println("データがありません")
        }
    }
}

