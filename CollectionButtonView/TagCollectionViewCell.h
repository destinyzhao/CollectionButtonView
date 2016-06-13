//
//  TagCollectionViewCell.h
//  CollectionButtonView
//
//  Created by Alex on 16/6/12.
//  Copyright © 2016年 Alex. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^TagButtonSlectedBlock)(NSInteger selectIndex);

@interface TagCollectionViewCell : UICollectionViewCell
/**
 *  是否选中
 */
@property (assign, nonatomic) BOOL tagButtonSelected;
/**
 *  clicked tagbutton Block
 */
@property (copy, nonatomic) TagButtonSlectedBlock tagButtonSlectedBlock;
/**
 *  tag button title
 */
@property (copy, nonatomic) NSString *tagButtonTitle;

@end
