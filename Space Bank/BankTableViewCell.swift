//
//  BankTableViewCell.swift
//  Space Bank
//
//  Created by Tanya Tomchuk on 08/09/2017.
//  Copyright © 2017 Tanya Tomchuk. All rights reserved.
//

import UIKit

class BankTableViewCell: UITableViewCell {
    
    @IBOutlet weak var bankName: UILabel!
    @IBOutlet weak var bankAddress: UILabel!
    @IBOutlet weak var bankSchedule: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
