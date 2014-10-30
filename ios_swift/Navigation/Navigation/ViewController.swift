//
//  ViewController.swift
//  Navigation
//
//  Created by taisuke fujita on 2014/06/26.
//  Copyright (c) 2014年 taisuke fujita. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    let groupNames = ["ビートルズ", "レッド・ツェッペリン"]
    let groups = [
        ["ジョン・レノン", "ポール・マッカートニー", "ジョージ・ハリスン", "リチャード・スターキー"],
        ["ジミー・ペイジ", "ロバート・プラント", "ジョン・ポール・ジョーンズ", "ジョン・ボーナム"]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
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
            let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath:indexPath) as UITableViewCell
            cell.textLabel.text = self.groups[indexPath.section][indexPath.row]
            return cell
    }
    
    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView {
        var view = tableView.dequeueReusableHeaderFooterViewWithIdentifier("Header") as UITableViewHeaderFooterView?
        if view == nil {
            view = UITableViewHeaderFooterView(reuseIdentifier: "Header") as UITableViewHeaderFooterView
        }
        view!.textLabel.text = self.groupNames[section]
        return view!
    }
    
    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44
    }
}

