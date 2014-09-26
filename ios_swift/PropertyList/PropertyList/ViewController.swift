//
//  ViewController.swift
//  PropertyList
//
//  Created by taisuke fujita on 2014/07/14.
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
        // 保存するファイルの設定(拡張子はplist)
        let paths = NSSearchPathForDirectoriesInDomains(
            .DocumentDirectory,
            .UserDomainMask, true) as [String]
        let filePath = String(paths[0]) + "data.plist"
        // 都道府県データ(NSArray型にキャストする)
        let array = ["北海道", "青森県", "岩手県", "秋田県", "宮城県", "山形県"] as NSArray
        let successful = array.writeToFile(filePath, atomically: false)
        if successful {
            println("データの保存に成功しました。")
        }
    }
    
    @IBAction func respondToLoadButtonClick() {
        // 保存するファイルの設定(拡張子はplist)
        let paths = NSSearchPathForDirectoriesInDomains(
            .DocumentDirectory,
            .UserDomainMask, true) as [String]
        let filePath = String(paths[0]) + "data.plist"
        // データをプロパティリストから読み込む
        let array = NSArray(contentsOfFile: filePath)
        for data in array {
            println(data)
        }
    }
}

