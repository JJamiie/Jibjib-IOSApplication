//
//  HeaderTranslationTableViewCell.swift
//  Jibjib
//
//  Created by JJamie Rashata on 5/14/2559 BE.
//  Copyright © 2559 Chulalongkorn University. All rights reserved.
//

import UIKit

class HeaderTranslationTableViewCell: UITableViewCell {

    @IBOutlet weak var lab_from_language: NSLayoutConstraint!
    @IBOutlet weak var lab_content: UILabel!
    @IBOutlet weak var lab_to_language: UILabel!
    @IBOutlet weak var lab_number_of_answer: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
