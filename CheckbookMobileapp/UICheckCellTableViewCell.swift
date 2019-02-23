//
//  UICheckCellTableViewCell.swift
//  CheckbookMobileapp
//
//  Created by Varun on 2/23/19.
//  Copyright © 2019 Varun Tandon. All rights reserved.
//

import UIKit

class UICheckCellTableViewCell: UITableViewCell {

    @IBOutlet weak var checkNumberLabel: UILabel!
    @IBOutlet weak var checkStatusLabel: UILabel!
    @IBOutlet weak var checkAmountLabel: UILabel!
    @IBOutlet weak var checkDateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
