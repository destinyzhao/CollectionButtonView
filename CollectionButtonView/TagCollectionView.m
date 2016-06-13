//
//  TagCollectionView.m
//  CollectionButtonView
//
//  Created by Alex on 16/6/12.
//  Copyright © 2016年 Alex. All rights reserved.
//

#import "TagCollectionView.h"
#import "TagCollectionViewCell.h"

#define WeakSelf(weakSelf)  __weak __typeof(&*self)weakSelf = self;

@interface TagCollectionView ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (strong,nonatomic) UICollectionView  *collectionView;

@end

@implementation TagCollectionView


- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setupView];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupView];
    }
    return self;
}

- (void)setupView
{
    
    //1.初始化layout
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.itemSize = CGSizeMake(self.frame.size.width/3, 40);
    flowLayout.minimumInteritemSpacing = 0;
    flowLayout.minimumLineSpacing = 0; //上下的间距 可以设置0看下效果
    flowLayout.sectionInset = UIEdgeInsetsMake(0.f, 0, 9.f, 0);
    
    //2.初始化collectionView
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
    _collectionView.backgroundColor = [UIColor yellowColor];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    [self addSubview:_collectionView];
    
    // 注册cell
    UINib *nib = [UINib nibWithNibName:@"TagCollectionViewCell"
                                bundle: [NSBundle mainBundle]];
    [_collectionView registerNib:nib forCellWithReuseIdentifier:@"tagCollectionViewCell"];

}

- (void)layoutSubviews
{
    [super layoutSubviews];
    _collectionView.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
}

#pragma mark -
#pragma mark - <UICollectionViewDataSource>
// 返回collection view里区section的个数
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

// 返回指定区section包含的Items
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _tagArray.count;
}

#pragma mark -
#pragma mark - <UICollectionViewDelegate>
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    return  [self getCollectionCellWithIndexPatch:indexPath];
}

// 定义每个UICollectionViewCell 的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(self.frame.size.width/3.0 - 15, 40);
}

//定义每个UICollectionView 纵向的间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 0;
}


//设置每个item水平间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 5;
}

// 定义每个Section 的 margin
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, 0, 0, 0);
}

- (UICollectionViewCell *)getCollectionCellWithIndexPatch:(NSIndexPath *)indexPath
{
    WeakSelf(weakSelf);
    //重用cell
    TagCollectionViewCell *myCell = [_collectionView
                                     dequeueReusableCellWithReuseIdentifier:@"tagCollectionViewCell"
                                     forIndexPath:indexPath];
    myCell.tag = indexPath.row;
    myCell.tagButtonTitle = _tagArray[indexPath.row];
    
    if (indexPath.row == _tagButtonSelectedIndex) {
        myCell.tagButtonSelected = YES;
    }
    
    // tag Button clicked Block
    myCell.tagButtonSlectedBlock = ^(NSInteger selectIndex){
        
        // 获取当前cell
        TagCollectionViewCell *cell = (TagCollectionViewCell*)[_collectionView cellForItemAtIndexPath:indexPath];
        
        // Block 回调
        if (weakSelf.tagSelectedBlock != nil) {
            weakSelf.tagSelectedBlock(selectIndex);
        }
        
        // 循环取消选tag button 选中
        for (NSIndexPath *index in [_collectionView indexPathsForVisibleItems])
        {
            TagCollectionViewCell *myCell = (TagCollectionViewCell*)[_collectionView cellForItemAtIndexPath:index];
            myCell.tagButtonSelected = NO;
        }
        
        // 如果当前cell 是选中cell
        if (indexPath.row == selectIndex) {
            cell.tagButtonSelected = YES;
        }
    };
    
    return myCell;
}


- (void)setTagArray:(NSArray *)tagArray
{
    _tagArray = tagArray;
    [_collectionView reloadData];
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
