//
//  IntroductionVC.h
//  StarWardrobeDemo
//
//  Created by Mac on 16/7/4.
//  Copyright © 2016年 xiao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BlockTypeDefault.h"

@interface IntroductionVC : UIViewController

@property (nonatomic,copy) DidSelectedEnter block;

- (void)enterRootVC:(DidSelectedEnter)newBlock;



@end
