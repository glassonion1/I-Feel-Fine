//
//  RootViewController.h
//  CameraSample
//
//  Created by Taisuke Fujita on 11/09/16.
//  Copyright 2011 Commonsense. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface RootViewController : UIViewController {
    UIView *cameraView;
    AVCaptureSession *session;
}

@property (nonatomic, retain) IBOutlet UIView *cameraView;

@end
