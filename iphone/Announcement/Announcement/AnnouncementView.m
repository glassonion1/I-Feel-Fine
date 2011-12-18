//
//  AnnouncementView.m
//  Colopl
//
//  Created by 藤田 泰介 on 11/12/19.
//  Copyright (c) 2011 Commonsense. All rights reserved.
//

#import "AnnouncementView.h"
#import <QuartzCore/QuartzCore.h>

@implementation AnnouncementView

@synthesize tableView = _tableView;

- (id)initWithTitle:(NSString *)title message:(NSString *)message delegate:(id)delegate 
    cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSString *)otherButtonTitles, ...
{
    self = [super initWithTitle:title 
                        message:message 
                       delegate:delegate 
              cancelButtonTitle:cancelButtonTitle 
              otherButtonTitles:otherButtonTitles, nil];
    if (self) {
        NSURL *url = [[NSBundle mainBundle] URLForResource:@"Announcement" withExtension:@"plist"];
        announcements = [[NSArray alloc] initWithContentsOfURL:url];
        self.tableView = [[[UITableView alloc] initWithFrame:CGRectMake(12 , 80, 260, 176) style:UITableViewStylePlain] autorelease];
        self.tableView.dataSource = self;
        self.tableView.delegate = self;
        self.tableView.layer.cornerRadius = 4;
        [self insertSubview:self.tableView atIndex:2];
    }
    return self;
}

- (void)dealloc
{
    [announcements release];
    self.tableView = nil;
    [super dealloc];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (void)show
{
    [super show];
    NSInteger offsetY = self.tableView.frame.origin.y;
    NSInteger offsetH = self.tableView.frame.size.height;
    const NSInteger padding = 20;
    CGRect frame = self.frame;
	frame.origin.y -= offsetH / 2;
    CGRect prevFrame;
	for (UIView *view in self.subviews) {
		CGRect viewFrame = view.frame;
        if (offsetY <= viewFrame.origin.y) {
            viewFrame.origin.y = prevFrame.origin.y + prevFrame.size.height + padding;
            view.frame = viewFrame;
            frame.size.height += viewFrame.size.height;
        }
        prevFrame = viewFrame;
	}
    self.frame = frame;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [announcements count];
}

- (UITableViewCell *)tableView:(UITableView *)tv cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tv dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.textLabel.font = [UIFont fontWithName:@"Helvetica" size:12];
        cell.textLabel.numberOfLines = 2;
    }
    cell.textLabel.text = [announcements objectAtIndex:indexPath.row];
    return cell;
}

@end
