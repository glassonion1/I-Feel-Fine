//
//  ViewController.swift
//  InAppPurchase
//
//  Created by taisuke fujita on 2014/10/11.
//  Copyright (c) 2014年 taisuke fujita. All rights reserved.
//

import UIKit
import StoreKit

class ViewController: UIViewController, SKProductsRequestDelegate, SKPaymentTransactionObserver {
    
    @IBOutlet weak var label: UILabel!
    
    func productsRequest(request: SKProductsRequest!,
        didReceiveResponse response: SKProductsResponse!) {
            if response.invalidProductIdentifiers.count > 0 {
                let alertController = UIAlertController(title: "課金アイテムチェック",
                    message: "アイテムIDが不正です。",
                    preferredStyle: .Alert)
                let action = UIAlertAction(title: "閉じる", style: .Default, handler: nil)
                alertController.addAction(action)
                self.presentViewController(alertController, animated: true, completion: nil)
                return
            }
            SKPaymentQueue.defaultQueue().addTransactionObserver(self)
            for product in response.products {
                let payment = SKPayment(product: product as! SKProduct)
                SKPaymentQueue.defaultQueue().addPayment(payment)
            }
    }
    
    func paymentQueue(queue: SKPaymentQueue!, updatedTransactions transactions: [AnyObject]!) {
        for transaction in transactions as! [SKPaymentTransaction] {
            switch transaction.transactionState {
            case .Purchasing:
                println("処理中...")
            case .Purchased:
                let url = NSBundle.mainBundle().appStoreReceiptURL
                let data = NSData(contentsOfURL: url!)!
                let base64 = data.base64EncodedStringWithOptions(NSDataBase64EncodingOptions(rawValue:0))
                println(base64)
                queue.finishTransaction(transaction)
            case .Restored:
                queue.finishTransaction(transaction)
            case .Failed:
                println(transaction.error.localizedDescription)
                queue.finishTransaction(transaction)
                if transaction.error.code == SKErrorUnknown {
                    // リストアする
                    SKPaymentQueue.defaultQueue().restoreCompletedTransactions()
                }
                
            default:
                println()
            }
        }
    }
    
    func paymentQueue(queue: SKPaymentQueue!, removedTransactions transactions: [AnyObject]!) {
        for transaction in transactions as! [SKPaymentTransaction] {
            if transaction.transactionState == .Purchased {
                self.label.text = "\(transaction.payment.productIdentifier)"
            }
        }
        SKPaymentQueue.defaultQueue().removeTransactionObserver(self)
    }
    
    func paymentQueue(queue: SKPaymentQueue!, restoreCompletedTransactionsFailedWithError error: NSError!) {
        if queue.transactions.count == 0 {
            SKPaymentQueue.defaultQueue().removeTransactionObserver(self)
        }
    }
    
    func paymentQueueRestoreCompletedTransactionsFinished(queue: SKPaymentQueue!) {
        for transaction in queue.transactions as! [SKPaymentTransaction] {
            if transaction.transactionState == .Purchased {
                self.label.text = "\(transaction.payment.productIdentifier)"
            }
        }
        if queue.transactions.count == 0 {
            SKPaymentQueue.defaultQueue().removeTransactionObserver(self)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if !SKPaymentQueue.canMakePayments() {
            // エラーメッセージを表示する
            let alertController = UIAlertController(title: "課金設定チェック",
                message: "アプリ内課金の使用が制限されています。",
                preferredStyle: .Alert)
            
            let action = UIAlertAction(title: "閉じる", style: .Default, handler: nil)
            alertController.addAction(action)
            self.presentViewController(alertController, animated: true, completion: nil)
            return
        }
        let center = NSNotificationCenter.defaultCenter()
        center.addObserver(self, selector: "applicationDidEnterBackground",
            name: UIApplicationDidEnterBackgroundNotification, object: nil)
        center.addObserver(self, selector: "applicationWillEnterForeground",
            name: UIApplicationWillEnterForegroundNotification, object: nil)
    }
    
    func applicationDidEnterBackground() {
        SKPaymentQueue.defaultQueue().removeTransactionObserver(self)
    }

    func applicationWillEnterForeground() {
        SKPaymentQueue.defaultQueue().addTransactionObserver(self)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func respondToBuyButtonClick() {
        let set = NSSet(objects: "com.9revolution9.removeads")
        let productRequest = SKProductsRequest(productIdentifiers: set as Set<NSObject>)
        productRequest.delegate = self
        productRequest.start()
    }
    
    @IBAction func respondToRestoreButtonClick() {
        SKPaymentQueue.defaultQueue().restoreCompletedTransactions()
    }
}

