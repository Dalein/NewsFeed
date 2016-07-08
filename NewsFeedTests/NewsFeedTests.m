//
//  NewsFeedTests.m
//  NewsFeedTests
//
//  Created by Gnatyuk Ivan on 21.06.16.
//  Copyright © 2016 Gnatyuk Ivan. All rights reserved.
//

#import <XCTest/XCTest.h>

// Models
#import "News.h"


@interface NewsFeedTests : XCTestCase

@end

@implementation NewsFeedTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testNewsSourceTitle {
    NSString *newsSourceTitle = @"Lenta.ru : Новости";
    XCTAssertEqualObjects(@"Lenta.ru", [News sourceTitle:newsSourceTitle]);
    
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
