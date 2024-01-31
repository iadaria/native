//
//  SceneDelegate.m
//  todo
//
//  Created by Якимова Дарья on 30.01.24.
//
// searching "UIViewController alloc path:SceneDelegate.m"
// https://github.com/wxx2258/demo_and_item/blob/fc4093513c99b5321052f296f1bd004dfe402c93/single-app/singleApp/singleApp/ViewController%E7%9A%84%E5%89%AF%E6%9C%AC.m
// https://github.com/googlemaps-samples/maps-sdk-for-ios-samples/blob/a1ddc159a57fc09b1e335ac29fc0bf9bfb79e0fa/GoogleMaps/GoogleMapsDemos/DemoSceneDelegate.m#L36
#import "SceneDelegate.h"

@interface SceneDelegate ()

@end

@implementation SceneDelegate

// UIViewController alloc path:SceneDelegate.m
- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions {
    // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
    // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
    // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
    /*UIWindow *window = [[UIWindow alloc] initWithWindowScene:(UIWindowScene *)scene];
    window.rootViewController = [[UINavigationController alloc] initWithNibName:nil bundle:nil];
    self.window = window;
    [window makeKeyAndVisible];*/
    /*UIWindowScene *windowScene = (UIWindowScene *)scene;
    UIWindow *window = [[UIWindow alloc] initWithWindowScene:windowScene];
    window.rootViewController = [[UINavigationController alloc] initWithNibName:nil bundle:nil];
    self.window = window;
    [window makeKeyAndVisible];*/
    /*UIWindowScene *windowScene = (UIWindowScene *)scene;
    self.window = [[UIWindow alloc] initWithWindowScene:windowScene];
    
    UIViewController *viewController = [[UIViewController alloc] init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:viewController];
    [self.window]*/
    
    /*UIWindow *window = [[UIWindow alloc] initWithWindowScene:(UIWindowScene *)scene];
    
    UIViewController *viewController = [[UIViewController alloc] init];
    UINavigationController *navigatorController = [[UINavigationController alloc] initWithRootViewController:viewController];
    
    window.rootViewController = navigatorController;
    
   
    self.window = window;
    [self.window makeKeyAndVisible];*/
    
    UIWindowScene *windowScene = (UIWindowScene *)scene;
    self.window = [[UIWindow alloc] initWithWindowScene:windowScene];
    self.window.frame = windowScene.coordinateSpace.bounds;
 
    UIViewController *mainController = [[UIViewController alloc] init];
    mainController.view.backgroundColor = [UIColor greenColor];
    
    UINavigationController *navigatorController = [[UINavigationController alloc] init];
    
    self.window.rootViewController = navigatorController;
    [self.window makeKeyWindow];
}


- (void)sceneDidDisconnect:(UIScene *)scene {
    // Called as the scene is being released by the system.
    // This occurs shortly after the scene enters the background, or when its session is discarded.
    // Release any resources associated with this scene that can be re-created the next time the scene connects.
    // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
}


- (void)sceneDidBecomeActive:(UIScene *)scene {
    // Called when the scene has moved from an inactive state to an active state.
    // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
}


- (void)sceneWillResignActive:(UIScene *)scene {
    // Called when the scene will move from an active state to an inactive state.
    // This may occur due to temporary interruptions (ex. an incoming phone call).
}


- (void)sceneWillEnterForeground:(UIScene *)scene {
    // Called as the scene transitions from the background to the foreground.
    // Use this method to undo the changes made on entering the background.
}


- (void)sceneDidEnterBackground:(UIScene *)scene {
    // Called as the scene transitions from the foreground to the background.
    // Use this method to save data, release shared resources, and store enough scene-specific state information
    // to restore the scene back to its current state.
}


@end
