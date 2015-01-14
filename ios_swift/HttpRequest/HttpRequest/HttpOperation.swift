//
//  AsyncOperation.swift
//  NSOperation
//
//  Created by taisuke fujita on 2014/10/04.
//  Copyright (c) 2014年 taisuke fujita. All rights reserved.
//

import UIKit

class HttpOperation: NSOperation, NSURLConnectionDataDelegate {
    
    private let url: NSURL;
    var responseData = NSMutableData();
    
    init(url: NSURL) {
        self.url = url;
    }
    
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
        
        let request = NSURLRequest(URL: self.url)
        let conn = NSURLConnection(request: request, delegate: self)
        
        do {
            NSRunLoop.currentRunLoop().runMode(NSDefaultRunLoopMode,
                beforeDate: NSDate(timeIntervalSinceReferenceDate: 0.1))
        } while (self.executing)
    }
    
    func connection(connection: NSURLConnection,
        didReceiveData data: NSData) {
            self.responseData.appendData(data)
    }
    
    func connectionDidFinishLoading(connection: NSURLConnection) {
        self.executing = false
        self.finished = true
    }
}
