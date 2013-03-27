//
//  barrage.m
//  barrage_Game_Project
//
//  Created by River  on 13-2-25.
//  Copyright (c) 2013年 陈龙超.面试作品. All rights reserved.
//

#import "barrage.h"
#import "gameView.h"
@interface barrage ()

@end
//float barragePointX = [self barrageX];
@implementation barrage

float barragePointValueX; //把弹幕的X坐标值导入到gameView中做碰撞判断
float barragePointValueY; //把弹幕的Y坐标值导入到gameView中做碰撞判断


-(void)viewDidLoad
{
    [super viewDidLoad];
    [self makeBarrage];
}

-(void)makeBarrage{
    pos = CGPointMake(5.0, 5.0);
    barrages = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"00.png"]];
    barrages.frame = CGRectMake(arc4random()%100, arc4random()%100, 32, 32);// 初始坐标
    [self.view addSubview:barrages];
    //通过随机数让弹幕往不同方向射击
    int randint = arc4random() % 2;
    if (randint == 0) {
        [NSTimer scheduledTimerWithTimeInterval:(0.01) target:self selector:@selector(onTimerLeft) userInfo:nil repeats:YES];
        NSLog(@"the barrage is left");
    }else{
        [NSTimer scheduledTimerWithTimeInterval:(0.01) target:self selector:@selector(onTimerRight) userInfo:nil repeats:YES];
        NSLog(@"the barrage is right");
    }
    
}
#pragma mark ----------弹幕不同方向的射击-----------
-(void) onTimerRight {
	float x = barrages.center.x;
	float y = barrages.center.y;
    barrages.center = CGPointMake(barrages.center.x + pos.x, barrages.center.y + pos.y);
	if (barrages.center.x > 320 || barrages.center.x < 0)
		pos.x = -pos.x;
	if (barrages.center.y > 460 || barrages.center.y < 0)
		pos.y = -pos.y;
    [self setBarrageX:barrages.center.x];
    [self setBarrageY:barrages.center.y];
	[UIView setAnimationDuration:3.0];
	[UIView setAnimationDelegate:self];
	[UIView setAnimationDidStopSelector:@selector(removeSmoke:finished:context:)];
	[UIView commitAnimations];
	[self.view bringSubviewToFront:barrages];
}

-(void) onTimerLeft {
	float x = barrages.center.x;
	float y = barrages.center.y;
    barrages.center = CGPointMake(barrages.center.x - pos.x, barrages.center.y + pos.y);
	if (barrages.center.x > 320 || barrages.center.x < 0)
		pos.x = -pos.x;
	if (barrages.center.y > 460 || barrages.center.y < 0)
		pos.y = -pos.y;
    [self setBarrageX:barrages.center.x];
    [self setBarrageY:barrages.center.y];
    
	[UIView setAnimationDuration:3.0];
	[UIView setAnimationDelegate:self];
	[UIView setAnimationDidStopSelector:@selector(removeSmoke:finished:context:)];
	[UIView commitAnimations];
	[self.view bringSubviewToFront:barrages];
}

#pragma mark -------------弹幕的坐标传递-----------------------
-(void)setBarrageX:(float)inputX
{
    //NSLog(@"the x is :%f",inputX);
    barragePointValueX = inputX;
}
-(void)setBarrageY:(float)inputY
{
    //NSLog(@"the y is :%f",barrageY);
    barragePointValueY = inputY;
}
@end
