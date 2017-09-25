//
//  NormalUpdateViewController.h
//  UpdateiOSApp
//
//  Created by Nasrin on 9/24/17.
//  Copyright © 2017 aljazeera. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NormalUpdateViewController : UIViewController
@property (retain, nonatomic) NSDictionary *dataDict;
@property (weak, nonatomic) IBOutlet UILabel *lblString;
@property (weak, nonatomic) IBOutlet UILabel *normalUpdateLabel;


@end
