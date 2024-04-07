#import "AppDelegate.h"

#import <AwesomeProject-Swift.h>
#import <React/RCTBundleURLProvider.h>

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
  NSError *error = nil;
  UIViewController *view = [[self window] rootViewController];
  
  @try {
    NSString *clientID = @"27ab41f609974340b723f9d82d07134e";
    [YandexLoginOrigin activateWithClientID:clientID error:&error];
    if (!view) {
      @throw [NSException exceptionWithName:@"Initialization" reason:@"view is empty" userInfo:nil];
    }
    [YandexLoginModule setViewController:view];
  } @catch (NSException *e) {
      NSLog(@"failed: %@", e);
  }

  if (error) {
      NSLog(@"error: %@", [error localizedDescription]);
  }

  self.moduleName = @"AwesomeProject";
  // You can add your custom initial props in the dictionary below.
  // They will be passed down to the ViewController used by React Native.

  self.initialProps = @{};

  return [super application:application didFinishLaunchingWithOptions:launchOptions];
}

- (NSURL *)sourceURLForBridge:(RCTBridge *)bridge
{
    return [self getBundleURL];
}

- (NSURL *)getBundleURL
{
#if DEBUG
    return [[RCTBundleURLProvider sharedSettings] jsBundleURLForBundleRoot:@"index"];

#else
    return [[NSBundle mainBundle] URLForResource:@"main" withExtension:@"jsbundle"];

#endif
}

@end
