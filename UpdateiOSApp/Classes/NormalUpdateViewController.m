//
//  NormalUpdateViewController.m
//  UpdateiOSApp
//
//  Created by Nasrin on 9/24/17.
//  Copyright © 2017 aljazeera. All rights reserved.
//

#import "NormalUpdateViewController.h"
#import "UpdateApplication.h"

@interface NormalUpdateViewController ()

@end

@implementation NormalUpdateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSArray* releaseNotesArray = [[self.dataDict objectForKey:@"release_notes" ] objectForKey:@"item"];
    NSString* releaseNotesString = [NSString stringWithFormat:@""];
    for (NSString* note in releaseNotesArray) {
        releaseNotesString = [NSString stringWithFormat:@" %@ \n - %@",releaseNotesString,note];
    }
    
    self.lblString.text = [NSString stringWithFormat:@"New version (%@) of application is available for download. \n\n%@",[self.dataDict objectForKey:@"current_version"],releaseNotesString];
    
    
}
- (IBAction)updateAppButton:(id)sender {
    NSLog(@"%@",[self.dataDict objectForKey:@"update_file_path"]);
    //    //invoke the phone to open this URL that will download the ipa on the device
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[self.dataDict objectForKey:@"update_file_path"]]  options:@{} completionHandler:nil];
}

- (IBAction)laterUpdateAppButton:(id)sender {
    //    UpdateApp *update = [[UpdateApp alloc] init];
    
    UIStoryboard* storyboard = [UIStoryboard storyboardWithName:[UpdateApplication getInitialStoryBoardName] bundle:nil];
    
    UIViewController* viewControllerName = [storyboard instantiateViewControllerWithIdentifier:[UpdateApplication getInitialStoryBoardId]];
    
    [self.navigationController pushViewController:viewControllerName animated:YES];
    //
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
