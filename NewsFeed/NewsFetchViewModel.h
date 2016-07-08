//
//  NewsFetchViewModel.h
//  NewsFeed
//
//  Created by Gnatyuk Ivan on 21.06.16.
//  Copyright © 2016 Gnatyuk Ivan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NewsSearch.h"

@interface NewsFetchViewModel : NSObject

@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSArray *arrSources;

@property (strong, nonatomic) NewsFetchResult *newsFetchResult;
@property (nonatomic, strong) NSDate *dateLastUpdate;

- (instancetype)initWithServices:(id<NewsSearch>)services;

- (void)executeFetch;

@end
