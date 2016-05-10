//
//  LoginViewController.swift
//  Jibjib
//
//  Created by Kerk on 5/6/16.
//  Copyright © 2016 Chulalongkorn University. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController,UITextFieldDelegate {
    
    @IBOutlet weak var btn_sign_in: UIButton!
    @IBOutlet weak var edt_username: UITextField!
    @IBOutlet weak var edt_password: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.edt_password.delegate = self
        self.edt_username.delegate = self
        setWidget()
    }
    
    func setWidget(){
        btn_sign_in.layer.cornerRadius = 6
        borderButtom(edt_username)
        borderButtom(edt_password)
        edt_username.attributedPlaceholder = NSAttributedString(string:"username",attributes:[NSForegroundColorAttributeName: UIColor.whiteColor()])
        edt_password.attributedPlaceholder = NSAttributedString(string:"password",attributes:[NSForegroundColorAttributeName: UIColor.whiteColor()])
    }
    
    func borderButtom(textField:UITextField){
        let border = CALayer()
        let width = CGFloat(1.0)
        border.borderColor = UIColor.whiteColor().CGColor
        border.frame = CGRect(x: 0, y: textField.frame.size.height - width, width:  textField.frame.size.width, height: textField.frame.size.height)
        border.borderWidth = width
        textField.layer.addSublayer(border)
        textField.layer.masksToBounds = true
    }
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}
