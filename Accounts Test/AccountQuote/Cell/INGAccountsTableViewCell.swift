//
//  INGAccountsTableViewCell.swift
//  Accounts Test
//
//  Created by Ricardo Casanova on 26/07/2017.
//  Copyright © 2017 ING. All rights reserved.
//

import UIKit

class INGAccountsTableViewCell: UITableViewCell {
    //__ IBOutlets
    @IBOutlet weak private var accountNumberTitleLabel : UILabel?
    @IBOutlet weak private var accountAmountTitleLabel : UILabel?
    @IBOutlet weak var visibleAccountLabel : UILabel?
    @IBOutlet weak var accountNumberLabel : UILabel?
    @IBOutlet weak var accountAmountLabel : UILabel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCell()
    }
    
    override func prepareForReuse() {
        self.visibleAccountLabel?.text = ""
        self.accountNumberLabel?.text = ""
        self.accountAmountLabel?.text = ""
    }
    
    func setupCell() {
        //__ Configure the cell
        self.accountNumberTitleLabel?.text = NSLocalizedString("Account number", comment: "Account number")
        self.accountAmountTitleLabel?.text = NSLocalizedString("Account amount", comment: "Account amount")
        self.selectionStyle = UITableViewCellSelectionStyle.none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
