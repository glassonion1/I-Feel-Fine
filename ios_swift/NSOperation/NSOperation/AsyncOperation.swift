//
//  AsyncOperation.swift
//  NSOperation
//
//  Created by taisuke fujita on 2014/10/04.
//  Copyright (c) 2014年 taisuke fujita. All rights reserved.
//

import UIKit

class AsyncOperation: NSOperation {
    
    override var executing : Bool {
        get { return _executing }
        set(newValue) {
            willChangeValueForKey("executing")
            _executing = newValue
            didChangeValueForKey("executing")
        }
    }
    private var _executing = false
    
    override var finished : Bool {
        get { return _finished }
        set(newValue) {
            willChangeValueForKey("finished")
            _finished = newValue
            didChangeValueForKey("finished")
        }
    }
    private var _finished = false
    
    override var asynchronous: Bool {
        get{
            return true
        }
    }
    
    override func start() {
        self.executing = true
        
        NSLog("isMainThread:\(NSThread.isMainThread())")
        NSLog("Thread:\(NSThread.currentThread())")
        
        self.executing = false
        self.finished = true
    }
}
