//
//  EventManager.m
//  EventMeetups
//
//  Created by Er. Bharat Mahajan on 28/10/17.
//  Copyright © 2017 Er. Bharat Mahajan. All rights reserved.
//

#import "EventManager.h"
#import "EventsBuilder.h"
#import "EventCommunicator.h"

@implementation EventManager

-(void)fetchEventsData{
    [self.communicator fetchEventData];
}

- (void)downloadImageWithURL:(NSURL *)url
             completionBlock:(void (^)
                              (BOOL succeeded, NSData *data))completionBlock
{
    [self.communicator downloadImageWithURL:url
                            completionBlock:^(BOOL succeeded, NSData *data)
    {
        if (succeeded)
        {
            completionBlock(succeeded,data);
        }
        else
        {
            completionBlock(succeeded,nil);
        }
    }];
}

#pragma mark - EventCommunicatorDelegate

-(void)receiveEventJSON:(NSData*)dataReceivedObj
{
    NSError *error = nil;
    NSArray *arrEvents = [EventsBuilder eventsFromJSON:dataReceivedObj error:error];
    
    if (error!=nil)
    {
        [self.delegate fetchReceiveEventsFailedwithError:error];
    }
    else
    {
        [self.delegate didReceiveEvents:arrEvents];
    }
}

-(void)fetchEventJSONFailedwithError:(NSError*)error
{
    [self.delegate fetchReceiveEventsFailedwithError:error];
}

@end
