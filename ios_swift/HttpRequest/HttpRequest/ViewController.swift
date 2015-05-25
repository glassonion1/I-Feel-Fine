//
//  ViewController.swift
//  NSOperation2
//
//  Created by taisuke fujita on 2014/10/05.
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
    
    @IBAction func respndToButtonClick() {
        let queue = NSOperationQueue()
        let ope = HttpOperation(url: NSURL(string: "http://www.apple.com")!)
        queue.addOperation(ope)
        ope.addObserver(self, forKeyPath: "finished", options: .New, context: nil)
    }
    
    override func observeValueForKeyPath(keyPath: (String!),
        ofObject object: AnyObject,
        change: [NSObject : AnyObject],
        context: UnsafeMutablePointer<Void>) {
            let ope = object as! HttpOperation
            let responseString: String = NSString(data: ope.responseData, encoding:NSUTF8StringEncoding) as String!
            println(responseString)
            object.removeObserver(self, forKeyPath: keyPath)
    }
}

