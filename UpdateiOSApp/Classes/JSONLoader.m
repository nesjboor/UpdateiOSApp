//
//  JSONLoader.m
//  Pods
//
//  Created by Nasrin on 9/19/17.
//
//

#import "JSONLoader.h"

@interface JSONLoader ()

@end

@implementation JSONLoader


//get the json file data
- (NSDictionary *)getJSONFileData:(NSURL *)url {
    
    // Create a NSURLRequest with the given URL
    NSURLRequest *request = [NSURLRequest requestWithURL:url
                                             cachePolicy:NSURLRequestReloadIgnoringLocalAndRemoteCacheData
                                         timeoutInterval:30.0];
    
    // Get the data
    NSURLResponse *response;
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:nil];
    
    if(data)
    {
        NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        for(NSDictionary* dict in jsonDictionary)
        {
            return dict;
        }
    }
    return nil;
}


@end

