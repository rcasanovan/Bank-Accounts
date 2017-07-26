//
//  INGAccountsProvider.m
//  Accounts Test
//
//  Created by Ricardo Casanova on 23/07/2017.
//  Copyright © 2017 ING. All rights reserved.
//

#import "INGAccountsProvider.h"

#ifdef ACCOUNTS_TARGET
//__ Add bridge comunication with swift
#import "Accounts_Test-Swift.h"
#endif

#ifdef QUOTE_TARGET
//__ Add bridge comunication with swift
#import "AccountQuote-Swift.h"
#endif

@implementation INGAccountsProvider

- (void)accountProviderAllAccountOncompletion:(INGAccountsProviderCompletion)completionBlock {
    [self.requestManager requestManagerAllAccountOncompletion:^(NSURL *redirectURL, NSDictionary *json, BOOL success, NSError *error) {
        if (success) {
            NSMutableArray *accountsResults = [NSMutableArray new];
            NSArray *accounts = json[kTagAccounts];
            for (NSDictionary *eachAccount in accounts) {
                NSNumber *accountBalanceInCents = eachAccount[kTagAccountBalanceInCents];
                NSString *accountCurrency = eachAccount[kTagAccountCurrency];
                NSString *accountId = eachAccount[kTagAccountId];
                NSString *accountName = eachAccount[kTagAccountName];
                NSString *accountNumber = eachAccount[kTagAccountNumber];
                NSString *accountType = eachAccount[kTagAccountType];
                NSString *alias = eachAccount[kTagAlias];
                NSString *iban = eachAccount[kTagIban];
                NSNumber *isVisible = eachAccount[kTagisVisible];
                NSString *linkedAccountId = eachAccount[kTagLinkedAccountId];
                NSString *productName = eachAccount[kTagProductName];
                NSNumber *productType = eachAccount[kTagProductType];
                NSNumber *savingsTargetReached = eachAccount[kTagSavingsTargetReached];
                NSNumber *targetAmountInCents = eachAccount[kTagTargetAmountInCents];
                
                [accountsResults addObject:[[INGAccount alloc] initWithAccountBalanceInCents:accountBalanceInCents accountCurrency:accountCurrency accountId:accountId accountName:accountName accountNumber:accountNumber accountType:accountType alias:alias iban:iban isVisible:isVisible.boolValue linkedAccountId:linkedAccountId productName:productName productType:productType savingsTargetReached:savingsTargetReached targetAmountInCents:targetAmountInCents]];
            }
            if (completionBlock) completionBlock ([accountsResults copy], INGErrorEverythingOKCode);
        }
        else {
            if (completionBlock) completionBlock (nil, INGErrorCodeServerError);
        }
    }];
}

@end
