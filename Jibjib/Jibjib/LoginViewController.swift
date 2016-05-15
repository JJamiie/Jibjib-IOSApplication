//
//  LoginViewController.swift
//  Jibjib
//


import UIKit
import Alamofire

class LoginViewController: UIViewController,UITextFieldDelegate {
    
    @IBOutlet weak var btn_sign_in: UIButton!
    @IBOutlet weak var edt_username: UITextField!
    @IBOutlet weak var edt_password: UITextField!
    var token : String!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.edt_password.delegate = self
        self.edt_username.delegate = self
        setWidget()
    }
    
    @IBAction func btn_login(sender: UIButton) {
        sign_in()
        
        
    }
    
    
    func setWidget(){
        btn_sign_in.layer.cornerRadius = 6
        borderButtom(edt_username)
        borderButtom(edt_password)
        edt_username.attributedPlaceholder = NSAttributedString(string:"username",attributes:[NSForegroundColorAttributeName: UIColor.whiteColor()])
        edt_username.text = "jjamie"
        edt_password.text = "Jamie16130"
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
    
    
    func sign_in(){
        Alamofire.request(.POST, "http://128.199.141.51:8000/api-token-auth/", parameters: ["username": self.edt_username.text!,"password":self.edt_password.text!])
            .responseJSON { response in
                var json: NSDictionary!
                do {
                    json = try NSJSONSerialization.JSONObjectWithData(response.data!, options: NSJSONReadingOptions()) as? NSDictionary
                    let tk = json.valueForKey("token")
                    if tk != nil{
                        self.token = "Token " + (tk as! String)
                        print(self.token)
                        let dict = ["token" : self.token]
                        NSNotificationCenter.defaultCenter().postNotificationName("NotificationIdentifier", object: nil,userInfo: dict)
                        self.performSegueWithIdentifier("sign_in", sender: self)
                    }
                } catch {
                    print(error)
                }
        }
    }
    
}
