//
//  EventsBuilder.h
//  EventMeetups
//
//  Created by Er. Bharat Mahajan on 28/10/17.
//  Copyright © 2017 Er. Bharat Mahajan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ConstantHeaders.h"

@interface EventsBuilder : NSObject

+(NSArray*)eventsFromJSON:(NSData*)dataReceivedObj error:(NSError*)error;
@end
