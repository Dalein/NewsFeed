//
//  News.m
//  NewsFeed
//
//  Created by Gnatyuk Ivan on 21.06.16.
//  Copyright © 2016 Gnatyuk Ivan. All rights reserved.
//

#import "News.h"
#import "NSDate+Helper.h"

static NSDateFormatter *_dateFormatterNews;

@implementation News


- (instancetype)initWithDictionary:(NSDictionary *)dictNews {
    self = [super init];
    if (!self) return nil;
    
    if (!_dateFormatterNews) {
        _dateFormatterNews = [self datefornatterNews];
    }
    
    self.newsTitle = dictNews[@"title"];
    self.newsDescription = dictNews[@"description"];
    self.newsUrl = [NSURL URLWithString:dictNews[@"link"]];
    self.newsDate = [_dateFormatterNews dateFromString:dictNews[@"pubDate"]];
    self.newsDateText = [NSDate stringPostCreationFormattedTimeWithDate:self.newsDate];
    
    NSDictionary *dictImageInfo = dictNews[@"enclosure"];
    self.newsImageUrl = [NSURL URLWithString:dictImageInfo[@"_url"]];
  
    
    return self;
}

+ (NSString *)sourceTitle:(NSString *)title {
    NSRange range = [title rangeOfString:@" "];
    if (range.location != NSNotFound) {
        return [title substringToIndex:range.location];
    } else {
        return title;
    }
}

- (NSString *)description {
      return [NSString stringWithFormat:@"%@", @{@"title" :  self.newsTitle}];
}

- (NSDateFormatter *)datefornatterNews {
    _dateFormatterNews = [[NSDateFormatter alloc] init];
    _dateFormatterNews.dateFormat = @"eee, dd MMM y HH:mm:ss Z";
    [_dateFormatterNews setLocale:[NSLocale localeWithLocaleIdentifier:@"en_US"]];
    
    return _dateFormatterNews;
}

@end
