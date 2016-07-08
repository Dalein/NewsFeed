//
//  NewsListDataSource.h
//  NewsFeed
//
//  Created by Gnatyuk Ivan on 30.06.16.
//  Copyright © 2016 Gnatyuk Ivan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NewsListDataSource : NSObject <UITableViewDataSource>

@property (nonatomic, strong) NSArray *arrItems;

@end
