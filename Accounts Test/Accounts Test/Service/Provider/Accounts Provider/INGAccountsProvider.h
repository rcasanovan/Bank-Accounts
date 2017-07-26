//
//  INGAccountsProvider.h
//  Accounts Test
//
//  Created by Ricardo Casanova on 23/07/2017.
//  Copyright © 2017 ING. All rights reserved.
//

#import "INGBaseProvider.h"

typedef void (^INGAccountsProviderCompletion)(NSArray *accounts, INGErrorCode errorCode);

@interface INGAccountsProvider : INGBaseProvider

- (void)accountProviderAllAccountOncompletion:(INGAccountsProviderCompletion)completionBlock;

@end
