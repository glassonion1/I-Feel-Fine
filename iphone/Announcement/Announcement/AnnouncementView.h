//
//  AnnouncementView.h
//  Colopl
//
//  Created by 藤田 泰介 on 11/12/19.
//  Copyright (c) 2011 Commonsense. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AnnouncementView : UIAlertView <UITableViewDataSource, UITableViewDelegate> {
    NSArray *announcements;
}

@property (nonatomic, strong) UITableView *tableView;

@end
