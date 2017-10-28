//
//  EventModel.h
//  EventMeetups
//
//  Created by Er. Bharat Mahajan on 28/10/17.
//  Copyright © 2017 Er. Bharat Mahajan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EventModel : NSObject
@property (nonatomic,strong) NSDictionary *group_photo;
@property (nonatomic,strong) NSString *name;
@property (nonatomic,strong) NSDictionary *organizer;
@property (nonatomic,strong) NSString *city;
@property (nonatomic,strong) NSString *description;
@property (nonatomic,strong,readwrite) NSData *imageData;

@end
