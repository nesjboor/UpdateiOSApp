//
//  UpdateApplication.h
//  UpdateiOSApp
//
//  Created by Nasrin on 9/24/17.
//  Copyright © 2017 aljazeera. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UpdateApplication : UIViewController

+(NSURL*)getMetaDataURL;
+(void)setMetaDataURL: (NSString*)jsonFileURL;

+(void)setInitialStoryBoardName: (NSString*)storyBoardName;
+(void)setInitialStoryBoardId: (NSString*)storyBoardId;
+(void)setInitialViewControl: (UIViewController*)initVC;
+(NSString*)getInitialStoryBoardName;
+(NSString*)getInitialStoryBoardId;


-(void)showForceUpdateViewController:(NSNotification*) data;
-(void)showNormalUpdateViewController:(NSNotification*) data;
+(void)checkForUpdates;
+(NSNumber*)getCurrentApplicationVersion;
+(NSNumber*)getJSONApplicationVersion: (NSString*) versionString;
@end
