//
//  ViewController.swift
//  TableView
//
//  Created by taisuke fujita on 2014/06/19.
//  Copyright (c) 2014年 taisuke fujita. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    let groupNames = ["ビートルズ", "レッド・ツェッペリン"]
    let groups = [
        ["ジョン・レノン", "ポール・マッカートニー", "ジョージ・ハリスン", "リンゴ・スター"],
        ["ジミー・ペイジ", "ロバート・プラント", "ジョン・ポール・ジョーンズ", "ジョン・ボーナム"]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // ペーストボードを使うサンプル
        let p = UIPasteboard.generalPasteboard();
        p.string = "Hello Pasteboard";
        
        self.tableView.contentInset = UIEdgeInsetsMake(20.0, 0.0, 0.0, 0.0)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return self.groupNames.count
    }
    
    override func tableView(tableView: UITableView,
        numberOfRowsInSection section: Int) -> Int {
            return self.groups[section].count
    }
    
    override func tableView(tableView: UITableView,
        cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath:indexPath) as! UITableViewCell
            cell.textLabel?.text = self.groups[indexPath.section][indexPath.row]
            return cell
    }
    
    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView {
        var view = tableView.dequeueReusableHeaderFooterViewWithIdentifier("Header") as? UITableViewHeaderFooterView
        if view == nil {
            view = UITableViewHeaderFooterView(reuseIdentifier: "Header")
        }
        view!.textLabel.text = self.groupNames[section]
        return view!
    }
    /*
    override func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView {
        var view = tableView.dequeueReusableHeaderFooterViewWithIdentifier("Footer") as? UITableViewHeaderFooterView
        if view == nil {
            view = UITableViewHeaderFooterView(reuseIdentifier: "Footer")
        }
        view!.textLabel.text = "フッター"
        return view!
    }
    
    override func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 44
    }
    */
    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44
    }
}

