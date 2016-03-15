//
//  MyTabBarController.h
//  CostomTabBar
//
//  Created by 智游3G on 16-3-8.
//  Copyright (c) 2016年 ZhiYou. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MyTabBarControllerDelegate <NSObject>

- (void)selectedIndex:(NSInteger)index;

@end


@interface MyTabBarController : UITabBarController
@property (nonatomic,assign) id <MyTabBarControllerDelegate> delegate;
@property (nonatomic,strong) UIImageView *tabBarBackgroundImageView;
@end
