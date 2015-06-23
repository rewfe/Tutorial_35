//
//  ViewController.m
//  Tutorial_35
//
//  Created by Admin on 19.06.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "ViewController.h"
#import "CustomActionSheet.h"

@interface ViewController ()

@property (nonatomic, strong) CustomActionSheet *customActionSheet;
-(void)testBlockStorageType;
-(void)addNumber:(int)number1 withNumber:(int)number2 andCompletionHandler:(void (^)(int result))completionHandler;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self testBlockStorageType];
    
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
    
    
    [self addNumber:5 withNumber:7 andCompletionHandler:^(int result) {
        // We just log the result, no need to do anything else.
        NSLog(@"The result is %d", result);
    }];
    
    //multithreading
    
    NSLog(@"Preparing to run code in secondary thread...");
    dispatch_queue_t myQueue = dispatch_queue_create("My Queue", NULL);
    dispatch_async(myQueue, ^{
        NSLog(@"Running code in secondary thread...");
        
        int value = 0;
        for (int i=0; i<100; i++) {
            for (int j=0; j<100; j++) {
                for (int n=0; n<100; n++) {
                    value += j;
                }
            }
        }
        
        NSLog(@"From secondary thread: value = %d", value);
    });
    
    NSLog(@"This is main thread again...");
    
        // Do any additional setup after loading the view, typically from a nib.
}

-(void)testBlockStorageType{
    __block int someValue = 10;
    
    int (^myOperation)(void) = ^(void){
        someValue += 5;
        
        return someValue + 10;
    };
    
    NSLog(@"%d", myOperation());
}

-(void)addNumber:(int)number1 withNumber:(int)number2 andCompletionHandler:(void (^)(int result))completionHandler{
    int result = number1 + number2;
    completionHandler(result);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)showActionSheet:(id)sender {
    _customActionSheet = [[CustomActionSheet alloc] initWithTitle:@"AppCoda"
                                                         delegate:nil
                                                cancelButtonTitle:@"Cancel"
                                           destructiveButtonTitle:nil
                                                otherButtonTitles:@"Option 1", @"Option 2", @"Option 3", nil];
    [_customActionSheet showInView:self.view withCompletionHandler:^(NSString *buttonTitle, NSInteger buttonIndex) {
        NSLog(@"You tapped the button in index: %d", buttonIndex);
        NSLog(@"Your selection is: %@", buttonTitle);
    }];
}
@end
