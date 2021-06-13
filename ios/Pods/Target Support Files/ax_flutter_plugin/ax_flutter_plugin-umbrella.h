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

#import "AxFlutterPlugin.h"

FOUNDATION_EXPORT double ax_flutter_pluginVersionNumber;
FOUNDATION_EXPORT const unsigned char ax_flutter_pluginVersionString[];

