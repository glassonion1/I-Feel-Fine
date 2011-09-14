//
//  SortableView.h
//  GestureSample
//
//  Created by Taisuke Fujita on 11/08/30.
//  Copyright 2011 Commonsense. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface SortableView : UIView {
    UIImageView *imageView;
    UIButton *deleteButton;
}

@property (nonatomic, retain) IBOutlet UIImageView *imageView;
@property (nonatomic, retain) IBOutlet UIButton *deleteButton;

- (void)startAnimation;
- (void)stopAnimation;

@end
