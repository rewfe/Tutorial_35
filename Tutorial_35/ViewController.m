//
//  ViewController.m
//  Tutorial_35
//
//  Created by Admin on 19.06.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    int (^howMany)(int, int) = ^(int a, int b){
        return a + b;
    };
    
    NSLog(@"%d", howmany(5, 10));
    
    
    NSDate *(^today)(void);
    
    today = ^(void){
        return [NSDate date];
    };
    
    NSLog(@"%@", today());
    
    
    float results = ^(float value1, float value2, float value3){
        return value1 * value2 * value3;
    } (1.2, 3.4, 5.6);
    
    NSLog(@"%f", results);
    
    
    int factor = 5;
    int (^newResult)(void) = ^(void){
        return factor * 10;
    };
    
    NSLog(@"%d", newResult());
    
        // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
