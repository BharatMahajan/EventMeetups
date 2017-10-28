//
//  AlertMessage.m
//  EventMeetups
//
//  Created by Er. Bharat Mahajan on 29/10/17.
//  Copyright © 2017 Er. Bharat Mahajan. All rights reserved.
//

#import "AlertMessage.h"

@implementation AlertMessage

+ (UIAlertController *)showAlertIn:(UIViewController *)controller
                         WithTitle:(NSString *)title
                           message:(NSString *)message
                 cancelButtonTitle:(NSString *)cancelButtonTitle
                 otherButtonTitles:(NSString *)otherButtonTitle
                          tapBlock:(UIAlertCompletionBlock)tapBlock
{
    UIAlertController * alertController = [UIAlertController
                                           alertControllerWithTitle:title
                                           message:message
                                           preferredStyle:UIAlertControllerStyleAlert];
    
    if(cancelButtonTitle != nil)
    {
        UIAlertAction *cancelButton = [UIAlertAction
                                       actionWithTitle:cancelButtonTitle
                                       style:UIAlertActionStyleCancel
                                       handler:^(UIAlertAction *action)
                                       {
                                           tapBlock(alertController, 0);
                                       }];
        [alertController addAction:cancelButton];
    }
    
    if(otherButtonTitle != nil)
    {
        UIAlertAction *otherButton = [UIAlertAction
                                      actionWithTitle:otherButtonTitle
                                      style:UIAlertActionStyleDefault
                                      handler:^(UIAlertAction *action)
                                      {
                                          tapBlock(alertController, 1);
                                      }];
        [alertController addAction:otherButton];
    }
    
    [controller presentViewController:alertController animated:YES completion:nil];
    return alertController;
}

+ (UIAlertController *)showSimpleAlertIn:(UIViewController *)controller
                               WithTitle:(NSString *)title
                                 message:(NSString *)message
                       cancelButtonTitle:(NSString *)cancelButtonTitle
{
    UIAlertController * alertController = [UIAlertController
                                           alertControllerWithTitle:title
                                           message:message
                                           preferredStyle:UIAlertControllerStyleAlert];
    
    if(cancelButtonTitle != nil)
    {
        UIAlertAction *cancelButton = [UIAlertAction
                                       actionWithTitle:cancelButtonTitle
                                       style:UIAlertActionStyleCancel
                                       handler:^(UIAlertAction *action)
                                       {
                                           [alertController dismissViewControllerAnimated:YES completion:nil];
                                       }];
        [alertController addAction:cancelButton];
    }
    
    [controller presentViewController:alertController animated:YES completion:nil];
    return alertController;
}
@end
