//
//  playerMove.h
//  barrage_Game_Project
//
//  Created by River  on 13-2-26.
//  Copyright (c) 2013年 陈龙超.面试作品. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface playerMove : UIViewController{
    @private
    UIImageView *player;  //显示玩家移动的UIImageView
    BOOL shouldMove;         //移动标志（控制移动）
    CGPoint targetPoint;      //当前手指位置
}

@end
