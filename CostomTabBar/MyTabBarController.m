//
//  MyTabBarController.m
//  CostomTabBar
//
//  Created by 智游3G on 16-3-8.
//  Copyright (c) 2016年 ZhiYou. All rights reserved.
//
static UIButton *_maskButton;
#define KWidth [[UIScreen mainScreen] bounds].size.width
#define KHeight [[UIScreen mainScreen] bounds].size.height
#import "MyTabBarController.h"
#import "ViewController1.h"
#import "ViewController3.h"
#import "ViewController2.h"
#import "ViewController4.h"
#import "ViewController5.h"
@interface MyTabBarController ()

@end

@implementation MyTabBarController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
//        [[UIScreen mainScreen] bounds].size.width
//        [[UIScreen mainScreen] bounds].size.height
        self.tabBar.hidden = YES;
    }
    return self;
}

- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item
{
    
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    ViewController1 *vc1 = [[ViewController1 alloc]init];
    ViewController2 *vc2 = [[ViewController2 alloc]init];
    ViewController3 *vc3 = [[ViewController3 alloc]init];
    ViewController4 *vc4 = [[ViewController4 alloc]init];
    ViewController5 *vc5 = [[ViewController5 alloc]init];
    
    self.viewControllers = @[vc1,vc2,vc3,vc4,vc5];
    self.selectedIndex = 4;
    [self myTabBar];
    // Do any additional setup after loading the view.
}

- (void)myTabBar
{
    //背景图片
    _tabBarBackgroundImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, KHeight-49, KWidth, 49)];
    _tabBarBackgroundImageView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    _tabBarBackgroundImageView.userInteractionEnabled = YES;
    [self.view addSubview:_tabBarBackgroundImageView ];
    //中心btn
    UIButton *centerBtn = [[UIButton alloc]init];
    centerBtn.selected = YES;
    _maskButton = centerBtn;
    centerBtn.center = _tabBarBackgroundImageView.center;
    centerBtn.tag = 4;
    centerBtn.bounds = CGRectMake(0, 0, 114*.7, 99*.7);
    [centerBtn setBackgroundImage:[UIImage imageNamed:@"bottom_m_chick"] forState:UIControlStateNormal];
    [centerBtn setBackgroundImage:[UIImage imageNamed:@"bottom_m_nor"] forState:UIControlStateSelected];
    [centerBtn addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:centerBtn];
    //NSLog(@"-------------%@",NSStringFromCGRect(centerBtn.frame));
    CGFloat widthX = centerBtn.frame.origin.x/2;
    CGFloat width  = centerBtn.frame.size.width;
    //item
    for (int i = 0; i<4; i++) {
        UIButton *itemButton = [[UIButton alloc]init];
        itemButton.tag = i;
        
        if (i==0||i==1)
        {
            itemButton.frame = CGRectMake(i%2*widthX,0, widthX, 49);
        }
        else
        {
            itemButton.frame = CGRectMake((i-2)%2*widthX+centerBtn.frame.origin.x+width,0, widthX, 49);
        }
        [itemButton setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"bottom_%dchick",i+1]] forState:UIControlStateNormal];
        [itemButton setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"bottom_%dnor",i+1]] forState:UIControlStateSelected];
        [itemButton addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
        [_tabBarBackgroundImageView addSubview:itemButton];
    }
}


- (void)click:(UIButton *)button
{
    static int a = 5;
    self.selectedIndex = button.tag;
    a=button.tag;
    button.selected = YES;
    _maskButton.selected = NO;
    _maskButton = button;
    if (a==button.tag) {
        return;
    }
   
}
@end
