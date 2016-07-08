//
//  NewsDetailViewController.m
//  NewsFeed
//
//  Created by Gnatyuk Ivan on 30.06.16.
//  Copyright © 2016 Gnatyuk Ivan. All rights reserved.
//

#import "NewsDetailViewController.h"
#import "NewsDetailViewModel.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface NewsDetailViewController ()
@property (strong, nonatomic) NewsDetailViewModel *viewModel;

@end

@implementation NewsDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _viewModel = [[NewsDetailViewModel alloc] initWithNews:_news];
    [self UIConfig];
}

- (void)UIConfig {
    self.clearsSelectionOnViewWillAppear = NO;
    
    self.tableView.estimatedRowHeight = 150.0;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    
    if (_news.newsImageUrl) {
        [self.imageViewNews sd_setImageWithURL:_news.newsImageUrl
                              placeholderImage:nil];
    }
    _lblNewsDate.text = _viewModel.newsDateText;
    _lblNewsTitle.text = _news.newsTitle;
    _lblNewsSource.text = _news.sourceTitle;
    _lblNewsDescription.text = _news.newsDescription;
}


#pragma IBActions

- (IBAction)showInSafari:(id)sender {
     [[UIApplication sharedApplication] openURL:_news.newsUrl];
}


#pragma TableView delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0 && !_news.newsImageUrl) {
        return 0;
    }
    return UITableViewAutomaticDimension;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
