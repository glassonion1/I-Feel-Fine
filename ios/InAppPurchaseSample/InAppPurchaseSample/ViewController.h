//
//  ViewController.h
//  InAppPurchaseSample
//
//  Created by fujita taisuke on 2012/10/26.
//  Copyright (c) 2012年 Revolution 9. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <StoreKit/StoreKit.h>

@interface ViewController : UIViewController <UIAlertViewDelegate, SKProductsRequestDelegate, SKPaymentTransactionObserver>

@property (nonatomic, weak) IBOutlet UILabel *label;

- (IBAction)respondToBuyBottonClick:(id)sender;
- (IBAction)respondToRestoreBottonClick:(id)sender;

@end
