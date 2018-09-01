//
//  ViewController.m
//  SimpleApp
//
//  Created by Yauheni Pakala on 5/27/18.
//  Copyright © 2018 Yauheni Pakala. All rights reserved.
//

#import "ViewController.h"
#import "DotNet.IosLibrary/DotNet.IosLibrary.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    DotNet_IosLibrary_Bridge *bridgeObj = [[DotNet_IosLibrary_Bridge alloc] init];
    
    bridgeObj.testStr = @"Test String Value 123";
    
    NSLog(bridgeObj.testStr);
    
}

@end
