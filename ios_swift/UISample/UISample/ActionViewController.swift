//
//  ActionViewController.swift
//  UISample
//
//  Created by taisuke fujita on 2014/10/19.
//  Copyright (c) 2014年 taisuke fujita. All rights reserved.
//

import UIKit

class ActionViewController: UIViewController {

    @IBAction func respondToButtonClick(sender: UIButton) {
        let alertController = UIAlertController(title: "",
            message: "画像を選択してください。",
            preferredStyle: .ActionSheet)
        
        let cancelAction = UIAlertAction(title: "キャンセル", style: .Cancel, handler: nil)
        let rollAction = UIAlertAction(title: "カメラロールから", style: .Default, handler: nil)
        let selectAction = UIAlertAction(title: "既存の画像を選ぶ", style: .Default, handler: nil)
        alertController.addAction(cancelAction)
        alertController.addAction(rollAction)
        alertController.addAction(selectAction)
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
