//
//  PlayerModel.m
//  Database II Project
//
//  Created by Joey Wong on 4/27/15.
//  Copyright (c) 2015 Joey & Jacky. All rights reserved.
//

#import "PlayerModel.h"
#import "Master.h"
#import "DataClass.h"

@interface PlayerModel()
{
    NSMutableData *_downloadedData;
    
}
@end

@implementation PlayerModel

- (void)downloadItems
{
    // Download the json file
    NSURL *jsonFileUrl = [NSURL URLWithString:@"http://localhost/project/Connect.php"];
    
    // Create the request
    NSURLRequest *urlRequest = [[NSURLRequest alloc] initWithURL:jsonFileUrl];
    
    // Create the NSURLConnection
    [NSURLConnection connectionWithRequest:urlRequest delegate:self];
}

#pragma mark NSURLConnectionDataProtocol Methods

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    // Initialize the data object
    _downloadedData = [[NSMutableData alloc] init];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    // Append the newly downloaded data
    [_downloadedData appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    // Create an array to store the locations
    NSMutableArray *_masters = [[NSMutableArray alloc] init];
    
    // Parse the JSON that came in
    NSError *error;
    NSArray *jsonArray = [NSJSONSerialization JSONObjectWithData:_downloadedData options:NSJSONReadingAllowFragments error:&error];
    
    // Loop through Json objects, create question objects and add them to our questions array
    for (int i = 0; i < jsonArray.count; i++)
    {
        NSDictionary *jsonElement = jsonArray[i];
        
        // Create a new location object and set its props to JsonElement properties
//        Location *newLocation = [[Location alloc] init];
//        newLocation.name = jsonElement[@"Name"];
//        newLocation.address = jsonElement[@"Address"];
//        newLocation.latitude = jsonElement[@"Latitude"];
//        newLocation.longitude = jsonElement[@"Longitude"];
        
        DataClass *obj=[DataClass getInstance];

        NSLog(@"new master gets: %@",obj.searchCol);
        
        Master *newMaster = [[Master alloc] init];
        newMaster.playerID = jsonElement[obj.searchCol];
        
        // Add this question to the locations array
        [_masters addObject:newMaster];
    }
    
    // Ready to notify delegate that data is ready and pass back items
    if (self.delegate)
    {
        [self.delegate itemsDownloaded:_masters];
    }
}

@end
