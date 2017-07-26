//
//  INGBaseProvider.h
//  Accounts Test
//
//  Created by Ricardo Casanova on 23/07/2017.
//  Copyright © 2017 ING. All rights reserved.
//

#import <Foundation/Foundation.h>

//__ Request Manager End Points
#import "INGRequestManagerEndPoints.h"

//__ Request Manager
#import "INGRequestManager.h"

typedef NS_ENUM(NSUInteger, INGErrorCode) {
    INGErrorEverythingOKCode    =  -1,
    INGErrorGeneralCode         =  0,
    INGErrorCodeServerError     =  1,
};

@interface INGBaseProvider : NSObject

@property (strong, nonatomic) INGRequestManager *requestManager;

- (NSDictionary *)resultWithJson:(NSDictionary *)json key:(NSString *)key;
- (NSArray *)resultArrayWithJson:(NSDictionary *)json key:(NSString *)key;

@end
