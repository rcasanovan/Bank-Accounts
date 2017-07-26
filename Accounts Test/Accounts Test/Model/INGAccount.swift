//
//  INGAccount.swift
//  Accounts Test
//
//  Created by Ricardo Casanova on 23/07/2017.
//  Copyright © 2017 ING. All rights reserved.
//

import UIKit

class INGAccount: NSObject {
    //__ Atributtes
    internal var accountBalanceInCents : NSNumber?
    internal var accountCurrency : NSString?
    internal var accountId : NSString?
    internal var accountName : NSString?
    internal var accountNumber : NSString?
    internal var accountType : NSString?
    internal var alias : NSString?
    internal var iban : NSString?
    internal var isVisible : Bool?
    internal var linkedAccountId : NSString?
    internal var productName : NSString?
    internal var productType : NSNumber?
    internal var savingsTargetReached : NSNumber?
    internal var targetAmountInCents : NSNumber?
    
    //__ Init method
    init(accountBalanceInCents : NSNumber, accountCurrency : NSString, accountId : NSString, accountName : NSString, accountNumber : NSString, accountType : NSString, alias : NSString, iban : NSString, isVisible : Bool, linkedAccountId : NSString, productName : NSString, productType : NSNumber, savingsTargetReached : NSNumber, targetAmountInCents : NSNumber) {
        super.init()
        self.accountBalanceInCents = accountBalanceInCents
        self.accountCurrency = accountCurrency
        self.accountId = accountId
        self.accountName = accountName
        self.accountNumber = accountNumber
        self.accountType = accountType
        self.alias = alias
        self.iban = iban
        self.isVisible = isVisible
        self.linkedAccountId = linkedAccountId
        self.productName = productName
        self.productType = productType
        self.savingsTargetReached = savingsTargetReached
        self.targetAmountInCents = targetAmountInCents
    }
}
