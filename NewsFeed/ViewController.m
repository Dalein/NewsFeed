//
//  ViewController.m
//  NewsFeed
//
//  Created by Gnatyuk Ivan on 21.06.16.
//  Copyright © 2016 Gnatyuk Ivan. All rights reserved.
//

#import "ViewController.h"
#import "NewsFetchViewModel.h"
#import "NewsFetchImpl.h"
#import "NewsListDataSource.h"
#import "NewsDetailViewController.h"
#import <ReactiveCocoa/ReactiveCocoa.h>

@interface ViewController ()

@property (strong, nonatomic) NewsFetchViewModel *viewModel;
@property (strong, nonatomic) NewsListDataSource *dataSource;

@property (nonatomic, strong) UIRefreshControl *refreshControl;

@end

@implementation ViewController 

- (void)viewDidLoad {
    [super viewDidLoad];
    [self UIConfig];
    
    NewsFetchImpl *fetchImp = [NewsFetchImpl new];
    _viewModel = [[NewsFetchViewModel alloc] initWithServices:fetchImp];
    _viewModel.arrSources = @[[NSURL URLWithString:@"https://lenta.ru/rss"],
                              [NSURL URLWithString:@"http://www.gazeta.ru/export/rss/lenta.xml"]];
    [self bindViewModel];
    
    _dataSource = [[NewsListDataSource alloc] init];
    self.tableView.dataSource = _dataSource;
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    if (!_viewModel.dateLastUpdate || [[NSDate date] timeIntervalSinceDate:_viewModel.dateLastUpdate] > 180) {
        [_refreshControl beginRefreshing];
        [self fetchNews];
    }
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"showNewsDetail"]) {
        NSIndexPath *path = [self.tableView indexPathForSelectedRow];
        
        NewsDetailViewController *vc = (NewsDetailViewController *)segue.destinationViewController;
        vc.news = _dataSource.arrItems[path.row];
    }
}

- (void)fetchNews {
    [_viewModel executeFetch];
}


- (void)bindViewModel {
    self.title = self.viewModel.title;
    
    [[RACObserve(self.viewModel, newsFetchResult) deliverOn:[RACScheduler mainThreadScheduler]]
     subscribeNext:^(id x) {
         [self.refreshControl endRefreshing];
         _dataSource.arrItems = _viewModel.newsFetchResult.arrNews;
         [self.tableView reloadData];
     }];
}

- (void)UIConfig {
    
    self.tableView.estimatedRowHeight = 100.0;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    
    [self addRefreshControll];
}


- (void)addRefreshControll {
    self.refreshControl = [[UIRefreshControl alloc] init];
    self.refreshControl.backgroundColor = [UIColor clearColor];
    self.refreshControl.tintColor = [UIColor darkGrayColor];
    [self.refreshControl addTarget:self
                            action:@selector(fetchNews)
                  forControlEvents:UIControlEventValueChanged];
    [self.tableView addSubview:self.refreshControl];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
