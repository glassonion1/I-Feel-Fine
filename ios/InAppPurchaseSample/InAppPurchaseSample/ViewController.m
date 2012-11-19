//
//  ViewController.m
//  InAppPurchaseSample
//
//  Created by fujita taisuke on 2012/10/26.
//  Copyright (c) 2012年 Revolution 9. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)respondToBuyBottonClick:(id)sender
{
    if (![SKPaymentQueue canMakePayments]) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"エラー"
                                                        message:@"アプリ内課金の使用が制限されています。"
                                                       delegate:nil
                                              cancelButtonTitle:nil
                                              otherButtonTitles:@"OK", nil];
        [alert show];
        return;
    }
    NSSet *set = [NSSet setWithObjects:@"com.9revolution9.adsremover", nil];
    SKProductsRequest *productsRequest = [[SKProductsRequest alloc] initWithProductIdentifiers:set];
    productsRequest.delegate = self;
    [productsRequest start];
}

- (IBAction)respondToRestoreBottonClick:(id)sender
{
    [[SKPaymentQueue defaultQueue] restoreCompletedTransactions];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    // 途中で止まった処理を再開する Consumable アイテムにも有効
    [[SKPaymentQueue defaultQueue] restoreCompletedTransactions];
}

- (void)productsRequest:(SKProductsRequest *)request didReceiveResponse:(SKProductsResponse *)response {
    // 無効なアイテムがないかチェック
    if ([response.invalidProductIdentifiers count] > 0) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"エラー"
                                                        message:@"アイテムIDが不正です。"
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil, nil];
        [alert show];
        return;
    }
    // 購入処理開始
    [[SKPaymentQueue defaultQueue] addTransactionObserver:self];
    for (SKProduct *product in response.products) {
        SKPayment *payment = [SKPayment paymentWithProduct:product];
        [[SKPaymentQueue defaultQueue] addPayment:payment];
    }
}

- (void)applicationDidEnterBackground
{
    // リストア処理開始
    [[SKPaymentQueue defaultQueue] removeTransactionObserver:self];
}

- (void)applicationWillEnterForeground
{
    [[SKPaymentQueue defaultQueue] addTransactionObserver:self];
}

- (void)paymentQueue:(SKPaymentQueue *)queue updatedTransactions:(NSArray *)transactions {
    for (SKPaymentTransaction *transaction in transactions) {
        if (transaction.transactionState == SKPaymentTransactionStatePurchasing) {
             // 購入処理中
        } else if (transaction.transactionState == SKPaymentTransactionStatePurchased) {
            [queue finishTransaction:transaction];
        } else if (transaction.transactionState == SKPaymentTransactionStateFailed) {
            [queue finishTransaction:transaction];
            if (transaction.error.code == SKErrorUnknown) {
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"処理が途中中断されました"
                                                                message:[transaction.error localizedDescription]
                                                               delegate:self
                                                      cancelButtonTitle:nil
                                                      otherButtonTitles:@"OK", nil];
                [alert show];
            }
        } else {
            // 復帰処理完了
            [queue finishTransaction:transaction];
        }
    }
}

- (void)paymentQueue:(SKPaymentQueue *)queue removedTransactions:(NSArray *)transactions
{
    for (SKPaymentTransaction *transaction in transactions) {
        if (transaction.transactionState == SKPaymentTransactionStatePurchased) {
            self.label.text = @"購入しました。";
        }
    }
    [[SKPaymentQueue defaultQueue] removeTransactionObserver:self];
}

- (void)paymentQueue:(SKPaymentQueue *)queue restoreCompletedTransactionsFailedWithError:(NSError *)error
{
    if ([queue.transactions count] == 0) {
        [[SKPaymentQueue defaultQueue] removeTransactionObserver:self];
    }
}

- (void)paymentQueueRestoreCompletedTransactionsFinished:(SKPaymentQueue *)queue
{
    for (SKPaymentTransaction *transaction in queue.transactions) {
        if (transaction.transactionState == SKPaymentTransactionStatePurchased) {
            self.label.text = @"リストアしました。";
        }
    }
    if ([queue.transactions count] == 0) {
        [[SKPaymentQueue defaultQueue] removeTransactionObserver:self];
    }
}

@end
