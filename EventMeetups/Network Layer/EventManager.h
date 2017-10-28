//
//  EventManager.h
//  EventMeetups
//
//  Created by Er. Bharat Mahajan on 28/10/17.
//  Copyright © 2017 Er. Bharat Mahajan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EventManagerDelegate.h"
#import "EventCommunicatorDelegate.h"

@class EventCommunicator;

@interface EventManager : NSObject
@property (strong,nonatomic) EventCommunicator *communicator;
@property (weak, nonatomic) id delegate;

-(void)fetchEventsData;
- (void)downloadImageWithURL:(NSURL *)url completionBlock:(void (^)(BOOL succeeded, NSData *data))completionBlock;
@end
