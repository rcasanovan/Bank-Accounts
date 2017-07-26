//
//  TodayViewController.swift
//  AccountQuote
//
//  Created by Ricardo Casanova on 23/07/2017.
//  Copyright © 2017 ING. All rights reserved.
//

import UIKit
import NotificationCenter

class TodayViewController: UIViewController, NCWidgetProviding, UITableViewDelegate, UITableViewDataSource {
    //__ IBOutlets
    @IBOutlet weak private var accountTableView : UITableView?
    //__ Private section
    private var accounts : [INGAccountsViewObject] = []
    private var showVisibleAccounts = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if #available(iOSApplicationExtension 10.0, *) {
            extensionContext?.widgetLargestAvailableDisplayMode = .expanded
        }
        self.preferredContentSize.height = CGFloat(self.accounts.count) * 120.0
        readAccounts()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    func widgetMarginInsets(forProposedMarginInsets defaultMarginInsets: UIEdgeInsets) -> (UIEdgeInsets) {
        return UIEdgeInsets.zero
    }
    
    @available(iOSApplicationExtension 10.0, *)
    func widgetActiveDisplayModeDidChange(_ activeDisplayMode: NCWidgetDisplayMode, withMaximumSize maxSize: CGSize) {
        if activeDisplayMode == .expanded {
            preferredContentSize = CGSize(width: maxSize.width, height: CGFloat(self.accounts.count) * 120.0)
        }
        else if activeDisplayMode == .compact {
            preferredContentSize = maxSize
        }
    }
    
    func widgetPerformUpdate(completionHandler: (@escaping (NCUpdateResult) -> Void)) {
        readAccounts()
        completionHandler(NCUpdateResult.newData)
    }
    
    private func readAccounts() {
        //__ Get the app group
        if let userDefaults = UserDefaults(suiteName: "group.AccountTestExtensionSharingDefaults") {
            //__ Get the data
            let value = userDefaults.data(forKey: "accountInformation")
            INGAccountsViewObject.registerClassName()
            //__ Decode the data in order to get the array
            self.accounts = NSKeyedUnarchiver.unarchiveObject(with: value!) as! [INGAccountsViewObject]
            self.accountTableView?.reloadData()
        }
    }
    
    //__ TableView Data Source
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return accounts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "INGAccountsTableViewCell", for: indexPath) as! INGAccountsTableViewCell
        let item = accounts[indexPath.row] as INGAccountsViewObject
        cell.accountNumberLabel?.text = item.accountNumber! as String
        cell.accountAmountLabel?.text = item.accountAmount! as String
        cell.visibleAccountLabel?.text = item.accountType! as String
        cell.textLabel?.textColor = UIColor.black
        return cell
    }
    
}
