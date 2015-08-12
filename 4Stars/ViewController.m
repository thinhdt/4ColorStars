//
//  ViewController.m
//  4
//
//  Created by mac on 8/4/15.
//  Copyright (c) 2015 mac. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
{
    UIImageView *red;
    UIImageView *brown;
    UIImageView *violet;
    UIImageView *green;
    
    CGFloat deltaX;
    CGFloat deltaY;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    deltaX = 100;
    deltaY = 100;
    
    red = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"red.png"]];
    brown = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"brown.png"]];
    violet = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"violet.png"]];
    green = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"green.png"]];
    
    //    CGRect mainSize = self.view.bounds;
    //    red.frame = CGRectMake(mainSize.size.width * 0.5 - red.frame.size.width/2, mainSize.size.height * 0.5 - red.frame.size.height/2, red.frame.size.width, red.frame.size.height);
    
    //    red.backgroundColor = [UIColor redColor];
    [self setFirstPosition];
    
    
    [self.view addSubview:red];
    [self.view addSubview:brown];
    [self.view addSubview:violet];
    [self.view addSubview:green];
    
    [self animate];
}

- (void) animate {
    
    [UIView animateWithDuration:1 animations:^{
        // bottom right
        red.center = CGPointMake(self.view.center.x + deltaX,  self.view.center.y + deltaY);
        // left top
        brown.center = CGPointMake(self.view.center.x - deltaX,  self.view.center.y - deltaY);
        //        // top right
        green.center = CGPointMake(self.view.center.x + deltaX, self.view.center.y - deltaY);
        //        // left bottom
        violet.center = CGPointMake(self.view.center.x - deltaX,  self.view.center.y + deltaY);
        
        
    } completion:^(BOOL finished) {
        
        [UIView animateWithDuration:1 animations:^{
            
            red.center = CGPointMake(self.view.center.x + deltaX,  self.view.center.y);
            brown.center = CGPointMake(self.view.center.x - deltaX, self.view.center.y);
            green.center = CGPointMake(self.view.center.x, self.view.center.y - deltaY);
            violet.center = CGPointMake(self.view.center.x, self.view.center.y + deltaY);
            
            
        } completion:^(BOOL finished) {
            
            [UIView animateWithDuration:3 animations:^{
                [self setFirstPosition];
            } completion:^(BOOL finished) {
                [self animate];
            }];
        }];
    }];
}

- (void) setFirstPosition {
    red.center = CGPointMake(self.view.center.x , self.view.center.y);
    brown.center = CGPointMake(self.view.center.x , self.view.center.y);
    violet.center = CGPointMake(self.view.center.x , self.view.center.y);
    green.center = CGPointMake(self.view.center.x , self.view.center.y);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
