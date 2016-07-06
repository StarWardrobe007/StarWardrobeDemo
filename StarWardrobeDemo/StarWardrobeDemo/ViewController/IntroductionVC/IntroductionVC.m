//
//  IntroductionVC.m
//  StarWardrobeDemo
//
//  Created by Mac on 16/7/4.
//  Copyright © 2016年 xiao. All rights reserved.
//

#import "IntroductionVC.h"

@interface IntroductionVC ()

@end

@implementation IntroductionVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self toMainVC];
    
}

- (void)toMainVC{

dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2*NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
    self.block();
});
    
    
}

- (void)enterRootVC:(DidSelectedEnter)newBlock{

    self.block = newBlock;
}


- (void)dealloc{
    
    
    self.block = nil;

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
