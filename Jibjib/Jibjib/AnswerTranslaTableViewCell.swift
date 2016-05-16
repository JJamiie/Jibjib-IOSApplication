//
//  AnswerTranslaTableViewCell.swift
//  Jibjib
//
//  Created by JJamie Rashata on 5/14/2559 BE.
//  Copyright © 2559 Chulalongkorn University. All rights reserved.
//

import UIKit

class AnswerTranslaTableViewCell: UITableViewCell {

    @IBOutlet weak var img_profile: UIImageView!
    @IBOutlet weak var lab_name: UILabel!
    @IBOutlet weak var lab_answer: UILabel!
    @IBOutlet weak var lab_sum_vote: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
