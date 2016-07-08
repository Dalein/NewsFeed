//
//  NSString+ValuesSuffix.m
//  RationalApe
//
//  Created by Gnatyuk Ivan on 29.04.16.
//  Copyright © 2016 daleijn. All rights reserved.
//

#import "NSString+ValuesSuffix.h"

@implementation NSString (ValuesSuffix)

+ (NSString *)stringValueSuffixHour:(int)hoursValue {
    NSArray *arrTitles = @[@"час", @"часа", @"часов"];
    return arrTitles[[NSString p_FitIndexForValue:hoursValue]];
}

+ (NSString *)stringValueSuffixMinutes:(int)hoursValue {
    NSArray *arrTitles = @[@"минуту", @"минуты", @"минут"];
    return arrTitles[[NSString p_FitIndexForValue:hoursValue]];
}

+ (NSString *)stringValueSuffixSeconds:(int)hoursValue {
    NSArray *arrTitles = @[@"секунду", @"секунды", @"секунд"];
    return arrTitles[[NSString p_FitIndexForValue:hoursValue]];
}

+ (NSString *)stringValueSuffixWithVariants:(NSArray *)arrTitles forValue:(int)value {
    return arrTitles[[NSString p_FitIndexForValue:value]];
}

+ (int)p_FitIndexForValue:(int)value {
    NSArray *cases = @[@2, @0, @1, @1, @1, @2];
    int index = (value % 100 > 4 && value % 100 < 20) ? 2 : [cases[value % 10 < 5 ? (value % 10) : 5] intValue];
    return index;
}

+ (NSString *)stringFormattedDuration:(NSInteger)seconds {
    
    if (seconds < 0) {
        return @"--";
    }
    
    NSInteger H = 0;
    NSInteger minutes = 0;
    NSString *strFinal = nil;
    
    H = seconds/3600;
    minutes = (seconds - H*3600)/60;
    
    if (seconds < 60) {
        strFinal = [NSString stringWithFormat:@"%ld %@", (long)seconds, [NSString stringValueSuffixSeconds:(int)seconds]];
        return strFinal;
    }
    
    
    if (H == 0) {
        strFinal = [NSString stringWithFormat:@"%ld %@", (long)minutes, [NSString stringValueSuffixMinutes:(int)minutes]];
        return strFinal;
    }
    
    if (minutes == 0) {
        strFinal = [NSString stringWithFormat:@"%ld %@", (long)H, [NSString stringValueSuffixHour:(int)H]];
        return strFinal;
    }
    
    return [NSString stringWithFormat:@"%ld %@ %ld %@", (long)H, [NSString stringValueSuffixHour:(int)H], (long)minutes, [NSString stringValueSuffixMinutes:(int)minutes]];
}


@end
