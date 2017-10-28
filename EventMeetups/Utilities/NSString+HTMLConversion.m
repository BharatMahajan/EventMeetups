//
//  NSString+HTMLConversion.m
//  EventMeetups
//
//  Created by Er. Bharat Mahajan on 29/10/17.
//  Copyright © 2017 Er. Bharat Mahajan. All rights reserved.
//

#import "NSString+HTMLConversion.h"

@implementation NSString (HTMLConversion)

+(NSString *)convertHTML:(NSString *)html
{
    NSScanner *myScanner;
    NSString *text = nil;
    myScanner = [NSScanner scannerWithString:html];
    
    @autoreleasepool
    {
        while ([myScanner isAtEnd] == NO)
        {
            [myScanner scanUpToString:@"<" intoString:NULL] ;
            [myScanner scanUpToString:@">" intoString:&text] ;
            html = [html stringByReplacingOccurrencesOfString:[NSString stringWithFormat:@"%@>", text] withString:@""];
        }
    }
    html = [html stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    return html;
}

@end
