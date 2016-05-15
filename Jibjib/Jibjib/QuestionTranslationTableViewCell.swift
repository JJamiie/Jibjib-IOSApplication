//
//  QuestionTranslationTableViewCell.swift
//  Jibjib
//
//  Created by JJamie Rashata on 5/15/2559 BE.
//  Copyright © 2559 Chulalongkorn University. All rights reserved.
//

import UIKit

class QuestionTranslationTableViewCell: UITableViewCell {
    @IBOutlet weak var lab_title: UILabel!
    @IBOutlet weak var lab_content: UILabel!
    @IBOutlet weak var lab_number_of_vote: UILabel!
    @IBOutlet weak var lab_number_of_view: UILabel!
    @IBOutlet weak var lab_number_of_question: UILabel!
    @IBOutlet weak var lab_name: UILabel!
    @IBOutlet weak var lab_time: UILabel!
    
    @IBOutlet weak var lab_from_language: UILabel!
    @IBOutlet weak var lab_to_language: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }


}
