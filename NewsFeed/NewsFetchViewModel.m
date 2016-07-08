//
//  NewsFetchViewModel.m
//  NewsFeed
//
//  Created by Gnatyuk Ivan on 21.06.16.
//  Copyright © 2016 Gnatyuk Ivan. All rights reserved.
//

#import "NewsFetchViewModel.h"



@interface NewsFetchViewModel ()

@property (nonatomic, strong) id<NewsSearch> services;

@end

@implementation NewsFetchViewModel


- (instancetype)initWithServices:(id<NewsSearch>)services {
    self = [super init];
    if (!self) return nil;
    
    _services = services;
    [self initialize];
    
    return self;
}


- (void)initialize {
    self.title = @"News";
}

- (void)executeFetch {
    _dateLastUpdate = [NSDate date];
    
    [_services fetchNewsFromSources:_arrSources withComletion:^(NewsFetchResult *newsFetchReslt, NSError *error) {
        self.newsFetchResult = newsFetchReslt;
    }];
}


@end
