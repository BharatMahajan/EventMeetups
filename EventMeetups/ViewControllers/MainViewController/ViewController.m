//
//  ViewController.m
//  EventMeetups
//
//  Created by Er. Bharat Mahajan on 28/10/17.
//  Copyright © 2017 Er. Bharat Mahajan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    NSMutableArray *arrSelectedMoreIndex;
}
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    eventManager = [[EventManager alloc] init];
    eventManager.communicator = [[EventCommunicator alloc] init];
    eventManager.communicator.delegate = eventManager;
    eventManager.delegate = self;
    
    arrEventsReceived = [[NSMutableArray alloc] init];
    arrSelectedMoreIndex = [[NSMutableArray alloc] init];
    
    refreshControl = [[UIRefreshControl alloc] init];
    refreshControl.backgroundColor = [UIColor clearColor];
    refreshControl.tintColor = [UIColor blueColor];
    [refreshControl addTarget:self
                       action:@selector(refreshTableViewData:)
             forControlEvents:UIControlEventValueChanged];
    [self.tblEvents addSubview:refreshControl];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    [self.activityIndicator startAnimating];
    [eventManager fetchEventsData];
}

- (void)refreshTableViewData:(UIRefreshControl *)refreshControl
{
    [eventManager fetchEventsData];
    [refreshControl endRefreshing];
}

#pragma mark - Tableview Methods
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([arrSelectedMoreIndex containsObject:[NSNumber numberWithInteger:indexPath.row]])
    {
        EventModel *event = arrEventsReceived[indexPath.row];
        NSAttributedString *attributedText = [[NSAttributedString alloc]
                                              initWithString:[NSString convertHTML:event.description]
                                              attributes:@{NSFontAttributeName: [UIFont fontWithName:kFontUsed size:18]}];

        CGRect rect = [attributedText
                       boundingRectWithSize:(CGSize){self.view.frame.size.width-60,CGFLOAT_MAX}
                       options:NSStringDrawingUsesLineFragmentOrigin context:nil];
        
        if (rect.size.height > 21)
        {
            return rect.size.height + (360-21);
        }
    }
    return 360;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return arrEventsReceived.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *simpleTableIdentifier = kEventTableViewCell;
    EventTableViewCell *cell = (EventTableViewCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:kEventTableViewCell owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
    cell.viewBg.layer.shadowColor = kDarkGrayColor.CGColor;
    cell.viewBg.layer.shadowOffset = CGSizeMake(0, 3);
    cell.viewBg.layer.shadowOpacity = 0.2;
    cell.viewBg.layer.shadowRadius = 2;
    cell.viewBg.layer.masksToBounds = NO;
   
    EventModel *event = arrEventsReceived[indexPath.row];
    
    cell.lblEventName.text = event.name;
    cell.lblOrganizerName.text = event.organizer[kResponseParameterOrganizerName];
    cell.lblCity.text = event.city;
    
    [cell.activityIndicator startAnimating];
    
    if (event.imageData.length>0)
    {
        [cell.activityIndicator stopAnimating];
        cell.imgEvent.image = [UIImage imageWithData:event.imageData];
    }
    else
    {
        [eventManager downloadImageWithURL:[NSURL URLWithString:
                                            event.group_photo[kResponseParameterPhotolink]]
                           completionBlock:^(BOOL succeeded, NSData *data) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [cell.activityIndicator stopAnimating];
            });
            if (succeeded) {
                cell.imgEvent.image = [UIImage imageWithData:data];
                event.imageData = data;
            }
        }];
    }
    
    cell.lblDescription.text = [NSString convertHTML:event.description];
    
    cell.btnMore.tag = indexPath.row;
    [cell.btnMore addTarget:self
                     action:@selector(moreButtonClicked:)
           forControlEvents:UIControlEventTouchUpInside];
    
    if ([arrSelectedMoreIndex containsObject:[NSNumber numberWithInteger:indexPath.row]])
    {
        [cell.lblButtonName setText:kEventViewButtonLess];
        cell.lblDescription.numberOfLines = 0;
    }
    else
    {
        [cell.lblButtonName setText:kEventViewButtonMore];
        cell.lblDescription.numberOfLines = 1;
    }
    return cell;
}

-(IBAction)moreButtonClicked:(UIButton*)sender
{
    if ([arrSelectedMoreIndex containsObject:[NSNumber numberWithInteger:sender.tag]])
    {
        [arrSelectedMoreIndex removeObject:[NSNumber numberWithInteger:sender.tag]];
    }
    else{
        [arrSelectedMoreIndex addObject:[NSNumber numberWithInteger:sender.tag]];
    }
    
    [self.tblEvents reloadData];
    [self.tblEvents scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:sender.tag inSection:0]
                          atScrollPosition:UITableViewScrollPositionBottom animated:NO];
}

#pragma mark - EventManagerDelegate

-(void)didReceiveEvents:(NSArray*)arrEvents
{
    arrEventsReceived = [NSMutableArray arrayWithArray:arrEvents];
    
    if (arrEvents.count == 0 || arrEvents == nil || arrEvents == NULL)
    {
        [AlertMessage showSimpleAlertIn:self
                              WithTitle:kResponseFailureMessage
                                message:nil
                      cancelButtonTitle:kOkTextButton];
        if (refreshControl.isRefreshing)
        {
            [refreshControl endRefreshing];
        }
    }
    else
        [self.tblEvents reloadData];
    dispatch_async(dispatch_get_main_queue(), ^
    {
        [self.activityIndicator stopAnimating];
    });
}

-(void)fetchReceiveEventsFailedwithError:(NSError*)error
{
    [AlertMessage showSimpleAlertIn:self
                          WithTitle:[error localizedDescription]
                            message:nil
                  cancelButtonTitle:kOkTextButton];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
