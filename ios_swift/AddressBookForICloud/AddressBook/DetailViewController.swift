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
            if let cell = self.tableView.cellForRowAtIndexPath(indexPath) {
                let key = label["id"]
                if let editView = cell.contentView.viewWithTag(2) as? UITextField {
                    self.detailItem?.setValue(editView.text, forKeyPath: key)
                }
            }
        }
        self.detailItem?.managedObjectContext.save(nil)
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
            let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell
            let label = labels[indexPath.row] as Dictionary;
            if let titleView = cell.contentView.viewWithTag(1) as? UILabel {
                titleView.text = label["title"];
            }
            if let editView = cell.contentView.viewWithTag(2) as? UITextField {
                let key = label["id"];
                if let obj: AnyObject = self.detailItem?.valueForKeyPath(key) {
                    editView.text = obj.description;
                }
            }
            return cell
    }
}

