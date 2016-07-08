//
//  NewsFetchImpl.m
//  NewsFeed
//
//  Created by Gnatyuk Ivan on 21.06.16.
//  Copyright © 2016 Gnatyuk Ivan. All rights reserved.
//

#import "NewsFetchImpl.h"
#import <LinqToObjectiveC/NSArray+LinqExtensions.h>
#import "XMLDictionary.h"
#import "NewsFetchResult.h"
#import "News.h"



@interface NewsFetchImpl ()
@property (nonatomic, copy) FetchCompletion internalBlock;
@end

@implementation NewsFetchImpl {
    NSOperationQueue *operationQueue;
   __block NewsFetchResult *results;
    dispatch_queue_t _queue;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        operationQueue = [[NSOperationQueue alloc] init];
        [operationQueue addObserver:self forKeyPath:@"operations" options:NSKeyValueObservingOptionNew context:NULL];
        
        _internalBlock = ^(NewsFetchResult *newsFetchReslt, NSError *error) {};
        _queue = dispatch_queue_create("com.daleijn.arrNewsQueue", DISPATCH_QUEUE_SERIAL);

    }
    return  self;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    
    if (object == operationQueue && [keyPath isEqualToString:@"operations"]) {
        if ([operationQueue.operations count] == 0) {
            NSLog(@"queue has completed");
            
            [results sortNewsByAscending:NO];
            _internalBlock(results, nil);
        }
    }
    else {
        [super observeValueForKeyPath:keyPath
                             ofObject:object
                               change:change context:context];
    }
}


#pragma NewsSearch Protocol method

- (void)fetchNewsFromSources:(NSArray <NSURL *> *)arrSources
               withComletion:(FetchCompletion)block {
    
    results = nil; // "Reset" downloadded data
    _internalBlock = ^(NewsFetchResult *newsFetchReslt, NSError *error) {
        if (block) {
            block(newsFetchReslt, error);
        }
    };
    
    for (NSURL *url in arrSources) {
        
        NSBlockOperation *newsFetchBlock = [NSBlockOperation blockOperationWithBlock:^{
            
            dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
            
            NSURLRequest *request = [NSURLRequest requestWithURL:url];
            NSURLSession *session = [NSURLSession sharedSession];
            NSURLSessionDataTask *task = [session dataTaskWithRequest:request
                                                            completionHandler:
                                                    ^(NSData *data, NSURLResponse *response, NSError *error) {
                                                        if (data) {
                                                            
                                                             NSDictionary *dictXml = [NSDictionary dictionaryWithXMLData:data];
                                                             if (dictXml) {
                                                                NSArray *news = dictXml[@"channel"][@"item"];
                                                                
                                                                if (!results) {
                                                                    results = [NewsFetchResult new];
                                                                    results.arrNews = [NSArray new];
                                                                }
                                                                
                                                                 NSArray *arrNews = [news linq_select:^id(NSDictionary *dictNews) {
                                                                     News *news = [[News alloc] initWithDictionary:dictNews];
                                                                     news.sourceTitle = [News sourceTitle:dictXml[@"channel"][@"title"]];
                                                                     return news;
                                                                 }];
                                                                 
                                                                 dispatch_barrier_sync(_queue, ^{
                                                                     results.arrNews = [results.arrNews arrayByAddingObjectsFromArray:arrNews];
                                                                 });
                                                            }
                                                            else {
                                                                NSLog(@"Fetch error: %@", error);
                                                            }
                                                          }
                                                        else {
                                                            NSLog(@"No data");
                                                          }
                                                        
                                                        dispatch_semaphore_signal(semaphore);
                                                      }];
                        [task resume];
            
            
             dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
        }];
        newsFetchBlock.queuePriority = NSOperationQueuePriorityHigh;
        newsFetchBlock.qualityOfService = NSOperationQualityOfServiceUserInitiated;
        newsFetchBlock.completionBlock = ^{
            NSLog(@"Fetch from %@ done", url.absoluteString);
        };
        
        [operationQueue addOperation:newsFetchBlock];
    }
}


@end
