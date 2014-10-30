//
//  NormalOperation.swift
//  NSOperation
//
//  Created by taisuke fujita on 2014/10/04.
//  Copyright (c) 2014年 taisuke fujita. All rights reserved.
//

import UIKit

class NormalOperation: NSOperation {
    override func main() {
        NSLog("isMainThread:\(NSThread.isMainThread())")
        NSLog("Thread:\(NSThread.currentThread())")
        let queue = NSOperationQueue.currentQueue()!
        let ope1 = NestedOperation()
        let ope2 = NestedOperation()
        let ope3 = NestedOperation()
        queue.addOperation(ope1)
        queue.addOperation(ope2)
        queue.addOperation(ope3)
    }
}
