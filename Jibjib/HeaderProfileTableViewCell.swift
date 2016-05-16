 //
//  HeaderProfileTableViewCell.swift
//  Jibjib
//
//  Created by JJamie Rashata on 5/14/2559 BE.
//  Copyright © 2559 Chulalongkorn University. All rights reserved.
//

import UIKit

class HeaderProfileTableViewCell: UITableViewCell {
    @IBOutlet weak var img_profile: UIImageView!
    @IBOutlet weak var txt_name: UILabel!
    @IBOutlet weak var txt_work: UILabel!
    @IBOutlet weak var txt_answers: UILabel!
    @IBOutlet weak var txt_votes: UILabel!
    @IBOutlet weak var txt_comments: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    
        // Configure the view for the selected state
    }

}
