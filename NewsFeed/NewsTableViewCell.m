//
//  NewsTableViewCell.m
//  NewsFeed
//
//  Created by Gnatyuk Ivan on 21.06.16.
//  Copyright © 2016 Gnatyuk Ivan. All rights reserved.
//

#import "NewsTableViewCell.h"

#import "News.h"
#import <SDWebImage/UIImageView+WebCache.h>

@implementation NewsTableViewCell


- (void)configCellWithItem:(id)item {
    News *news = (News *)item;
    
    self.newsTitle.text = news.newsTitle;
    self.newsSourceTitle.text = news.sourceTitle;
    self.newsDate.text = news.newsDateText;
    [self.newsImage sd_setImageWithURL:news.newsImageUrl
                      placeholderImage:nil];
}

@end
