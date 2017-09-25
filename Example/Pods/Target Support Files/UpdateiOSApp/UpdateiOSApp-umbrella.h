#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "ForceUpdateViewController.h"
#import "JSONLoader.h"
#import "NormalUpdateViewController.h"
#import "UpdateApplication.h"

FOUNDATION_EXPORT double UpdateiOSAppVersionNumber;
FOUNDATION_EXPORT const unsigned char UpdateiOSAppVersionString[];

