//
//  EventManagerDelegate.h
//  EventMeetups
//
//  Created by Er. Bharat Mahajan on 28/10/17.
//  Copyright © 2017 Er. Bharat Mahajan. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol EventManagerDelegate <NSObject>
-(void)didReceiveEvents:(NSArray*)arrEvents;
-(void)fetchReceiveEventsFailedwithError:(NSError*)error;

@end
