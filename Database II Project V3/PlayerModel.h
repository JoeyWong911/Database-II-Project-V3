//
//  PlayerModel.h
//  Database II Project
//
//  Created by Joey Wong on 4/27/15.
//  Copyright (c) 2015 Joey & Jacky. All rights reserved.
//

#import <Foundation/Foundation.h>


@protocol PlayerModelProtocol <NSObject>

- (void)itemsDownloaded:(NSArray *)items;

@end

@interface PlayerModel : NSObject <NSURLConnectionDataDelegate>

@property (nonatomic, weak) id<PlayerModelProtocol> delegate;

- (void)downloadItems;

@end
