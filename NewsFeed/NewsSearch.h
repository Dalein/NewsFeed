//
//  NewsSearch.h
//  NewsFeed
//
//  Created by Gnatyuk Ivan on 21.06.16.
//  Copyright © 2016 Gnatyuk Ivan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NewsFetchResult.h"

typedef void(^FetchCompletion)(NewsFetchResult *newsFetchReslt, NSError *error);

@protocol NewsSearch <NSObject>

- (void)fetchNewsFromSources:(NSArray <NSURL *> *)arrSources
               withComletion:(FetchCompletion)block;


@end
