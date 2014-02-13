//
//  AppDelegate.m
//  LiveLayoutDemo
//
//  Created by Ole Gammelgaard Poulsen on 15/12/13.
//  Copyright (c) 2013 SHAPE. All rights reserved.
//

#import "AppDelegate.h"
#import "DemoViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];


	DemoViewController *demoViewController = [[DemoViewController alloc] init];
	UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:demoViewController];
	self.window.rootViewController = navigationController;

	self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];

#if TARGET_IPHONE_SIMULATOR
    NSString *absoluteFilePath = CASAbsoluteFilePath(@"stylesheet.cas");
    [CASStyler defaultStyler].watchFilePath = absoluteFilePath;
#endif

	return YES;
}

@end