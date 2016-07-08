//
//  NewsDetailViewModel.h
//  NewsFeed
//
//  Created by Gnatyuk Ivan on 30.06.16.
//  Copyright © 2016 Gnatyuk Ivan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "News.h"

@interface NewsDetailViewModel : NSObject

@property (nonatomic, readonly) News *news;
@property (nonatomic, strong) NSString *newsDateText;

- (instancetype)initWithNews:(News *)news;

@end
