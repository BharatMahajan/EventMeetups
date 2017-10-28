//
//  EventCommunicatorDelegate.h
//  EventMeetups
//
//  Created by Er. Bharat Mahajan on 28/10/17.
//  Copyright © 2017 Er. Bharat Mahajan. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol EventCommunicatorDelegate <NSObject>

-(void)receiveEventJSON:(NSData*)dataReceivedObj;
-(void)fetchEventJSONFailedwithError:(NSError*)error;
@end

