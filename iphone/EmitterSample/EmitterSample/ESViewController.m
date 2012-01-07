//
//  ESViewController.m
//  EmitterSample
//
//  Created by 藤田 泰介 on 12/01/07.
//  Copyright (c) 2012 Commonsense. All rights reserved.
//

#import "ESViewController.h"

@implementation ESViewController

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    emitterLayers = [NSMutableArray array];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    emitterLayers = nil;
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

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation == UIInterfaceOrientationPortrait);
    } else {
        return YES;
    }
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    // Particle
    CGPoint pt = [[touches anyObject] locationInView:self.view];
    emitterLayer = [CAEmitterLayer layer];
    emitterLayer.emitterPosition = pt;
    emitterLayer.emitterShape = kCAEmitterLayerCircle;
    emitterLayer.renderMode = kCAEmitterLayerOldestFirst;
    emitterLayer.emitterSize = CGSizeMake(3.0, 3.0);
    CAEmitterCell *cell = [CAEmitterCell emitterCell];
    cell.lifetime = 0.7f;
    cell.contents = (id)[[UIImage imageNamed:@"ring"] CGImage];
    cell.scale = 1.0f;
    cell.velocity = 20.0f;
    cell.scaleSpeed = -1.5f;
    [cell setName:@"ring"];
    emitterLayer.emitterCells = [NSArray arrayWithObject:cell];
    [self.view.layer addSublayer:emitterLayer];
    
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [emitterLayer removeFromSuperlayer];
    emitterLayer = nil;
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    CGPoint pt = [[touches anyObject] locationInView:self.view];
    [CATransaction begin];
    [CATransaction setValue:(id)kCFBooleanTrue forKey:kCATransactionDisableActions];
    CAEmitterCell *cell = [emitterLayer.emitterCells objectAtIndex:0];
    cell.birthRate = 100.0;
    emitterLayer.emitterPosition = pt;
    [CATransaction commit];
    [self performSelector:@selector(hideEffect:) withObject:nil afterDelay:0.1];
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self touchesEnded:touches withEvent:event];
}

- (void)hideEffect:(CAEmitterCell *)cell {
    [emitterLayer setValue:[NSNumber numberWithFloat:0.0f] forKeyPath:@"emitterCells.ring.birthRate"];
}

@end
