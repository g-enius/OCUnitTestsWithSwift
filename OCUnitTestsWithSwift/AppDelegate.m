//
//  AppDelegate.m
//  OCUnitTestsWithSwift
//
//  Created by Charles on 29/07/19.
//  Copyright © 2019 SKY. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()
@property (nonatomic, assign) BOOL testing;

//BOOL testing = NSClassFromString(@"XCTest") != nil;

@end

@implementation AppDelegate

//let testing = NSClassFromString("XCTest") != nil
//
//func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
//    TwitterAccount.set(key: "idomhCf9PAwvzfco8AXXBslN3",
//                       secret: "8IauQpiUusmrFYRG6tQsDaXy729DXJ29YEgfQvm03Y3oSOkzTH")
//    
//    if !testing {
//        let feedNavigation = window!.rootViewController! as! UINavigationController
//        navigator.show(segue: .listTimeline(account, list), sender: feedNavigation)
//    }
//    return true
//}
//}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    if (NSClassFromString(@"XCTest")) { return YES; }
    
    return YES;
}


@end
