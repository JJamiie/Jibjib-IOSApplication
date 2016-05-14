//
//  PaddingLabel.swift
//  Jibjib
//
//  Created by JJamie Rashata on 5/14/2559 BE.
//  Copyright © 2559 Chulalongkorn University. All rights reserved.
//

import UIKit

class PaddingLabel: UILabel {

    let topInset = CGFloat(15.0), bottomInset = CGFloat(15.0), leftInset = CGFloat(20.0), rightInset = CGFloat(20.0)
    
    override func drawTextInRect(rect: CGRect) {
        let insets: UIEdgeInsets = UIEdgeInsets(top: topInset, left: leftInset, bottom: bottomInset, right: rightInset)
        super.drawTextInRect(UIEdgeInsetsInsetRect(rect, insets))
    }
    
    override func intrinsicContentSize() -> CGSize {
        var intrinsicSuperViewContentSize = super.intrinsicContentSize()
        intrinsicSuperViewContentSize.height += topInset + bottomInset
        intrinsicSuperViewContentSize.width += leftInset + rightInset
        return intrinsicSuperViewContentSize
    }
}
