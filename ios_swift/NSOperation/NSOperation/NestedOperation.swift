//
//  NormalOperation.swift
//  NSOperation
//
//  Created by taisuke fujita on 2014/10/04.
//  Copyright (c) 2014年 taisuke fujita. All rights reserved.
//

import UIKit

class NestedOperation: NSOperation {
    override func main() {
        NSLog("Nested isMainThread:\(NSThread.isMainThread())")
        NSLog("Nested Thread:\(NSThread.currentThread())")
    }
}
