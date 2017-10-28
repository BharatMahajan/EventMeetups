//
//  ViewController.h
//  EventMeetups
//
//  Created by Er. Bharat Mahajan on 28/10/17.
//  Copyright © 2017 Er. Bharat Mahajan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EventModel.h"
#import "EventManager.h"
#import "EventCommunicator.h"
#import "EventTableViewCell.h"
#import "NSString+HTMLConversion.h"
#import "AlertMessage.h"

@interface ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>{
    NSMutableArray *arrEventsReceived;
    EventManager *eventManager;
    UIRefreshControl *refreshControl;
}
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@property (weak, nonatomic) IBOutlet UITableView *tblEvents;


@end

