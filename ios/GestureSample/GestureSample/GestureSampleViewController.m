//
//  GestureSampleViewController.m
//  GestureSample
//
//  Created by Taisuke Fujita on 11/08/30.
//  Copyright 2011 Commonsense. All rights reserved.
//

#import "GestureSampleViewController.h"
#import "SortableView.h"

@implementation GestureSampleViewController

@synthesize scrollView;

- (void)dealloc
{
    self.scrollView = nil;
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    longPressed = NO;
    scrollView.scrollsToTop = NO;
    scrollView.pagingEnabled = YES;
    int screenWidth = [[UIScreen mainScreen] bounds].size.width;
    int viewSide = 80;
    int numOfViews = 7;
    for (int i = 0; i < numOfViews; i++) {
        SortableView *view = [[SortableView alloc] initWithFrame:CGRectMake(viewSide * i, 0, viewSide, viewSide)];
        UILongPressGestureRecognizer *longPressGesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self 
                                                                                                       action:@selector(respondToLongPressGesture:)];
        longPressGesture.delegate = self;
        [view addGestureRecognizer:longPressGesture];
        [longPressGesture release];
        UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self
                                                                                     action:@selector(respondToPanGesture:)];
        panGesture.delegate = self;
        [view addGestureRecognizer:panGesture];
        [panGesture release];
        [scrollView addSubview:view];
        [view release];
    }
    int numOfPages = ((numOfViews + 3) / (screenWidth / 80));
    scrollView.contentSize = CGSizeMake(screenWidth * numOfPages, viewSide);
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    self.scrollView = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    return YES;
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    if ([gestureRecognizer isKindOfClass:[UIPanGestureRecognizer class]]) {
        if (!longPressed) {
            return NO;
        }
    }
    return YES;
}

- (void)respondToLongPressGesture:(UIPanGestureRecognizer *)sender {
    if  (sender.state == UIGestureRecognizerStateBegan) {
        longPressed = YES;
        scrollView.scrollEnabled = NO;
        for (id view in scrollView.subviews) {
            [view startAnimation];
        }
    }
}

- (void)respondToPanGesture:(UIPanGestureRecognizer *)sender {
    CGPoint point = [sender locationInView:scrollView];
    SortableView *v = (SortableView *)sender.view;
    int screenWidth = [[UIScreen mainScreen] bounds].size.width;
    int viewWidth = v.frame.size.width;
    int contentOffsetX = scrollView.contentOffset.x;
    int pointX = point.x - contentOffsetX;
    if  (sender.state == UIGestureRecognizerStateBegan) {
        [v stopAnimation];
    } else if  (sender.state == UIGestureRecognizerStateChanged) {
        if (pointX <= viewWidth / 2) {
            if (contentOffsetX >= screenWidth) {
                // 前のページへスクロール
                scrollView.contentOffset = CGPointMake(contentOffsetX -  screenWidth, scrollView.contentOffset.y);
            }
        } else if (pointX >= screenWidth - (viewWidth / 2)) {
            if (scrollView.contentSize.width >= screenWidth) {
                CGFloat newOffsetX = contentOffsetX + screenWidth;
                if (newOffsetX < scrollView.contentSize.width) {
                    // 後のページへスクロール
                    scrollView.contentOffset = CGPointMake(newOffsetX, scrollView.contentOffset.y);
                }
            }
        }
        v.center = CGPointMake(point.x, point.y);
    } else if (sender.state == UIGestureRecognizerStateEnded) {
        int firstIconX = viewWidth / 2;
        int secondIconX = firstIconX + viewWidth;
        int thirdIconX = secondIconX + viewWidth;
        int fourthIconX = thirdIconX + viewWidth;
        int distance1 = ABS(firstIconX - pointX);
        int distance2 = ABS(secondIconX - pointX);
        int distance3 = ABS(thirdIconX - pointX);
        int distance4 = ABS(fourthIconX - pointX);
        int approximation = MIN(MIN(distance1, distance2), MIN(distance3, distance4));
        int newX = firstIconX;
        if (approximation == distance2) {
            newX = secondIconX;
        } else if (approximation == distance3) {
            newX = thirdIconX;
        } else if (approximation == distance4) {
            newX = fourthIconX;
        }
        v.center = CGPointMake(contentOffsetX + newX, v.frame.size.height / 2);
        longPressed = NO;
        scrollView.scrollEnabled = YES;
        for (id view in scrollView.subviews) {
            [view stopAnimation];
        }
    }
}

@end
