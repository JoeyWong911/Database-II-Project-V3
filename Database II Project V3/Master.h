//
//  Master.h
//  Database II Project
//
//  Created by Joey Wong on 4/27/15.
//  Copyright (c) 2015 Joey & Jacky. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Master : NSObject

@property (nonatomic, strong) NSString *playerID;
@property (nonatomic, strong) NSString *birthYear;
@property (nonatomic, strong) NSString *birthMonth;
@property (nonatomic, strong) NSString *birthDay;
@property (nonatomic, strong) NSString *birthCountry;
@property (nonatomic, strong) NSString *birthState;
@property (nonatomic, strong) NSString *birthCity;
@property (nonatomic, strong) NSString *nameFirst;
@property (nonatomic, strong) NSString *nameLast;
@property (nonatomic, strong) NSString *nameGiven;
@property (nonatomic, strong) NSString *weight;
@property (nonatomic, strong) NSString *height;
@property (nonatomic, strong) NSString *bats;
@property (nonatomic, strong) NSString *throws;



@end
