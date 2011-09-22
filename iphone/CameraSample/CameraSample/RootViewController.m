//
//  RootViewController.m
//  CameraSample
//
//  Created by Taisuke Fujita on 11/09/16.
//  Copyright 2011 Commonsense. All rights reserved.
//

#import "RootViewController.h"

@implementation RootViewController

@synthesize cameraView, captureButton, cancelButton;

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"撮影";
    
    session = [[AVCaptureSession alloc] init];
    if ([session canSetSessionPreset:AVCaptureSessionPresetMedium]) {
        session.sessionPreset = AVCaptureSessionPresetMedium;
    }
    // inputの設定
    AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    AVCaptureDeviceInput *input = [AVCaptureDeviceInput deviceInputWithDevice:device error:nil];
    [session addInput:input];
    // outputの設定
    output = [[AVCaptureStillImageOutput alloc] init];
    NSDictionary *outputSettings = [[NSDictionary alloc] initWithObjectsAndKeys:AVVideoCodecJPEG, AVVideoCodecKey, nil];
    output.outputSettings = outputSettings;
    [session addOutput:output];
    // UIViewにレイヤ追加
    AVCaptureVideoPreviewLayer *layer = [AVCaptureVideoPreviewLayer layerWithSession:session];
    layer.videoGravity = AVLayerVideoGravityResizeAspectFill;
    layer.frame = cameraView.bounds;
    [cameraView.layer addSublayer:layer];
    [session startRunning];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

/*
 // Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	// Return YES for supported orientations.
	return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
 */

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Relinquish ownership any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    self.cameraView = nil;
    self.cancelButton = nil;
    self.captureButton = nil;
    [session release];
    [output release];
}

- (void)dealloc
{
    self.cameraView = nil;
    self.cancelButton = nil;
    self.captureButton = nil;
    [session release];
    [output release];
    [super dealloc];
}

-(IBAction)respondToCaptureButtonClick:(id)sender
{
    // find Capture Connection
    AVCaptureConnection *videoConnection;
    for (AVCaptureConnection *conn  in output.connections) {
        for (AVCaptureInputPort *port in [conn inputPorts]) {
            if ([[port mediaType] isEqual:AVMediaTypeVideo]) {
                videoConnection = conn;
                break;
            }
        }
        if (videoConnection) break;
    }
    // Capture image
    [output captureStillImageAsynchronouslyFromConnection:videoConnection completionHandler:
        ^(CMSampleBufferRef imageDataSampleBuffer, NSError *error) {
            if (imageDataSampleBuffer != NULL) {
                NSData *data =[AVCaptureStillImageOutput jpegStillImageNSDataRepresentation:imageDataSampleBuffer];
                capturedImage = [[UIImage alloc] initWithData:data];
                [session stopRunning];
            }
        } 
     ];
    captureButton.enabled = NO;
    cancelButton.enabled = YES;
}

-(IBAction)respondToCancelButtonClick:(id)sender
{
    [capturedImage release];
    [session startRunning];
    captureButton.enabled = YES;
    cancelButton.enabled = NO;
}

@end
