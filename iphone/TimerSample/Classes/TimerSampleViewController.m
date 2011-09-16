//
//  TimerSampleViewController.m
//  TimerSample
//
//  Created by 藤田 泰介 on 10/07/05.
//  Copyright Commonsense 2010. All rights reserved.
//

#import "TimerSampleViewController.h"
#import "SampleViewController.h"

@implementation TimerSampleViewController

@synthesize button = button_;

/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	label_ = [[UILabel alloc] initWithFrame:CGRectMake(0, 40, 100, 42)];
	label_.text = @"Hello World.";
}


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/


- (IBAction)respondToButtonClick:(id)sender {
	SampleViewController *controller = [[SampleViewController alloc] initWithNibName:@"SampleViewController" bundle:nil];
	[self presentModalViewController:controller animated:YES];
	[controller release];
}

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
	[label_ release];
}


- (void)dealloc {
	[button_ release];
	[label_ release];
    [super dealloc];
}

@end
