//
//  JSONLoader.h
//  Pods
//
//  Created by Nasrin on 9/19/17.
//
//

#import <UIKit/UIKit.h>

@interface JSONLoader : NSObject

// Return an array of Location objects from the json file at location given by url
//- (NSArray *)locationsFromJSONFile:(NSURL *)url;
- (NSDictionary *)getJSONFileData:(NSURL *)url;

@end

