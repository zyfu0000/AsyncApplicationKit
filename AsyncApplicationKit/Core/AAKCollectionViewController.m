//
//  AAKCollectionViewController.m
//  AsyncApplicationKit
//
//  Created by Zhiyang Fu on 2018/10/30.
//  Copyright © 2018 Zhiyang Fu. All rights reserved.
//

#import "AAKCollectionViewController.h"

@interface AAKCollectionViewController ()

@end

@implementation AAKCollectionViewController

- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeZero;
}

- (void)collectionView:(UICollectionView *)collectionView
       willDisplayCell:(UICollectionViewCell *)cell
    forItemAtIndexPath:(NSIndexPath *)indexPath
{

}

- (void)collectionView:(UICollectionView *)collectionView
  didEndDisplayingCell:(UICollectionViewCell *)cell
    forItemAtIndexPath:(NSIndexPath *)indexPath
{
    
}

@end
