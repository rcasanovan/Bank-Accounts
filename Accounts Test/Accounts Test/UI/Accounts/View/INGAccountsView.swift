//
//  INGAccountsView.swift
//  Accounts Test
//
//  Created by Ricardo Casanova on 23/07/2017.
//  Copyright © 2017 ING. All rights reserved.
//

import UIKit

class INGAccountsView: INGBaseView, DVATableViewModelDatasourceDelegate, UITableViewDelegate {
    //__ IBOutlets
    @IBOutlet weak private var accountTableView : UITableView?
    @IBOutlet weak private var accountsTypeSegmentedControl : UISegmentedControl?
    //__ Private section
    private var datasource : DVAProtocolDataSourceForTableView?;
    //__ Internal section
    internal var delegate:INGAccountsViewDelegate?
    internal var viewModel:INGAccountsViewModel? {
        didSet {
            self.datasource?.viewModelDataSource = viewModel!.accounts as DVATableViewModelDatasource
            self.accountTableView?.reloadData()
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        //__ Configure view
        setupView()
    }
    
    private func setupView() {
        self.accountsTypeSegmentedControl?.setTitle(NSLocalizedString("Account visible accounts", comment: "Account visible accounts"), forSegmentAt: 0)
        self.accountsTypeSegmentedControl?.setTitle(NSLocalizedString("Account no visible accounts", comment: "Account no visible accounts"), forSegmentAt: 1)
        setupDataSource()
    }
    
    private func setupDataSource() {
        //__ The delegate is self
        self.accountTableView?.delegate = self
        //__ Register the cell
        self.accountTableView?.register(UINib(nibName: "INGAccountTableViewCell", bundle: nil), forCellReuseIdentifier: "INGAccountTableViewCell")
        //__ Remove empty separator lines
        let tableView =  UIView(frame: CGRect.zero)
        self.accountTableView!.tableFooterView = tableView
        self.accountTableView!.tableFooterView!.isHidden = true
        //__ Init the data source
        self.datasource = DVAProtocolDataSourceForTableView()
        self.datasource?.delegate = self
        //__ Assign the data source
        self.accountTableView?.dataSource = self.datasource
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200.0
    }
    
    @IBAction func segmentedControlPressed(sender: UISegmentedControl) {
        delegate?.accountsViewDelegateShowVisibleAccounts(showVisibleAccounts: sender.selectedSegmentIndex == 0)
    }
}

//__ View model class
class INGAccountsViewModel: NSObject {
    var accounts:[INGAccountsViewObject] = [] //__ accounts
}

//__ Delegate method class
protocol INGAccountsViewDelegate {
    func accountsViewDelegateShowVisibleAccounts(showVisibleAccounts:Bool)
}
