//
//  gameView.m
//  barrage_Game_Project
//
//  Created by River  on 13-2-25.
//  Copyright (c) 2013年 陈龙超.面试作品. All rights reserved.
//

#import "gameView.h"
#import "barrage.h"
@interface gameView ()

@end
int hpValue = 1000;
@implementation gameView

-(void)viewDidLoad{
    [super viewDidLoad];
    // 游戏背景设置
    UIImage *gameViewbackground = [UIImage imageNamed:@"gameView.png"];
    self.view.backgroundColor = [UIColor colorWithPatternImage:gameViewbackground];
    [self makeBarrage];  // 制造一个弹幕
    //touch控制的人物设置
    UIImage* image1 = [UIImage imageNamed:@"0.png"];
    character_ = [[UIImageView alloc] initWithImage:image1];
    character_.frame = CGRectMake(160,300,26.0,26.0);
    character_.animationDuration = 0.3;
    [self.view addSubview:character_];
    //生命值显示部分设置
    UILabel *hpDisplay = [[UILabel alloc]init];
    hpDisplay.alpha = 0.5;
    hpDisplay.backgroundColor = [UIColor blackColor];
    hpDisplay.textColor = [UIColor whiteColor];
    NSString *HPValueStr = [NSString stringWithFormat:@"生命值:%i",self.HPValue];
    // 还没有Touch时 尚未改变时的生命值显示
    hpDisplay.text = HPValueStr;
    hpDisplay.frame = CGRectMake(210,10,110,30);
    [self.view addSubview:hpDisplay];
    
    [NSTimer scheduledTimerWithTimeInterval:(5.0) target:self selector:@selector(makeBarrage) userInfo:nil repeats:YES]; // 每5秒生成一个弹幕
}

-(void)makeBarrage      //弹幕制造函数
{
    barrage *barrage1 = [[barrage alloc]init];
    [self.view addSubview:barrage1.view];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    shouldWalk_ = NO;
}

#pragma mark ----- 触摸动画部分 -----

// 手指在画面上触摸的瞬间动画开始，调用人物移动的方法
// shouldWalk_为YES时持续调用人物移动方法 
- (void)touchesBegan:(NSSet*)touches withEvent:(UIEvent*)event {
    shouldWalk_ = YES;
    [character_ startAnimating];
    targetPoint_ = [[touches anyObject] locationInView:self.view];
    [self theCharacterWillWalk];
}
// 画面拖动时保持当时位置
- (void)touchesMoved:(NSSet*)touches withEvent:(UIEvent*)event {
    targetPoint_ = [[touches anyObject] locationInView:self.view];
}
// 手指从画面离开时动画停止，并将shouldWalk_设置成NO
- (void)touchesEnded:(NSSet*)touches withEvent:(UIEvent*)event {
    shouldWalk_ = NO;
    [character_ stopAnimating];
}
// 放弃触摸状态后动画停止，并将shouldWalk_设置成NO
- (void)touchesCancelled:(NSSet*)touches withEvent:(UIEvent*)event {
    shouldWalk_ = NO;
    [character_ stopAnimating];
}


// 向手指触摸位置一点点移动人物位置的方法
// shouldWalk_为YES时、以0.3秒为间隔递归调用本方法 character_.animationDuration = 0.3;
- (void)theCharacterWillWalk {
    if ( !shouldWalk_ ) {
        return;
    }
    static const NSInteger kMaximumSteps = 5;
    CGPoint newPoint = character_.center;
    //调整位置
    if ( kMaximumSteps < abs( targetPoint_.x - newPoint.x  ) ) {
        if ( targetPoint_.x > newPoint.x ) {
            newPoint.x += kMaximumSteps;
        } else {
            newPoint.x -= kMaximumSteps;
        }
    } else {
        newPoint.x = targetPoint_.x;
    }
    if ( kMaximumSteps < abs( targetPoint_.y - newPoint.y  ) ) {
        if ( targetPoint_.y > newPoint.y ) {
            newPoint.y += kMaximumSteps;
        } else {
            newPoint.y -= kMaximumSteps;
        }
    } else {
        newPoint.y = targetPoint_.y;
    }
    character_.center = newPoint;
    [self setTouchPointX:newPoint.x];
    [self setTouchPointY:newPoint.y];
    if (abs(self.touchPointX - barragePointValueX) <= 35 && abs(self.touchPointY - barragePointValueY) <= 35) {
        [self setHPValue:hpValue];
        NSLog(@"%i",hpValue);
        NSLog(@"世界崩坏，小于5了 拯救世界吧");
    }
    
    // 变化后的生命值显示
    UILabel *hpDisplay = [[UILabel alloc]init];
    NSString *HPValueStr = [NSString stringWithFormat:@"生命值:%i",self.HPValue];
    hpDisplay.text = HPValueStr;
    hpDisplay.frame = CGRectMake(210,10,110,30);
    //hpDisplay.alpha = 0.5;
    hpDisplay.backgroundColor = [UIColor blackColor];
    hpDisplay.textColor = [UIColor whiteColor];
    [self.view addSubview:hpDisplay];
    
    [self performSelector:@selector(theCharacterWillWalk)
               withObject:nil
               afterDelay:0.001];
}
-(void)setHPValue:(int)setValue{
    hpValue = setValue;
    hpValue = hpValue - 1;
}

-(int)HPValue{
    return hpValue;
}
#pragma mark  --------------判断时候碰撞--------------
-(void)setTouchPointX:(float)setX{
    touchPointX = setX;
}
-(void)setTouchPointY:(float)setY{
    touchPointY = setY;
}
-(float)touchPointX{
    //NSLog(@"barrageX is : %f",touchPointX);
    return touchPointX;
}
-(float)touchPointY{
    return touchPointY;
}
@end
