//
//  DataClass.m
//  Database II Project V3
//
//  Created by Joey Wong on 4/28/15.
//  Copyright (c) 2015 Joey & Jacky. All rights reserved.
//

#import "DataClass.h"

@implementation DataClass
@synthesize searchCol;

static DataClass *instance = nil;

+(DataClass *)getInstance
{
@synchronized(self)
{
if(instance==nil)
{
instance= [DataClass new];
}
}
return instance;
}

@end
