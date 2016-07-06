//
//  MainTabBarController.m
//  StarWardrobeDemo
//
//  Created by Mac on 16/7/4.
//  Copyright © 2016年 xiao. All rights reserved.
//

#import "MainTabBarController.h"
#import "CollocationVC.h"
#import "CommunityVC.h"
#import "ManViewController.h"
#import "ShoppingCartVC.h"
#import "MainViewController.h"
#import "MainTabBar.h"
#import "MainNavViewController.h"

@interface MainTabBarController ()<MainTabBarDelegate>
@property (nonatomic ,weak) MainTabBar *mainTabBar;
@property (nonatomic ,strong) CollocationVC      *collocationVC;

@property (nonatomic ,strong) MainViewController *mainVC;
@property (nonatomic ,strong) ManViewController *manVC;
@property (nonatomic,strong)ShoppingCartVC *shopingCarVC;

@property (nonatomic ,strong) CommunityVC *communityVC;





@end

@implementation MainTabBarController




- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    for (UIView *child in self.tabBar.subviews) {
        if ([child isKindOfClass:[UIControl class]]) {
            [child removeFromSuperview];
        }
    }

}






- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
        
    [self setupMainTabBar];
    [self getData];
}


- (void)setupMainTabBar{
    MainTabBar *mainTabBar = [MainTabBar new];
    
    mainTabBar.frame = self.tabBar.bounds;
    
    mainTabBar.delegate = self;
    
    [self.tabBar addSubview:mainTabBar];
    _mainTabBar = mainTabBar;

}

- (void)getData{
    NSArray *titleArr = @[@"首页",@"搭配",@"社区",@"购物车",@"男人邦"];
    NSArray *images = @[@"bottom_home_icon@2x.png", @"bottom_dapei_icon@2x.png", @"bottom_bbs_icon@2x.png", @"bottom_shopping_icon@2x.png",@"bottom_like_icon@2x.png"];
    NSArray *selectedImages = @[@"bottom_home_icon_on@2x.png", @"bottom_dapei_icon_on@2x.png", @"bottom_bbs_icon_on@2x.png", @"bottom_shopping_icon_on@2x.png",@"bottom_like_icon_on@2x.png"];
    CollocationVC *collocationVC = [CollocationVC new];
    _collocationVC = collocationVC;
    CommunityVC *communityVC = [CommunityVC new];
    _communityVC = communityVC;
    
    MainViewController *mainVC = [MainViewController new];
    _mainVC = mainVC;
    
    ManViewController *manVC = [ManViewController new];
    _manVC = manVC;
    ShoppingCartVC *shopoingCartVC = [ShoppingCartVC new];
    _shopingCarVC = shopoingCartVC;
    
    NSArray *viewControllers = @[_mainVC,_collocationVC,_communityVC,_shopingCarVC,_manVC];
    
    for (int i =0; i < viewControllers.count; i++) {
        UIViewController *childVC = viewControllers[i];
        [self SetupChildVc:childVC title:titleArr[i] image:images[i] selectedImage:selectedImages[i]];
    }
    
    
    

}
- (void)SetupChildVc:(UIViewController *)childVc title:(NSString *)title image:(NSString *)imageName selectedImage:(NSString *)selectedImageName{
    MainNavViewController *nav = [[MainNavViewController alloc] initWithRootViewController:childVc];
    childVc.tabBarItem.image = [UIImage imageNamed:imageName];
    childVc.tabBarItem.selectedImage = [UIImage imageNamed:selectedImageName];
    childVc.tabBarItem.title = title;
    [self.mainTabBar addTabBarButtonWithTabBarItem:childVc.tabBarItem];
    [self addChildViewController:nav];
}




- (void)tabBar:(MainTabBar *)tabBar didSelectedButtonFrom:(long)fromBtnTag to:(long)toBtnTag{

    self.selectedIndex = toBtnTag;
}

- (void)tabBarClickWriteButton:(MainTabBar *)tabBar{


}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
