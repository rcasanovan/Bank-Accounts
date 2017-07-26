//
//  INGRequestManager.h
//  Accounts Test
//
//  Created by Ricardo Casanova on 23/07/2017.
//  Copyright © 2017 ING. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 A general completion block for network calls
 
 @param redirectURL the redirect URL if any
 @param json        a json returned from server
 @param success     if success
 @param error       error object
 
 @since 1.0
 */
typedef void(^INGNetworkGeneralCompletionBlock)(NSURL *redirectURL, NSDictionary *json, BOOL success, NSError *error);

@interface INGRequestManager : NSObject

+ (instancetype)shared;

#pragma mark - API calls

- (void)requestManagerAllAccountOncompletion:(INGNetworkGeneralCompletionBlock)completionBlock;

@end
