//
//  ViewController.swift
//  NSOperation
//
//  Created by taisuke fujita on 2014/10/02.
//  Copyright (c) 2014年 taisuke fujita. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //let queue = NSOperationQueue()
        let queue = NSOperationQueue.mainQueue()
        /*
        let ope1 = NormalOperation()
        let ope2 = NormalOperation()
        let ope3 = NormalOperation()
        queue.addOperation(ope1)
        queue.addOperation(ope2)
        queue.addOperation(ope3)
        */
        queue.addOperationWithBlock {
            NSLog("isMainThread:\(NSThread.isMainThread())")
            NSLog("Thread:\(NSThread.currentThread())")
        }
        queue.addOperationWithBlock {
            NSLog("isMainThread:\(NSThread.isMainThread())")
            NSLog("Thread:\(NSThread.currentThread())")
        }
        queue.addOperationWithBlock {
            NSLog("isMainThread:\(NSThread.isMainThread())")
            NSLog("Thread:\(NSThread.currentThread())")
        }
        
        /*
        let ope1 = AsyncOperation()
        let ope2 = AsyncOperation()
        let ope3 = AsyncOperation()
        queue.addOperation(ope1)
        queue.addOperation(ope2)
        queue.addOperation(ope3)
        ope1.addObserver(self, forKeyPath: "finished", options: .New, context: nil)
        ope2.addObserver(self, forKeyPath: "finished", options: .New, context: nil)
        ope3.addObserver(self, forKeyPath: "finished", options: .New, context: nil)
        */
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func observeValueForKeyPath(keyPath: (String!),
        ofObject object: AnyObject,
        change: [NSObject : AnyObject],
        context: UnsafeMutablePointer<Void>) {
            NSLog("Operation end");
            object.removeObserver(self, forKeyPath: keyPath)
    }

}

