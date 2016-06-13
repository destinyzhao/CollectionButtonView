//
//  ViewController.m
//  CollectionButtonView
//
//  Created by Alex on 16/6/12.
//  Copyright © 2016年 Alex. All rights reserved.
//

#import "ViewController.h"
#import "TagCollectionView.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet TagCollectionView *tagView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.automaticallyAdjustsScrollViewInsets = NO;
//    TagCollectionView *tagView = [[TagCollectionView alloc]initWithFrame:CGRectMake(80, 70, self.view.frame.size.width-80-10, 100)];
//    tagView.tagButtonSelectedIndex = 0;
//    [self.view addSubview:tagView];
    
    _tagView.tagArray = @[@"全部",@"已完成",@"已关闭",@"已关闭"];
    _tagView.tagButtonSelectedIndex = 0;
    _tagView.tagSelectedBlock = ^(NSInteger selectIndex){
        NSLog(@"selected inde: %zd",selectIndex);
    };
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
