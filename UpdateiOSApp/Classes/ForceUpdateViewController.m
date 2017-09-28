//
//  ForceUpdateViewController.m
//  UpdateiOSApp
//
//  Created by Nasrin on 9/24/17.
//  Copyright © 2017 aljazeera. All rights reserved.
//

#import "ForceUpdateViewController.h"

@interface ForceUpdateViewController ()

@end

@implementation ForceUpdateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //dataDict will be set in login VC
    NSArray* releaseNotesArray = [[self.dataDict objectForKey:@"release_notes" ] objectForKey:@"item"];
    NSString* releaseNotesString = [NSString stringWithFormat:@""];
    for (NSString* note in releaseNotesArray) {
        releaseNotesString = [NSString stringWithFormat:@" %@ \n - %@",releaseNotesString,note];
    }
    
    self.lblString.text = [NSString stringWithFormat:@"New version (%@) of application is available for download. \n\n%@",[self.dataDict objectForKey:@"current_version"],releaseNotesString];
    
    //    [self.forceUpdateLabel setText:NSLocalizedString(@"mandatory_update_string", @"Mandatory Update")];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)updateAppButton:(UIButton *)sender {
    NSLog(@"%@",[self.dataDict objectForKey:@"update_file_path"]);
    //    //invoke the phone to open this URL that will download the ipa on the device
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[self.dataDict objectForKey:@"update_file_path"]]  options:@{} completionHandler:nil];
}



//NSLog(@"%@",[self.dataDict objectForKey:@"update_file_path"]);
////    //invoke the phone to open this URL that will download the ipa on the device
//[[UIApplication sharedApplication] openURL:[NSURL URLWithString:[self.dataDict objectForKey:@"update_file_path"]]  options:@{} completionHandler:nil];
@end

