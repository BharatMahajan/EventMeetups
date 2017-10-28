//
//  EventCommunicator.h
//  EventMeetups
//
//  Created by Er. Bharat Mahajan on 28/10/17.
//  Copyright © 2017 Er. Bharat Mahajan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EventCommunicatorDelegate.h"
#import "ConstantHeaders.h"

@protocol EventCommunicatorDelegate;

@interface EventCommunicator : NSObject<NSURLSessionDataDelegate, NSURLSessionDelegate, NSURLSessionTaskDelegate>
@property (weak,nonatomic) id delegate;

-(void) fetchEventData;
- (void)downloadImageWithURL:(NSURL *)url
             completionBlock:(void (^)
                              (BOOL succeeded, NSData *data))completionBlock;
@end
