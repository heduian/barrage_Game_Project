//
//  mainViewController.m
//  barrage_Game_Project
//
//  Created by River  on 13-2-25.
//  Copyright (c) 2013年 陈龙超.面试作品. All rights reserved.
//

#import "mainViewController.h"
#import "gameView.h"
@interface mainViewController ()

@end

@implementation mainViewController

-(void)viewDidLoad{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // 追加按钮
    // 点击按钮后跳转到其他画面
    UIImage *beginView = [UIImage imageNamed:@"beginView.png"];
    self.view.backgroundColor = [UIColor colorWithPatternImage:beginView];
    UIButton* button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button setTitle:@"游戏开始" forState:UIControlStateNormal];
    button.frame = CGRectMake(70,310,180,38);
    UIImage *beginButtonPic = [UIImage imageNamed:@"beginbuttonPic.png"];
    [button setBackgroundImage:beginButtonPic forState:UIControlStateNormal];
    button.autoresizingMask =
    UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin;
    [button addTarget:self
               action:@selector(gameBegin)
     forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

-(void)gameBegin{
    gameView_ = [[gameView alloc]init];
    [self addChildViewController:gameView_];
    // 显示模态对话框
    gameView* dialog = [[gameView alloc] init];
    dialog.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentModalViewController:dialog animated:YES];
    
}


@end
