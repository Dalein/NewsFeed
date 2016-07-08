//
//  NewsFetchResult.m
//  NewsFeed
//
//  Created by Gnatyuk Ivan on 21.06.16.
//  Copyright © 2016 Gnatyuk Ivan. All rights reserved.
//

#import "NewsFetchResult.h"
#import "News.h"


@interface NewsFetchResult ()
@property (nonatomic, readwrite) NSUInteger totalResults;
@end

@implementation NewsFetchResult 

- (NSString *)description {
    return [NSString stringWithFormat:@"totalresults = %lU, news = %@",
            (unsigned long)self.totalResults, self.arrNews];
}

- (void)sortNewsByAscending:(BOOL)ascending {
    
    NSComparisonResult firsrOrder = ascending ? NSOrderedDescending : NSOrderedAscending;
    NSComparisonResult secondOrder = ascending ? NSOrderedAscending : NSOrderedDescending;
    
    self.arrNews = [self.arrNews sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        News *first = (News *)obj1 ;
        News *second = (News *)obj2;
        
        NSInteger firstTime = [first.newsDate timeIntervalSince1970];
        NSInteger secondTime = [second.newsDate timeIntervalSince1970];
        
        if (firstTime > secondTime) {
            return firsrOrder;
        } else if (firstTime < secondTime) {
            return secondOrder;
        } else {
            return NSOrderedSame;
        }
    }];
}


- (NSUInteger)totalResults {
    return self.arrNews.count;
}

@end
