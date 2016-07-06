//
//  MainTabBar.m
//  StarWardrobeDemo
//
//  Created by Mac on 16/7/4.
//  Copyright © 2016年 xiao. All rights reserved.
//

#import "MainTabBar.h"

#import "MainTabBarButton.h"

@interface MainTabBar ()

@property (nonatomic ,strong) NSMutableArray *tabBarBtnArray;
@property (nonatomic ,weak) UIButton *writeButton;
@property (nonatomic ,weak) MainTabBarButton *selectedButton;



@end



@implementation MainTabBar


- (NSMutableArray *)tabBarBtnArray{
    if (!_tabBarBtnArray ) {
        _tabBarBtnArray = [NSMutableArray array];
    }
    return  _tabBarBtnArray;

}

- (instancetype)init{
    if (self = [super init]) {
    
        //[self setupWriteButton];
        
    }
    return self;
}




- (void)layoutSubviews{
    [super layoutSubviews];
    
   
    
    CGFloat btnY = 0;
    CGFloat btnW = self.frame.size.width/(self.subviews.count);
    CGFloat btnH = self.frame.size.height;
    
    for (int nIndex = 0; nIndex < self.tabBarBtnArray.count; nIndex++) {
        CGFloat btnX = btnW * nIndex;
        MainTabBarButton *tabBarBtn = self.tabBarBtnArray[nIndex];
//        if (nIndex > 1) {
//            btnX += btnW;
//        }
        tabBarBtn.frame = CGRectMake(btnX, btnY, btnW, btnH);
        tabBarBtn.tag = nIndex;
    }



}

- (void)addTabBarButtonWithTabBarItem:(UITabBarItem *)tabBarItem{
    MainTabBarButton *tabBarBtn = [[MainTabBarButton alloc] init];
    tabBarBtn.tabBarItem = tabBarItem;
    [tabBarBtn addTarget:self action:@selector(ClickTabBarButton:) forControlEvents:UIControlEventTouchDown];
    [self addSubview:tabBarBtn];
    [self.tabBarBtnArray addObject:tabBarBtn];
    
    //default selected first one
    if (self.tabBarBtnArray.count == 1) {
        [self ClickTabBarButton:tabBarBtn];
    }



}

- (void)ClickTabBarButton:(MainTabBarButton *)tabBarBtn{
    if ([self.delegate respondsToSelector:@selector(tabBar:didSelectedButtonFrom:to:)]) {
        [self.delegate tabBar:self didSelectedButtonFrom:self.selectedButton.tag to:tabBarBtn.tag];
    }
    
    self.selectedButton.selected = NO;
    tabBarBtn.selected = YES;
    self.selectedButton = tabBarBtn;

}



@end
