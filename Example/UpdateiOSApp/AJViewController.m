//
//  AJViewController.m
//  UpdateApplication
//
//  Created by nesjboor on 09/19/2017.
//  Copyright (c) 2017 nesjboor. All rights reserved.
//

#import "AJViewController.h"
#import "AJAppDelegate.h"
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
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(showForceUpdateViewController:) name:@"openForceUpdate" object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(showNormalUpdateViewController:) name:@"openNormalUpdate" object:nil];
    
    
    //this nofi will have a NSDirectory obj that has the json file data
    //set observer on the first VC like the loging VC
    
    
    [super viewDidAppear:animated];
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

