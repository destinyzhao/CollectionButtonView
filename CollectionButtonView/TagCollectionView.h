//
//  TagCollectionView.h
//  CollectionButtonView
//
//  Created by Alex on 16/6/12.
//  Copyright © 2016年 Alex. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^TagSelectedBlock)(NSInteger selectIndex);

@interface TagCollectionView : UIView
/**
 *  默认选中tag
 */
@property (assign, nonatomic) NSInteger tagButtonSelectedIndex;
/**
 *  Block
 */
@property (copy, nonatomic) TagSelectedBlock tagSelectedBlock;
/**
 *  tag Array
 */
@property (strong, nonatomic) NSArray *tagArray;

@end
