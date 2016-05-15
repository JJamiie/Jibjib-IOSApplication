//
//  BorderBottomUITextField.swift
//  Jibjib
//
//  Created by JJamie Rashata on 5/15/2559 BE.
//  Copyright © 2559 Chulalongkorn University. All rights reserved.
//

import UIKit

class BorderBottomUITextField: UITextField {
    override func layoutSubviews() {
        super.layoutSubviews()
        let border = CALayer()
        let width = CGFloat(1.0)
        border.borderColor = UIColor.whiteColor().CGColor
        border.frame = CGRect(x: 0, y: self.frame.size.height - width, width:  self.frame.size.width, height: self.frame.size.height)
        border.borderWidth = width
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
    }
}
