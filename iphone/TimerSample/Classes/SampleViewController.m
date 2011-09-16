//
//  SampleViewController.m
//  TimerSample
//
//  Created by 藤田 泰介 on 10/07/06.
//  Copyright 2010 Commonsense. All rights reserved.
//

#import "SampleViewController.h"


@implementation SampleViewController

@synthesize label = label_;

/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)viewWillAppear:(BOOL)animated {
	NSLog(@"self retainCount:%d", [self retainCount]);
	// autoreleaseも不要
	timer_ = [NSTimer scheduledTimerWithTimeInterval:100
											  target:self
											selector:@selector(onTime)
											userInfo:nil
											 repeats:YES];
	NSLog(@"timer retainCount:%d", [timer_ retainCount]);
	NSLog(@"self retainCount:%d", [self retainCount]);
	count = 0;
}

- (void)onTime {
	NSString *text = [NSString stringWithFormat:@"%d", count++];
	label_.text = text;
}

- (void)viewDidDisappear:(BOOL)animated {
	NSLog(@"self retainCount:%d", [self retainCount]);
	// relase不要(releaseするとアプリが落ちる)。
	NSLog(@"timer retainCount:%d", [timer_ retainCount]);
	if (timer_) [timer_ invalidate];
	NSLog(@"timer retainCount:%d", [timer_ retainCount]);
	NSLog(@"self retainCount:%d", [self retainCount]);
	timer_ = nil;
}

- (IBAction)respondToButtonClick:(id)sender {
	[self dismissModalViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
	[label_ release];
    [super dealloc];
}


@end
