//
//  DetailViewController.swift
//  AddressBook
//
//  Created by taisuke fujita on 2014/08/10.
//  Copyright (c) 2014年 taisuke fujita. All rights reserved.
//

import UIKit

class DetailViewController: UITableViewController {
    
    var detailItem: Person?
    let labels: [[String: String]] = [
        ["id": "name", "title": "名前"],
        ["id": "address.zipCode", "title":"郵便番号"],
        ["id": "address.state", "title": "都道府県"],
        ["id": "address.city", "title": "市町村"],
        ["id": "address.other", "title": "その他住所"]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        for (i, label) in enumerate(self.labels) {
            let indexPath = NSIndexPath(forRow: i, inSection: 0)
            // テーブルセルのオブジェクトを取得する
            if let cell = self.tableView.cellForRowAtIndexPath(indexPath) {
                let key = label["id"]
                // テキストフィールドオブジェクトを取得する
                if let editView = cell.contentView.viewWithTag(2) as? UITextField {
                    // テキストフィールドオブジェクトの内容をPersonオブジェクトに設定する
                    self.detailItem?.setValue(editView.text, forKeyPath: key!)
                }
            }
        }
        // データの変更を保存する
        if let item = self.detailItem {
           item.managedObjectContext!.save(nil)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.labels.count;
    }
    
    override func tableView(tableView: UITableView,
        cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
            // テーブルセルオブジェクトの取得
            let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell
            // ラベル
            let label = labels[indexPath.row] as Dictionary;
            // ストーリーボード上で設置したラベルオブジェクトをタグを使って取得する
            if let titleView = cell.contentView.viewWithTag(1) as? UILabel {
                titleView.text = label["title"];
            }
            // ストーリーボード上で設置したテキストフィールドオブジェクトをタグを使って取得する
            if let editView = cell.contentView.viewWithTag(2) as? UITextField {
                let key = label["id"];
                // Personオブジェクトに格納されているデータをテキストフィールドに表示する
                if let item = self.detailItem {
                    if let obj: AnyObject = item.valueForKeyPath(key!) {
                        editView.text = obj.description;
                    }
                }

            }
            return cell
    }
}

