//
//  TagCollectionViewCell.m
//  CollectionButtonView
//
//  Created by Alex on 16/6/12.
//  Copyright © 2016年 Alex. All rights reserved.
//

#import "TagCollectionViewCell.h"

@interface TagCollectionViewCell ()

@property (weak, nonatomic) IBOutlet UIButton *tagButton;


@end

@implementation TagCollectionViewCell

- (void)awakeFromNib
{
    [self tagBtnNoSelected];
}

- (void)setTagButtonSelected:(BOOL)tagButtonSelected
{
    if (tagButtonSelected) {
        [self tagBtnSelected];
    }
    else
    {
        [self tagBtnNoSelected];

    }
}

- (void)setTagButtonTitle:(NSString *)tagButtonTitle
{
    [_tagButton setTitle:tagButtonTitle forState:UIControlStateNormal];
}

- (void)tagBtnSelected
{
    _tagButton.layer.masksToBounds = YES;
    _tagButton.layer.cornerRadius = 3.;
    _tagButton.layer.borderWidth = 1;
    _tagButton.layer.borderColor = [UIColor redColor].CGColor;
    [_tagButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
}

- (void)tagBtnNoSelected
{
    _tagButton.layer.masksToBounds = YES;
    _tagButton.layer.cornerRadius = 3.;
    _tagButton.layer.borderWidth = 1;
    _tagButton.layer.borderColor = [UIColor grayColor].CGColor;
    [_tagButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
}

- (IBAction)tagBtnClicked:(id)sender {
    if (self.tagButtonSlectedBlock != nil) {
        self.tagButtonSlectedBlock(self.tag);
    }
}

@end
