//
//  NewsFetchResult.h
//  NewsFeed
//
//  Created by Gnatyuk Ivan on 21.06.16.
//  Copyright © 2016 Gnatyuk Ivan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NewsFetchResult : NSObject

@property (strong, nonatomic) NSArray *arrNews;
@property (nonatomic, readonly) NSUInteger totalResults;

- (void)sortNewsByAscending:(BOOL)ascending;

@end
