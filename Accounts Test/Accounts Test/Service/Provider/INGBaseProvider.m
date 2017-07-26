//
//  INGBaseProvider.m
//  Accounts Test
//
//  Created by Ricardo Casanova on 23/07/2017.
//  Copyright © 2017 ING. All rights reserved.
//

#import "INGBaseProvider.h"

@implementation INGBaseProvider

- (instancetype)init {
    self = [super init];
    if (self) {
        _requestManager = [INGRequestManager shared];
    }
    return self;
}

- (NSDictionary *)resultWithJson:(NSDictionary *)json key:(NSString *)key {
    return json[key];
}

- (NSArray *)resultArrayWithJson:(NSDictionary *)json key:(NSString *)key {
    return json[key];
}

@end
