//
//  ViewController.m
//  SimpleApp
//
//  Created by Yauheni Pakala on 5/27/18.
//  Copyright © 2018 Yauheni Pakala. All rights reserved.
//

#import "ViewController.h"

// 1 - import .NET library
#import "DotNet.IosLibrary/DotNet.IosLibrary.h"

@interface ViewController ()

@end

@implementation ViewController

DotNet_IosLibrary_Bridge *bridgeObj;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 2 - create instance of .NET class
    bridgeObj = [[DotNet_IosLibrary_Bridge alloc] init];
    
    // 3 - set value
    bridgeObj.testStr = @"Test String Value 123";
    
    // 4 - get value
    NSLog(@"%@", bridgeObj.testStr);
    
    // 5 - more samples
    
    NSLog(@"%@", bridgeObj.version);
    
    int fibRes = [bridgeObj fibN:(15)];
    
    NSLog(@"%@", [[NSString alloc] initWithFormat:@"%d", fibRes]);
    
    [_NavToXBtn addTarget:self action:@selector(navBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    [_LoadDataNBtn addTarget:self action:@selector(loadDataNBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
}

-(void)navBtnClicked:(UIButton*)sender
{
    //UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"DotNet.IosLibrary.XStoryboard" bundle:[NSBundle bundleForClass:XViewController.self]];
    //XViewController *navVC = (XViewController *)[storyBoard instantiateViewControllerWithIdentifier:@"XViewController"];
    
    // 6 - navigate to XViewController
    [self.navigationController pushViewController:[XViewController alloc] animated:YES];
}

-(void)loadDataNBtnClicked:(UIButton*)sender
{
    // 7 - load data from network
    dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void){
        NSString *data = [bridgeObj loadDataUrl:@"https://google.com"];
        dispatch_async(dispatch_get_main_queue(), ^(void){
            self->_LogView.text = data;
        });
    });
}


@end
