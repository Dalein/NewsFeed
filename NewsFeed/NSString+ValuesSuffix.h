//
//  NSString+ValuesSuffix.h
//  RationalApe
//
//  Created by Gnatyuk Ivan on 29.04.16.
//  Copyright © 2016 daleijn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (ValuesSuffix)

+ (NSString *)stringValueSuffixHour:(int)hoursValue;
+ (NSString *)stringValueSuffixMinutes:(int)hoursValue;
+ (NSString *)stringValueSuffixSeconds:(int)hoursValue;

+ (NSString *)stringValueSuffixWithVariants:(NSArray *)arrTitles
                                   forValue:(int)value;

+ (NSString *)stringFormattedDuration:(NSInteger)seconds;

@end
