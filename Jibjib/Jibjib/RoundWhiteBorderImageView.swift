//
//  RoundWhiteBorderImageView.swift
//  Jibjib
//
//  Created by JJamie Rashata on 5/14/2559 BE.
//  Copyright © 2559 Chulalongkorn University. All rights reserved.
//

import UIKit

class RoundWhiteBorderImageView: UIImageView {

    override func layoutSubviews() {
        super.layoutSubviews()
        let radius: CGFloat = self.bounds.size.width / 2.0
        self.layer.masksToBounds = false
        self.layer.cornerRadius = radius
        self.clipsToBounds = true
        self.layer.borderWidth = 3
        self.layer.borderColor = UIColor.whiteColor().CGColor
    }

}
