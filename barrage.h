//
//  barrage.h
//  barrage_Game_Project
//
//  Created by River  on 13-2-25.
//  Copyright (c) 2013年 陈龙超.面试作品. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface barrage : UIViewController{
    UIImageView *barrages;
    CGPoint pos;
    float barrageX;
    float barrageY;
}

-(void)makeBarrage;
-(void)setBarrageX:(float)inputX;
-(void)setBarrageY:(float)inputY;

@end
