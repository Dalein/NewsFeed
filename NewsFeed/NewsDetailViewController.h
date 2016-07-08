//
//  NewsDetailViewController.h
//  NewsFeed
//
//  Created by Gnatyuk Ivan on 30.06.16.
//  Copyright © 2016 Gnatyuk Ivan. All rights reserved.
//

#import <UIKit/UIKit.h>
@class News;

@interface NewsDetailViewController : UITableViewController

@property (weak, nonatomic) IBOutlet UIImageView *imageViewNews;

@property (weak, nonatomic) IBOutlet UILabel *lblNewsSource;
@property (weak, nonatomic) IBOutlet UILabel *lblNewsDate;

@property (weak, nonatomic) IBOutlet UILabel *lblNewsTitle;
@property (weak, nonatomic) IBOutlet UILabel *lblNewsDescription;

@property (nonatomic, strong) News *news;


@end
