//
//  INGAccountsViewController.swift
//  Accounts Test
//
//  Created by Ricardo Casanova on 23/07/2017.
//  Copyright © 2017 ING. All rights reserved.
//

import UIKit

class INGAccountsViewController: INGBaseViewController, INGAccountsViewDelegate {
    //__ Private section
    private var accountsView : INGAccountsView {
        get {
            return (self.view as? INGAccountsView)!;
        }
    }
    //__ Atributtes
    private var accounts : [INGAccount] = []
    private var accountsProvider : INGAccountsProvider?
    private var showVisibleAccounts = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //__ Configure the view delegate
        self.accountsView.delegate = self
        
        //__ Configure the view model
        viewModel()
        //__ Configure the provider for accounts
        self.accountsProvider = INGAccountsProvider()
        //__ Load all accounts
        loadAllAccounts()
    }
    
    private func viewModel() {
        let viewModel = INGAccountsViewModel()
        viewModel.accounts = []
        self.accountsView.viewModel = viewModel;
    }
    
    private func loadAllAccounts() {
        self.accountsProvider?.accountProviderAllAccountOncompletion({ (accounts: [Any]?, errorCode: INGErrorCode) in
            //__ If error code != INGErrorCode.everythingOKCode -> Something wrong happened
            if errorCode != INGErrorCode.everythingOKCode {
                //__ We can show a popup message
                self.showAlertWith(message: "Something is wrong", title: "Ups! :(")
            }
            
            //__ Save values locally
            self.accounts = accounts as! [INGAccount]
            //__ Get the view model && inject the new information
            let viewModel : INGAccountsViewModel = self.accountsView.viewModel!
            viewModel.accounts = INGAccountsViewObject.generateCharactersObjects(onlyVisibleAccounts: self.showVisibleAccounts, accounts: self.accounts)
            //__ Reload the view model
            self.accountsView.viewModel = viewModel
            
            self.sendInformationToWidget()
        })
    }
    
    //__ Send information to widget
    func sendInformationToWidget() {
        INGAccountsViewObject.registerClassName()
        //__ Transform our array to data type
        let encodedData = NSKeyedArchiver.archivedData(withRootObject: INGAccountsViewObject.generateCharactersObjects(accounts: self.accounts))
        //__ Inject the data to the App Group && syncronize
        let userDefaults: UserDefaults = UserDefaults.init(suiteName: "group.AccountTestExtensionSharingDefaults")!
        userDefaults.set(encodedData, forKey: "accountInformation")
        userDefaults.synchronize()
    }
    
    //__ accountsViewDelegate methods
    func accountsViewDelegateShowVisibleAccounts(showVisibleAccounts:Bool) {
        //__ Save the selected value in the UI
        self.showVisibleAccounts = showVisibleAccounts
        //__ Get the view model && inject the new information
        let viewModel : INGAccountsViewModel = self.accountsView.viewModel!
        viewModel.accounts = INGAccountsViewObject.generateCharactersObjects(onlyVisibleAccounts: self.showVisibleAccounts, accounts: self.accounts)
        //__ Reload the view model
        self.accountsView.viewModel = viewModel
    }
}
