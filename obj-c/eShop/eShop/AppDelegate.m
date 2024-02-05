//
//  AppDelegate.m
//  eShop
//
//  Created by Якимова Дарья on 03.02.24.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [[UIApplication sharedApplication] setStatusBarHidden:NO];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    
    // Navbar styles
    
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    [[UINavigationBar appearance] setBarTintColor:NAV_BAR_BACKGROUND];
    [[UINavigationBar appearance] setBackgroundColor:NAV_BAR_BACKGROUND];
    
    NSMutableDictionary* navbarAttributes = [NSMutableDictionary dictionary];
    navbarAttributes[NSFontAttributeName] = [UIFont fontWithName:@"Montserrat SemiBold" size:14.0f];
    navbarAttributes[NSForegroundColorAttributeName] = [UIColor whiteColor];
    [[UINavigationBar appearance] setTitleTextAttributes:navbarAttributes];
    

    return YES;
    
}


#pragma mark - UISceneSession lifecycle


- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}


- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
}


@end
