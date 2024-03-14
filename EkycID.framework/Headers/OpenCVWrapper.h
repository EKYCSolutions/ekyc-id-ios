//
//  OpenCVWrapper.h
//  EKYCMLSDKIOS
//
//  Created by Leang panharith on 7/2/22.
//

#import <Foundation/Foundation.h>

#ifdef __cplusplus
#undef NO
#undef YES

#import <opencv2/opencv.hpp>

#endif


NS_ASSUME_NONNULL_BEGIN

@interface OpenCVWrapper : NSObject
+ (bool) isBlur: (UIImage*) inputImage;
+ (UIImage*) gray: (UIImage*) inputImage;
+ (UIImage*) canny: (UIImage*) inputImage :(double) threshold1 :(double) threshold2;
+ (NSArray*) houghline: (UIImage *) mask :(double) cannyThreshold;
+ (UIImage*) warpImage: (UIImage *) src :(NSArray *) corners;
+ (double) detectHologram: (UIImage *) inputImage;
+ (void) calculateBackgroundColorHSVBound;

@end





NS_ASSUME_NONNULL_END

