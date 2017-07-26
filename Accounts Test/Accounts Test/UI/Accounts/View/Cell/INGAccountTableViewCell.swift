//
//  INGAccountTableViewCell.swift
//  Accounts Test
//
//  Created by Ricardo Casanova on 23/07/2017.
//  Copyright © 2017 ING. All rights reserved.
//

import UIKit

class INGAccountTableViewCell: UITableViewCell, DVATableViewCellProtocol {
    //__ IBOutlets
    @IBOutlet weak private var accountNumberTitleLabel : UILabel?
    @IBOutlet weak private var accountAmountTitleLabel : UILabel?
    @IBOutlet weak private var accountNameTitleLabel : UILabel?
    @IBOutlet weak private var accountTypeTitleLabel : UILabel?
    @IBOutlet weak private var accountNumberLabel : UILabel?
    @IBOutlet weak private var accountAmountLabel : UILabel?
    @IBOutlet weak private var accountNameLabel : UILabel?
    @IBOutlet weak private var accountTypeLabel : UILabel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCell()
    }
    
    override func prepareForReuse() {
        self.accountNumberLabel?.text = ""
        self.accountAmountLabel?.text = ""
        self.accountNameLabel?.text = ""
        self.accountTypeLabel?.text = ""
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setupCell() {
        //__ Configure the cell
        self.accountNumberTitleLabel?.text = NSLocalizedString("Account number", comment: "Account number")
        self.accountAmountTitleLabel?.text = NSLocalizedString("Account amount", comment: "Account amount")
        self.accountNameTitleLabel?.text = NSLocalizedString("Account name", comment: "Account name")
        self.accountTypeTitleLabel?.text = NSLocalizedString("Account type", comment: "Account type")
        self.selectionStyle = UITableViewCellSelectionStyle.none
    }
    
    //__ DVATableViewModelProtocol method
    func bind(withModel viewModel: DVATableViewModelProtocol!) {
        //__ Get the view model for cell
        let model : INGAccountsViewObject = (viewModel as? INGAccountsViewObject)!
        //__ Configure outlets
        self.accountNumberLabel?.text = model.accountNumber as String?
        self.accountAmountLabel?.text = model.accountAmount as String?
        self.accountNameLabel?.text = model.accountName as String?
        self.accountTypeLabel?.text = model.accountType as String?
    }
    
}
