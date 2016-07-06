//
//  MainTabBarButton.m
//  StarWardrobeDemo
//
//  Created by Mac on 16/7/4.
//  Copyright © 2016年 xiao. All rights reserved.
//

#import "MainTabBarButton.h"
#define TabBarButtonImageRatio 0.6

@implementation MainTabBarButton

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.imageView.contentMode = UIViewContentModeBottom;
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.font = [UIFont systemFontOfSize:15];
        
        [self setTitleColor:[UIColor colorWithRed:205/255.0f green:89/255.0f blue:75/255.0f alpha:1.0] forState:UIControlStateSelected];
        [self setTitleColor:[UIColor colorWithRed:105/255.0f green:189/255.0f blue:175/255.0f alpha:1.0] forState:UIControlStateNormal];
        
        
    }
    return self;
}

//重写方法可以长按按钮时出现的高亮效果
- (void)setHighlighted:(BOOL)highlighted{

}


- (CGRect)imageRectForContentRect:(CGRect)contentRect{
    CGFloat imageW = contentRect.size.width;
    CGFloat imageH = contentRect.size.height *TabBarButtonImageRatio;
    return CGRectMake(0, 0, imageW, imageH);

}

- (CGRect)titleRectForContentRect:(CGRect)contentRect{
    CGFloat titleY = contentRect.size.height*TabBarButtonImageRatio;
    CGFloat titleW = contentRect.size.width;
    
    CGFloat titleH = contentRect.size.height-titleY;
    
    return CGRectMake(0, titleY, titleW, titleH);
    
    

}


- (void)setTabBarItem:(UITabBarItem *)tabBarItem{
    _tabBarItem = tabBarItem;
    
    [self setTitle:self.tabBarItem.title forState:UIControlStateNormal];
    
    [self setImage:self.tabBarItem.image forState:UIControlStateNormal];
    
    [self setImage:self.tabBarItem.selectedImage forState:UIControlStateSelected];


}


@end
