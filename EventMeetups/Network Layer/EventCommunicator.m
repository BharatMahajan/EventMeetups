//
//  EventCommunicator.m
//  EventMeetups
//
//  Created by Er. Bharat Mahajan on 28/10/17.
//  Copyright © 2017 Er. Bharat Mahajan. All rights reserved.
//

#import "EventCommunicator.h"

@implementation EventCommunicator


-(void) fetchEventData{
    
    NSMutableURLRequest *request1 = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:kBaseURL]];
    
    [request1 setHTTPMethod:kRequestMethodGet];
    [request1 setValue:kRequestContentType forHTTPHeaderField:kRequestParamterAccept];
    [request1 setValue:kRequestContentType forHTTPHeaderField:kRequestParameterContentType];
    
    NSURLSession *session = [NSURLSession sharedSession];
    [session invalidateAndCancel];
    
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request1
                                            completionHandler:
                                  ^(NSData *data, NSURLResponse *response, NSError *error)
                                  {
                                      dispatch_async(dispatch_get_main_queue(), ^{

                                      NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *) response;
                                      if([httpResponse statusCode] == 200){
                                          if(error==nil){
                                              [self.delegate receiveEventJSON:data];
                                          }
                                          else{
                                              [self.delegate fetchEventJSONFailedwithError:error];
                                          }
                                      }
                                      else
                                      {
                                          [self.delegate fetchEventJSONFailedwithError:error];
                                      }
                                      });
                                  }];
    
    [task resume];
}

- (void)downloadImageWithURL:(NSURL *)url completionBlock:(void (^)(BOOL succeeded, NSData *data))completionBlock
{
    NSURLSession *session = [NSURLSession sharedSession];
    [session invalidateAndCancel];
    NSURLSessionDataTask *task = [session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        dispatch_async(dispatch_get_main_queue(), ^{

        if ( !error )
        {
            completionBlock(YES,data);
        } else{
            completionBlock(NO,nil);
        }
        });
    }];
    [task resume];
}

@end
