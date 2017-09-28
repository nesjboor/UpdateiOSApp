//
//  AJViewController.m
//  UpdateApplication
//
//  Created by nesjboor on 09/19/2017.
//  Copyright (c) 2017 nesjboor. All rights reserved.
//

#import "AJViewController.h"
//#import "AJAppDelegate.h"
#import <UpdateiOSApp/NormalUpdateViewController.h>
#import <UpdateiOSApp/ForceUpdateViewController.h>
#import <UpdateiOSApp/UpdateApplication.h>
@interface AJViewController ()

@end

@implementation AJViewController

- (void)viewDidLoad
{
    
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
}

-(void)viewDidAppear:(BOOL)animated
{
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(force:) name:@"openForceUpdate" object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(ask:) name:@"openNormalUpdate" object:nil];
    
    
    //this nofi will have a NSDirectory obj that has the json file data
    //set observer on the first VC like the loging VC
    
    
    [super viewDidAppear:animated];
    
}

-(void)force:(NSNotification*) data{
    NSLog(@"This is showForceUpdateVC");
    NSLog(@"the result is %@",[data object]);
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Update" bundle:[NSBundle bundleForClass:ForceUpdateViewController.class]];
    ForceUpdateViewController *vc = [sb instantiateViewControllerWithIdentifier:@"ForceUpdateViewController"];
    vc.dataDict = [data object];
    vc.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    //    UIViewController *initVC = [self getInitialViewControl];
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    UIViewController *rootViewController = window.rootViewController;
    //Use the getMainStoryboardName
    //    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    
    //    [[rootViewController navigationController] presentViewController:vc animated:YES completion:nil];
     [self presentViewController:vc animated:YES completion:nil];

//    [UpdateApplication showForceUpdateViewController:data];
}


-(void)ask:(NSNotification*) data{
    NSLog(@"This is showNormalUpdateVC");
    NSLog(@"the result is %@",[data object]);
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Update" bundle:[NSBundle bundleForClass:NormalUpdateViewController.class]];
    NormalUpdateViewController *vc = [sb instantiateViewControllerWithIdentifier:@"NormalUpdateViewController"];
    vc.dataDict = [data object];
    //    UIViewController *initVC = [self getInitialViewControl];
    //    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:vc animated:YES completion:nil];
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    UIViewController *rootViewController = window.rootViewController;
    
//    [[rootViewController presentedViewController] presentViewController:vc animated:YES completion:nil];
      [self presentViewController:vc animated:YES completion:nil];
//    [UpdateApplication showNormalUpdateViewController:data];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

