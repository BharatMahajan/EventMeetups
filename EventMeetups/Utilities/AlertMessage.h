//
//  AlertMessage.h
//  EventMeetups
//
//  Created by Er. Bharat Mahajan on 29/10/17.
//  Copyright © 2017 Er. Bharat Mahajan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void (^UIAlertCompletionBlock) (UIAlertController *alertViewController, NSInteger buttonIndex);

@interface AlertMessage : NSObject
+ (UIAlertController *)showAlertIn:(UIViewController *)controller
                         WithTitle:(NSString *)title
                           message:(NSString *)message
                 cancelButtonTitle:(NSString *)cancelButtonTitle
                 otherButtonTitles:(NSString *)otherButtonTitle
                          tapBlock:(UIAlertCompletionBlock)tapBlock;

+ (UIAlertController *)showSimpleAlertIn:(UIViewController *)controller
                               WithTitle:(NSString *)title
                                 message:(NSString *)message
                       cancelButtonTitle:(NSString *)cancelButtonTitle;

@end
