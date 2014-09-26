//
//  ModalViewController.swift
//  SharedData
//
//  Created by taisuke fujita on 2014/07/02.
//  Copyright (c) 2014年 taisuke fujita. All rights reserved.
//

import UIKit

class ModalViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let app = UIApplication.sharedApplication().delegate as AppDelegate
        let item1 : AnyObject? = app.sharedData["item1"]
        println(item1)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // #pragma mark - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue?, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
