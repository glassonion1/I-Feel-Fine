//
//  MapOrverlaySampleViewController.h
//  MapOrverlaySample
//
//  Created by 藤田 泰介 on 10/06/23.
//  Copyright Commonsense 2010. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface MapOverlaySampleViewController : UIViewController <MKMapViewDelegate> {
	MKMapView *mapView_;
}

@property (nonatomic, retain) IBOutlet MKMapView *mapView;

@end

