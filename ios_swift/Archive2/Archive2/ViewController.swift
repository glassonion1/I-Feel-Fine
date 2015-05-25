//
//  ViewController.swift
//  Archive2
//
//  Created by taisuke fujita on 2014/07/09.
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
        // 山田太郎、花子オブジェクト(住所が同じ夫婦という設定)
        let address1 = Address(zipCode: "104-0061",
            state: "東京都", city: "中央区", other: "銀座1丁目")
        let taroYamada = Person(name: "山田太郎", address: address1)
        let hanakoYamada = Person(name: "山田花子", address: address1)
        // 田中次郎オブジェクト
        let address2 = Address(zipCode: "604-8126",
            state: "京都府", city: "京都市", other: "中京区")
        let jiroTanaka = Person(name: "田中次郎", address: address2)
        // 保存するデータを配列にまとめる
        let people = [taroYamada, hanakoYamada, jiroTanaka]
        // 保存するファイルの設定
        let paths = NSSearchPathForDirectoriesInDomains(
            .DocumentDirectory,
            .UserDomainMask, true) as! [String]
        //let filePath = String(paths[0]) + "data.dat"
        let filePath = String(paths[0]).stringByAppendingPathComponent("data.plist")
        // アーカイブしてファイルに保存
        let successful = NSKeyedArchiver.archiveRootObject(people, toFile: filePath)
        if successful {
            println("データの保存に成功しました。")
        }
    }
    
    @IBAction func respondToUnarchiveButton() {
        // 保存するファイルの設定
        let paths = NSSearchPathForDirectoriesInDomains(
            .DocumentDirectory,
            .UserDomainMask, true) as! [String]
        //let filePath = String(paths[0]) + "data.dat"
        let filePath = String(paths[0]).stringByAppendingPathComponent("data.plist")
        // アンアーカイブする
        let array = NSKeyedUnarchiver.unarchiveObjectWithFile(filePath) as! Array<Person>
        for person in array {
            println(person.name)
            println(person.address.zipCode)
            println(person.address.state)
            println(person.address.city)
            println(person.address.other)
        }
    }

}

