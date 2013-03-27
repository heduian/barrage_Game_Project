//
//  playerMove.m
//  barrage_Game_Project
//
//  Created by River  on 13-2-26.
//  Copyright (c) 2013年 陈龙超.面试作品. All rights reserved.
//

#import "playerMove.h"

@interface playerMove ()
-(void)thePlayerWillMove;
@end

#pragma mark ----- Start Implementation For Methods -----
@implementation playerMove

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    // 为实现动画导入2枚图片
    UIImage* image1 = [UIImage imageNamed:@"barrage1.png"];
    UIImage* image2 = [UIImage imageNamed:@"barrage1.png"];
    NSArray* images = [[NSArray alloc] initWithObjects:image1, image2, nil];
    // 创建UIImageView实例并初始化
    player = [[UIImageView alloc] initWithImage:image1];
    // 将动画图片以数值形式设置到animationImages属性中
    player.animationImages = images;
    player.animationDuration = 0.3;
    [self.view addSubview:player];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    player = NO;
}
#pragma mark ----- Responder -----

// 手指在画面上触摸的瞬间动画开始，调用人物移动的方法
// shouldWalk_为YES时持续调用人物移动方法
- (void)touchesBegan:(NSSet*)touches withEvent:(UIEvent*)event {
    shouldMove = YES;
    [player startAnimating];
    targetPoint = [[touches anyObject] locationInView:self.view];
    [self thePlayerWillMove];
}

// 画面拖动时保持当时位置
- (void)touchesMoved:(NSSet*)touches withEvent:(UIEvent*)event {
    targetPoint = [[touches anyObject] locationInView:self.view];
}

// 手指从画面离开时动画停止，并将shouldWalk_设置成NO
- (void)touchesEnded:(NSSet*)touches withEvent:(UIEvent*)event {
    shouldMove = NO;
    [player stopAnimating];
}

// 放弃触摸状态后动画停止，并将shouldWalk_设置成NO
- (void)touchesCancelled:(NSSet*)touches withEvent:(UIEvent*)event {
    shouldMove = NO;
    [player stopAnimating];
}

#pragma mark ----- Private Methods -----

// 向手指触摸位置一点点移动人物位置的方法
// shouldWalk_为YES时、以0.3秒为间隔递归调用本方法
- (void)thePlayerWillMove {
    if ( !shouldMove ) {
        return;
    }
    
    static const NSInteger kMaximumSteps = 5;
    CGPoint newPoint = player.center;
    if ( kMaximumSteps < abs( targetPoint.x - newPoint.x  ) ) {
        if ( targetPoint.x > newPoint.x ) {
            newPoint.x += kMaximumSteps;
        } else {
            newPoint.x -= kMaximumSteps;
        }
    } else {
        newPoint.x = targetPoint.x;
    }
    if ( kMaximumSteps < abs( targetPoint.y - newPoint.y  ) ) {
        if ( targetPoint.y > newPoint.y ) {
            newPoint.y += kMaximumSteps;
        } else {
            newPoint.y -= kMaximumSteps;
        }
    } else {
        newPoint.y = targetPoint.y;
    }
    
    player.center = newPoint;
    NSLog(@"%f",newPoint.x);
    NSLog(@"%f",newPoint.y);
    
    [self performSelector:@selector(thePlayerWillMove)
               withObject:nil
               afterDelay:0.001];
}

@end
