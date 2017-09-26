//
//  UpdateApplication.m
//  UpdateiOSApp
//
//  Created by Nasrin on 9/24/17.
//  Copyright © 2017 aljazeera. All rights reserved.
//

#import "UpdateApplication.h"
#import "JSONLoader.h"
#import "ForceUpdateViewController.h"
#import "NormalUpdateViewController.h"

@interface UpdateApplication ()
{
    
    NSString *updateFileUrl;
}
@end

@implementation UpdateApplication

static NSDictionary* applicationUpdateData;
static NSURL *MetaDataURL;
//change this to MainStoryboardName
static NSString *initialStoryBoardName;
static NSString *initialStoryBoardId;
UIViewController *initialVC;

//static ViewController initialVC;

+(NSURL*)getMetaDataURL
{
    return MetaDataURL;
}

+(void)setMetaDataURL: (NSString*)jsonFileURL
{
    MetaDataURL = [NSURL URLWithString:jsonFileURL];
}

+(void)setInitialViewControl: (UIViewController*)initVC
{
    initialVC = initVC;
}

+(UIViewController*)getInitialViewControl{
    return initialVC;
}
//change this to setMainStoryboardName
+(void)setInitialStoryBoardName: (NSString*)storyBoardName
{
    initialStoryBoardName = storyBoardName;
}
//change this to getMainStoryboardName
+(NSString*)getInitialStoryBoardName
{
    return initialStoryBoardName;
}

+(void)setInitialStoryBoardId: (NSString*)storyBoardId
{
    initialStoryBoardId = storyBoardId;
}

+(NSString*)getInitialStoryBoardId
{
    return initialStoryBoardId;
}


-(void)showForceUpdateViewController:(NSNotification*) data
{
    NSLog(@"This is showForceUpdateVC");
    NSLog(@"the result is %@",[data object]);
    ForceUpdateViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"ForceUpdateViewController"];
    vc.dataDict = [data object];
    vc.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    //    UIViewController *initVC = [self getInitialViewControl];
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    UIViewController *rootViewController = window.rootViewController;
    //Use the getMainStoryboardName
    //    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    [[rootViewController navigationController] presentViewController:vc animated:YES completion:nil];
    
    //    [[rootViewController navigationController] pushViewController:vc animated:YES];
}

-(void)showNormalUpdateViewController:(NSNotification*) data
{
    NSLog(@"This is showNormalUpdateVC");
    NSLog(@"the result is %@",[data object]);
    NormalUpdateViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"NormalUpdateViewController"];
    vc.dataDict = [data object];
    //    UIViewController *initVC = [self getInitialViewControl];
    //    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:vc animated:YES completion:nil];
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    UIViewController *rootViewController = window.rootViewController;
    
    [[rootViewController presentedViewController] presentViewController:vc animated:YES completion:nil];
}

//check the version of the current app to the version in json file
+(void)checkForUpdates
{
    JSONLoader *jsonLoader = [[JSONLoader alloc] init];
    NSURL *url = [self getMetaDataURL];
    //    NSURL *url = [NSURL URLWithString:@"https://appstore.aljazeera.net/downloads/anonymous/metadata_ios_gatepass.json"];
    //    NSURL *url = [NSURL URLWithString:@"https://dl.dropbox.com/s/3qmmf55y3oripmd/dummy.json"];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSDictionary *updatesData =  [jsonLoader getJSONFileData:url];
        
        if(updatesData)
        {
            NSString* availableVersionString = [updatesData objectForKey:@"current_version"];
            NSNumber *currentApplicationVersion = [self getCurrentApplicationVersion];
            NSNumber *JSONApplicationVersion = [self getJSONApplicationVersion:availableVersionString];
            
            applicationUpdateData = updatesData;
            
            if([currentApplicationVersion floatValue] < [JSONApplicationVersion floatValue])
            {
                if([[updatesData objectForKey:@"force_update"] boolValue])
                {
                    //                    [self performSelector:@selector(forceUserToUpdateApplication) withObject:nil afterDelay:0.1];
                    
                    [self performSelectorOnMainThread:@selector(forceUserToUpdateApplication) withObject:nil waitUntilDone:NO];
                }
                else
                {
                    [self performSelectorOnMainThread:@selector(askUserToUpdateApplication) withObject:nil waitUntilDone:NO];
                }
                
            }else
            {
                [self performSelectorOnMainThread:@selector(showApplicationInformationMessage) withObject:nil waitUntilDone:NO];
                
            }
        }
    });
}

//if the json file has force=true will come here and show the force UI
+(void)forceUserToUpdateApplication
{
    //applicationUpdateData = json file data
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"openForceUpdate" object:applicationUpdateData];
}


+(NSNumber*)getCurrentApplicationVersion
{
    
    NSString *appVersion = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
    
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    formatter.numberStyle = NSNumberFormatterDecimalStyle;
    NSNumber *appVersionNumber = [formatter numberFromString:appVersion];
    
    return appVersionNumber;
    
}

+(NSNumber*)getJSONApplicationVersion: (NSString*) versionString
{
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    formatter.numberStyle = NSNumberFormatterDecimalStyle;
    NSNumber *available_version = [formatter numberFromString:versionString];
    
    return available_version;
    
}

//if the json file has force=false will come here to show an alert
+(void)askUserToUpdateApplication
{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"openNormalUpdate" object:applicationUpdateData];
    
    //    NSString* version = [applicationUpdateData objectForKey:@"current_version"];
    //    NSDictionary* releaseNotesDict = [applicationUpdateData objectForKey:@"release_notes"];
    //
    //    updateFileUrl = [applicationUpdateData objectForKey:@"update_file_path"];
    //
    //    NSArray* releaseNotesArray = [releaseNotesDict objectForKey:@"item"];
    //    NSString* releaseNotesString = [NSString stringWithFormat:@""];
    //    for (NSString* note in releaseNotesArray) {
    //
    //        releaseNotesString = [NSString stringWithFormat:@" %@ \n - %@",releaseNotesString,note];
    //
    //    }
    //
    //
    //    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Update Available"
    //                                                    message:[NSString stringWithFormat:@"New version (%@) of application is available for download. \n\n%@",version,releaseNotesString]
    //                                                   delegate:self
    //                                          cancelButtonTitle:nil
    //                                          otherButtonTitles:@"Later",@"Update",nil];
    //
    //    [alert show];
    
}


-(void)showApplicationInformationMessage
{
    
    if(applicationUpdateData)
    {
        
        NSDictionary* releaseNotesDict = [applicationUpdateData objectForKey:@"app_message"];
        NSString* status = [releaseNotesDict objectForKey:@"status"];
        
        NSArray* releaseNotesArray = [releaseNotesDict objectForKey:@"item"];
        NSString* applicationInformationMessage = @"";
        for (NSString* note in releaseNotesArray) {
            applicationInformationMessage = [applicationInformationMessage stringByAppendingString:[NSString stringWithFormat:@"- %@\n\n",note]];
        }
        
        
        NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
        
        if (status && [status isEqualToString:@"1"]) {
            [ud setObject:[NSString stringWithFormat:@"Please consider the following \n\n\n %@",applicationInformationMessage] forKey:@"appinfomessage"];
            [ud setObject:@"Yes" forKey:@"shouldShowInfoMessage"];
        }
        else{
            [ud setObject:@"No" forKey:@"shouldShowInfoMessage"];
        }
        [ud synchronize];
    }
    
}


-(void)startUpdate
{
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:updateFileUrl]  options:@{} completionHandler:nil];
}





//-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
//{
//    if (buttonIndex == 1)
//    {
//        if([alertView tag] != 1)
//        {
//            [self startUpdate];
//        }else if([alertView tag] == 1)
//        {
//            [[NSNotificationCenter defaultCenter]postNotificationName:@"loadajessdeeplink"object:self];
//        }
//
//    }
//    else
//    {
//        [alertView dismissWithClickedButtonIndex:1 animated:TRUE];
//
//        if([alertView tag] != 1)
//        {
//            [self performSelectorOnMainThread:@selector(showApplicationInformationMessage) withObject:nil waitUntilDone:NO];
//        }
//    }
//
//
//}


-(NSNumber*)numberFromString:(NSString*)numberString
{
    NSNumber *number = [NSNumber numberWithInt:-1];
    if(numberString)
    {
        NSNumberFormatter *f = [[NSNumberFormatter alloc] init];
        f.numberStyle = NSNumberFormatterDecimalStyle;
        number = [f numberFromString:numberString];
    }
    return number;
}


@end

