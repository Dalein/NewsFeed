//
//  News.h
//  NewsFeed
//
//  Created by Gnatyuk Ivan on 21.06.16.
//  Copyright © 2016 Gnatyuk Ivan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface News : NSObject

@property (strong, nonatomic) NSString *sourceTitle;
@property (strong, nonatomic) NSString *sourceImageName;
@property (strong, nonatomic) NSURL *newsImageUrl;
@property (strong, nonatomic) NSDate *newsDate;
@property (strong, nonatomic) NSString *newsDateText;
@property (strong, nonatomic) NSString *newsTitle;
@property (strong, nonatomic) NSString *newsDescription;
@property (strong, nonatomic) NSURL *newsUrl;

- (instancetype)initWithDictionary:(NSDictionary *)dictNews;
+ (NSString *)sourceTitle:(NSString *)title;

@end
