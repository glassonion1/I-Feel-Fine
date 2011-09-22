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
    UIBarButtonItem *captureButton;
    UIBarButtonItem *cancelButton;
    AVCaptureSession *session;
    AVCaptureStillImageOutput *output;
    UIImage *capturedImage;
}

@property (nonatomic, retain) IBOutlet UIView *cameraView;
@property (nonatomic, retain) IBOutlet UIBarButtonItem *captureButton;
@property (nonatomic, retain) IBOutlet UIBarButtonItem *cancelButton;

-(IBAction)respondToCaptureButtonClick:(id)sender;

-(IBAction)respondToCancelButtonClick:(id)sender;

@end
