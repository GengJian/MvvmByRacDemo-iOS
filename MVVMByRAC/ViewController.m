//
//  ViewController.m
//  MVVMByRAC
//
//  Created by Soul on 2018/10/16.
//  Copyright © 2018 Soul. All rights reserved.
//

#import "ViewController.h"

#import "VVLoginViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSString *statusF = NSStringFromCGRect([UIApplication sharedApplication].statusBarFrame);
    NSLog(@"statusF:%@",statusF);
    
    NSString *screenB = NSStringFromCGRect([UIScreen mainScreen].bounds);
    NSLog(@"screenB:%@",screenB);
    
    [UILayoutGuide ]
}

- (IBAction)actionClick:(id)sender {
    
    VVLoginViewController *loginvc = [[VVLoginViewController alloc] init];
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.navigationController showViewController:loginvc
                                               sender:nil];
    });
    
}

@end
