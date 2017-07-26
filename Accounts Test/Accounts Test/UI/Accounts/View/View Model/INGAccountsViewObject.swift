//
//  INGAccountsViewObject.swift
//  Accounts Test
//
//  Created by Ricardo Casanova on 23/07/2017.
//  Copyright © 2017 ING. All rights reserved.
//

import UIKit

class INGAccountsViewObject: NSObject, DVATableViewModelProtocol, NSCoding {
    //__ Atributtes
    internal var accountNumber : NSString?
    internal var accountAmount : NSString?
    internal var accountName : NSString?
    internal var accountType : NSString?
    
    //__ Init method
    init(accountNumber: NSString, accountAmount: NSString, accountName: NSString, accountType: NSString) {
        super.init()
        self.accountNumber = accountNumber
        self.accountAmount = accountAmount
        self.accountName = accountName
        self.accountType = accountType
    }
    
    private class func generateAccountName(account: INGAccount) -> NSString {
        var accountName: NSString = ""
        //__ Do we have an account name? -> use it
        if !(account.accountName?.isEqual(to: ""))! {
            accountName = account.accountName!
        }
        //__ Do we have an alias for account? -> use it
        else if !(account.alias?.isEqual(to: ""))!{
            accountName = account.alias!
        }
        //__ Otherwise
        else {
            accountName = "-"
        }
        return accountName
    }
    
    private class func generateAccountAmount(account: INGAccount) -> NSString {
        var amount : Double
        var amountInformation: NSString = ""
        //__ Amount is in cents, so we need to transform the value in order to show it
        amount = (account.accountBalanceInCents?.doubleValue)! / 100.0
        amountInformation = String(format:"%.2f %@", Double(amount), account.accountCurrency!) as NSString
        return amountInformation
    }
    
    //__ Generate the accounts objects to use un UI
    internal class func generateCharactersObjects(onlyVisibleAccounts : Bool, accounts : [INGAccount]) -> Array<INGAccountsViewObject> {
        var items: [INGAccountsViewObject] = []
        
        for account in accounts {
            //__ Show only visible / not visible accounts
            if (account.isVisible == onlyVisibleAccounts) {
                let item = INGAccountsViewObject(accountNumber: account.accountNumber!, accountAmount: generateAccountAmount(account: account), accountName: generateAccountName(account: account), accountType: account.accountType!)
                items.append(item)
            }
        }
        return items
    }
    
    //__ Generate the account objects to use un UI (all accounts)
    internal class func generateCharactersObjects(accounts : [INGAccount]) -> Array<INGAccountsViewObject> {
        var items: [INGAccountsViewObject] = []
        
        for account in accounts {
                let item = INGAccountsViewObject(accountNumber: account.accountNumber!, accountAmount: generateAccountAmount(account: account), accountName: generateAccountName(account: account), accountType: account.accountType!)
                items.append(item)
        }
        return items
    }
    
    //__ Set the cell identifier
    func dva_cellIdentifier() -> String! {
        return INGAccountTableViewCell.description()
    }
    
    //__ NSCoding protocol methods. We need to implement this in order to send this information to the Widget
    convenience required init(coder aDecoder: NSCoder) {
        //__ Decode the fields and create an object
        let accountNumberD = aDecoder.decodeObject(forKey: "accountNumber") as! NSString
        let accountAmountD = aDecoder.decodeObject(forKey: "accountAmount") as! NSString
        let accountNameD = aDecoder.decodeObject(forKey: "accountName") as! NSString
        let accountTypeD = aDecoder.decodeObject(forKey: "accountType") as! NSString
        self.init(
            accountNumber: accountNumberD,
            accountAmount: accountAmountD,
            accountName: accountNameD,
            accountType: accountTypeD
        )
    }

    func encode(with aCoder: NSCoder) {
        //__ Encode the fields in order to send the objects to the widget
        aCoder.encode(accountNumber, forKey: "accountNumber")
        aCoder.encode(accountAmount, forKey: "accountAmount")
        aCoder.encode(accountName, forKey: "accountName")
        aCoder.encode(accountType, forKey: "accountType")
    }
}
