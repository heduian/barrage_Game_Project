//
//  AppDelegate.m
//  barrage_Game_Project
//
//  Created by River  on 13-2-25.
//  Copyright (c) 2013年 陈龙超.面试作品. All rights reserved.
//

#import "AppDelegate.h"
#import "mainViewController.h"
#import "gameView.h"
@implementation AppDelegate

@synthesize window = window_;

-(void)applicationDidFinishLaunching:(UIApplication *)application{
    
    CGRect bound = [[UIScreen mainScreen]bounds];
    window_ = [[UIWindow alloc]initWithFrame:bound];
    
    mainView = [[mainViewController alloc]init];
    [window_ addSubview:mainView.view];
    
    [window_ bringSubviewToFront:mainView.view];
    [window_ makeKeyAndVisible];
    
}

@end
