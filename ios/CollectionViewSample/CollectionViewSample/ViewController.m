//
//  ViewController.m
//  CollectionViewSample
//
//  Created by fujita taisuke on 2012/11/19.
//  Copyright (c) 2012年 Revolution 9. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section
{
    return 32;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:@"Cell"
                                                                                forIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(5, 5, 40, 40)];
    label.text = [NSString stringWithFormat:@"Cell %d", indexPath.row];
    label.font = [UIFont systemFontOfSize:12];
    [cell addSubview:label];
    return cell;
}

@end
