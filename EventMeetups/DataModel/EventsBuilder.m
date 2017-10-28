//
//  EventsBuilder.m
//  EventMeetups
//
//  Created by Er. Bharat Mahajan on 28/10/17.
//  Copyright © 2017 Er. Bharat Mahajan. All rights reserved.
//

#import "EventsBuilder.h"
#import "EventModel.h"
@implementation EventsBuilder

+(NSArray*)eventsFromJSON:(NSData*)dataReceivedObj error:(NSError*)error{
    NSError *localizedError = nil;
    NSDictionary *dictParsedObj = [NSJSONSerialization JSONObjectWithData:dataReceivedObj options:0 error:&localizedError];
    
    if (localizedError!=nil) {
        error  = localizedError;
        return nil;
    }
    
    NSMutableArray *arrEvents = [[NSMutableArray alloc] init];
    
    NSArray *arrResults = [dictParsedObj objectForKey:kResponseParameterResults];
    
    for (NSDictionary *dictEvent in arrResults) {
        
        EventModel *event = [[EventModel alloc] init];
        for (NSString *key in dictEvent) {
            
            if ([event respondsToSelector:NSSelectorFromString(key)]) {
                [event setValue:[dictEvent valueForKey:key] forKey:key];
            }
        }
        [arrEvents addObject:event];
    }
    return arrEvents;
}
@end
