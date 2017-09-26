//
//  AJAppDelegate.m
//  UpdateApplication
//
//  Created by nesjboor on 09/19/2017.
//  Copyright (c) 2017 nesjboor. All rights reserved.
//

#import "AJAppDelegate.h"
#import "AJViewController.h"
#import <UpdateiOSApp/UpdateApplication.h>

//#import "UpdateApplicaton/UpdateApplication.h"
//UpdateApp *update;
@implementation AJAppDelegate
{
    
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    
    //set Meta Data URL = json url
//    update = [[UpdateApp alloc] init];
    //Force
    [UpdateApplication setMetaDataURL:@"https://dl.dropbox.com/s/gl3rslnv6jqwb68/ForceUpdate.json"];
    //    [update setMetaDataURL:@"https://appstore.aljazeera.net/downloads/anonymous/metadata_ios_gatepass.json"];
    //Normal
    //    [update setMetaDataURL:@"https://dl.dropbox.com/s/30jrltfrr9awab2/AlertUpdate.json"];
    [UpdateApplication setInitialViewControl:[[AJViewController alloc] init]];
    //set storyboard ID
    [UpdateApplication setInitialStoryBoardId:@"AJViewController"];
    //set storyboard Name
    [UpdateApplication setInitialStoryBoardName:@"Main"];
    //[update checkForUpdates];
    //call checkForUpdates
    [UpdateApplication performSelector:@selector(checkForUpdates) withObject:nil afterDelay:0.5];
//
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end

