//
//  gameView.h
//  barrage_Game_Project
//
//  Created by River  on 13-2-25.
//  Copyright (c) 2013年 陈龙超.面试作品. All rights reserved.
//

#import <UIKit/UIKit.h>

extern float barragePointValueX; //把barrage的坐标X值传递过来
extern float barragePointValueY; //把barrage的坐标X值传递过来
extern int hpValue;
@interface gameView : UIViewController{
    UIImageView *barrage_;
    UIViewController *player_;
    float touchPointX;
    float touchPointY;
    int hp;
@private
    UIImageView* character_;//显示人偶用的UIImageView
    BOOL shouldWalk_;//移动标志（控制人偶移动）
    CGPoint targetPoint_;//当前手指位置
   
}

-(float)touchPointX;
-(float)touchPointY;
-(void)setTouchPointX:(float)setX;
-(void)setTouchPointY:(float)setY;
-(void)setHPValue:(int)setValue;
-(int)HPValue;



@end
