//
//  MapOrverlaySampleViewController.m
//  MapOrverlaySample
//
//  Created by 藤田 泰介 on 10/06/23.
//  Copyright Commonsense 2010. All rights reserved.
//

#import "MapOverlaySampleViewController.h"

@implementation MapOverlaySampleViewController

@synthesize mapView = mapView_;

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
	CLLocationCoordinate2D coors[4];
	// 渋谷、原宿、代々木、新宿
	coors[0] = CLLocationCoordinate2DMake(35.658517, 139.701334);
	coors[1] = CLLocationCoordinate2DMake(35.670168, 139.702687);
	coors[2] = CLLocationCoordinate2DMake(35.683061, 139.702042);
	coors[3] = CLLocationCoordinate2DMake(35.690921, 139.700258);
	// Polyline
	MKPolyline *line = [MKPolyline polylineWithCoordinates:coors count:4];
	[mapView_ addOverlay:line];
	// Polygon
	coors[2] = CLLocationCoordinate2DMake(35.681382, 139.766084);
	MKPolygon *polygon = [MKPolygon polygonWithCoordinates:coors count:4];
	[mapView_ addOverlay:polygon];
	// Circle
	MKCircle *circle = [MKCircle circleWithCenterCoordinate:coors[1] radius:500];
	[mapView_ addOverlay:circle];
	// 地図の設定
	mapView_.delegate = self;
	MKCoordinateRegion region = mapView_.region;
	region.span.latitudeDelta = 0.05; // 地図の表示倍率
	region.span.longitudeDelta = 0.05;
	region.center = coors[1]; // 原宿を画面中央に表示
	[mapView_ setRegion:region animated:YES];
}


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
	[mapView_ release];
    [super dealloc];
}

#pragma mark MKMapViewDelegate methods
- (MKOverlayView *)mapView:(MKMapView *)mapView
			viewForOverlay:(id<MKOverlay>)overlay {
	if ([overlay isKindOfClass:[MKPolyline class]]) {
		MKPolylineView *view = [[[MKPolylineView alloc] initWithOverlay:overlay]
								autorelease];
		view.strokeColor = [UIColor blueColor];
		view.lineWidth = 5.0;
		return view;
	} else if ([overlay isKindOfClass:[MKPolygon class]]) {
		MKPolygonView *view = [[[MKPolygonView alloc] initWithOverlay:overlay]
								autorelease];
		// 塗りつぶしの色を指定
		view.fillColor = [UIColor greenColor];
		return view;
	} else if ([overlay isKindOfClass:[MKCircle class]]) {
		MKCircleView *view = [[[MKCircleView alloc] initWithOverlay:overlay]
							   autorelease];
		view.strokeColor = [UIColor greenColor];
		view.fillColor = [UIColor redColor];
		return view;
	}
    return nil;
}

@end
