//
//  EventTableViewCell.h
//  EventMeetups
//
//  Created by Er. Bharat Mahajan on 28/10/17.
//  Copyright © 2017 Er. Bharat Mahajan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EventTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIView *viewBg;
@property (weak, nonatomic) IBOutlet UIImageView *imgEvent;
@property (weak, nonatomic) IBOutlet UILabel *lblEventName;
@property (weak, nonatomic) IBOutlet UILabel *lblOrganizerName;
@property (weak, nonatomic) IBOutlet UILabel *lblCity;
@property (weak, nonatomic) IBOutlet UILabel *lblDescription;
@property (weak, nonatomic) IBOutlet UIView *viewMore;
@property (weak, nonatomic) IBOutlet UIButton *btnMore;
@property (weak, nonatomic) IBOutlet UILabel *lblButtonName;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;

@end
