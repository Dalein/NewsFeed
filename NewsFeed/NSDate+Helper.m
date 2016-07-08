//
//  NSDate+Helper.m
//  My DayLog
//
//  Created by Gnatyuk Ivan on 17.09.15.
//  Copyright © 2015 daleijn. All rights reserved.
//

#import "NSDate+Helper.h"
#import "NSString+ValuesSuffix.h"

@implementation NSDate (Helper)


+ (nonnull NSString *)stringPostCreationFormattedTimeWithDate:(nonnull NSDate *)date1 {
    NSString *returnString = nil;
    
    // Сегодня
    if ([NSDate isTodayDate:date1]) {
        NSTimeInterval elapsedFromNowSec = [[NSDate date] timeIntervalSinceDate:date1];
        
        if (elapsedFromNowSec < 60) {
            returnString = @"сейчас";
        }
        else if (elapsedFromNowSec < 3600) {
            int elapsedMinutes = elapsedFromNowSec / 60;
            NSString *minutesTitle = [NSString stringValueSuffixMinutes:elapsedMinutes];
            returnString = [NSString stringWithFormat:@"%d %@", elapsedMinutes, minutesTitle];
        }
        else if (elapsedFromNowSec < 3600 * 4) {
            int elapsedHours = elapsedFromNowSec / 3600;
            NSString *hourTitle = [NSString stringValueSuffixHour:elapsedHours];
            returnString = [NSString stringWithFormat:@"%d %@", elapsedHours, hourTitle];
        }
        else {
            NSDateFormatter *dateFormatterTime = [[NSDateFormatter alloc] init];
            dateFormatterTime.dateFormat = @"HH:mm";
            [dateFormatterTime setTimeZone:[NSTimeZone systemTimeZone]];
            [dateFormatterTime setLocale:[NSLocale currentLocale]];
            
            returnString = [dateFormatterTime stringFromDate:date1];
        }
    }
    else if ([NSDate isYesterdayDate:date1]) {
        returnString = @"вчера";
    }
    else if ([NSDate isTomorrowDate:date1]) {
        returnString = @"завтра";
    }
    else {
        NSDateFormatter *dateFormatter_dMMM = [[NSDateFormatter alloc] init];
        dateFormatter_dMMM.dateFormat = @"d MMM";
        [dateFormatter_dMMM setTimeZone:[NSTimeZone systemTimeZone]];
        [dateFormatter_dMMM setLocale:[NSLocale currentLocale]];
        
        returnString = [dateFormatter_dMMM stringFromDate:date1];
    }
    
    return returnString;
}


+ (BOOL)isTodayDate:(nonnull NSDate *)date {
    NSDateFormatter * _dateFormatterToday = [[NSDateFormatter alloc] init];
    _dateFormatterToday.dateFormat = @"ddMMyyyy";
    [_dateFormatterToday setTimeZone:[NSTimeZone systemTimeZone]];
    [_dateFormatterToday setLocale:[NSLocale currentLocale]];
    
    return [[_dateFormatterToday stringFromDate:[NSDate date]] isEqualToString:[_dateFormatterToday stringFromDate:date]];
}

+ (BOOL)isYesterdayDate:(nonnull NSDate *)date {
    NSDateFormatter * dateFormatterD = [[NSDateFormatter alloc] init];
    dateFormatterD.dateFormat = @"d";
    [dateFormatterD setTimeZone:[NSTimeZone systemTimeZone]];
    [dateFormatterD setLocale:[NSLocale currentLocale]];
    
    int todayDateInt = [[dateFormatterD stringFromDate:[NSDate date]] intValue];
    int XDateInt = [[dateFormatterD stringFromDate:date] intValue];
    
    return todayDateInt - XDateInt == 1;
}

+ (BOOL)isTomorrowDate:(nonnull NSDate *)date {
    NSDateFormatter * dateFormatterD = [[NSDateFormatter alloc] init];
    dateFormatterD.dateFormat = @"d";
    [dateFormatterD setTimeZone:[NSTimeZone systemTimeZone]];
    [dateFormatterD setLocale:[NSLocale currentLocale]];
    
    int todayDateInt = [[dateFormatterD stringFromDate:[NSDate date]] intValue];
    int XDateInt = [[dateFormatterD stringFromDate:date] intValue];
    
    return XDateInt - todayDateInt == 1;
}



@end
