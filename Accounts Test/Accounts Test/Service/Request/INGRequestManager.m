//
//  INGRequestManager.m
//  Accounts Test
//
//  Created by Ricardo Casanova on 23/07/2017.
//  Copyright © 2017 ING. All rights reserved.
//

#import "INGRequestManager.h"

//__ IMPORTANT NOTE:
//__ This class could contain all configurations for API calls
//__ For this sample the result is returned from a local JSON file
@implementation INGRequestManager

#pragma mark - Shared

+ (instancetype)shared {
    static INGRequestManager *requestManager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        requestManager = [INGRequestManager new];
    });
    return requestManager;
}

#pragma mark - Private methods

- (NSDictionary *)JSONFromFile {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"accounts" ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:path];
    return [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
}

#pragma mark - Public methods

- (void)requestManagerAllAccountOncompletion:(INGNetworkGeneralCompletionBlock)completionBlock {
    //__ Simulate an API call. The results is returned from a JSON file
    NSDictionary *dictionaryResponse = [self JSONFromFile];
    if (completionBlock) {
        completionBlock ([NSURL URLWithString:@"www.ingbank.com/test"], dictionaryResponse, YES, nil);
    }
}

@end
