//
//  NewsDetailViewModel.m
//  NewsFeed
//
//  Created by Gnatyuk Ivan on 30.06.16.
//  Copyright © 2016 Gnatyuk Ivan. All rights reserved.
//

#import "NewsDetailViewModel.h"

@implementation NewsDetailViewModel


- (instancetype)initWithNews:(News *)news {
    self = [super init];
    if (!self) return nil;
    
    _news = news;
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"d MMMM в HH:mm"];
    _newsDateText = [dateFormatter stringFromDate:news.newsDate];
    
    return self;
}

- (void)dealloc {
    NSLog(@"<%@ dealloc", [self class]);
}

@end
