//
//  ConstantHeaders.h
//  EventMeetups
//
//  Created by Er. Bharat Mahajan on 28/10/17.
//  Copyright © 2017 Er. Bharat Mahajan. All rights reserved.
//

#ifndef ConstantHeaders_h
#define ConstantHeaders_h

#ifdef DEBUG
#define EVENTSLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)
#else
#define EVENTSLog
#endif


#define kBaseURL @"https://api.meetup.com/2/groups?lat=51.509980&lon=-0.133700&page=20&key=1f5718c16a7fb3a5452f45193232"

#define kRequestMethodGet @"GET"
#define kRequestContentType @"application/json"
#define kRequestParamterAccept @"Accept"
#define kRequestParameterContentType @"Content-Type"

#define kResponseParameterResults @"results"
#define kResponseParameterPhoto @"group_photo"
#define kResponseParameterPhotolink @"highres_link"

#define KResponseParameterOrganizer @"organizer"
#define kResponseParameterOrganizerName @"name"

#define kResponseParameterEventName @"name"
#define kResponseParameterDescription @"description"
#define kResponseParameterCity @"city"

#define kEventImagePlaceholder @"eventPlaceholder"

#define kEventViewButtonMore @"MORE"
#define kEventViewButtonLess @"LESS"

#define kFontUsed @"HelveticaNeue"

#define kDarkGrayColor [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1]
#define kEventTableViewCell @"EventTableViewCell"

#define kResponseFailureMessage @"Unable to load data. \nPlease try again."

#define kOkTextButton @"Ok"
#endif /* ConstantHeaders_h */
