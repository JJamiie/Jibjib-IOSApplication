//
//  CreateTranslationViewController.swift
//  Jibjib
//
//  Created by JJamie Rashata on 5/14/2559 BE.
//  Copyright © 2559 Chulalongkorn University. All rights reserved.
//

import UIKit
import Alamofire

class CreateTranslationViewController: UIViewController,UIAlertViewDelegate, UITextFieldDelegate, UITextViewDelegate {
    
    var itemLanguageFrom = ["Thai","English","Chinese"]
    var itemLanguageTo = ["English","Thai","Chinese"]
    var token : String!
    @IBOutlet weak var outlet_from_language: UIButton!
    @IBOutlet weak var outlet_to_language: UIButton!
    @IBOutlet weak var edt_translation_title: PaddingTextField!
    @IBOutlet weak var btn_from: UIButton!
    @IBOutlet weak var btn_to: UIButton!
    @IBOutlet weak var edt_content: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        edt_content.textContainerInset = UIEdgeInsets(top: 15, left: 20, bottom: 15, right: 20)
        edt_content.delegate = self
        edt_translation_title.delegate = self
    }
    
    func textView(textView: UITextView, shouldChangeTextInRange range: NSRange, replacementText text: String) -> Bool {
        if(text == "\n") {
            textView.resignFirstResponder()
            return false
        }
        return true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btn_from_language(sender: AnyObject) {
        showAlert(itemLanguageFrom,button: self.btn_from)
    }
    
    @IBAction func btn_to_language(sender: AnyObject) {
        showAlert(itemLanguageTo,button: self.btn_to)
        
    }
    
    func showAlert(item:Array<String>,button : UIButton){
        let alertController = UIAlertController(title: "Choose language", message: nil, preferredStyle: .Alert)
        
        for (index , element) in item.enumerate() {
            let action = UIAlertAction(title: element, style: .Default) { (action) in
                button.setTitle(element, forState: .Normal)
            }
            alertController.addAction(action)
            
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel) { (action) in
            // ...
        }
        
        alertController.addAction(cancelAction)
        self.presentViewController(alertController, animated: true) {
        }
    }
    
    @IBAction func create_question(sender: AnyObject) {
        let from_lang : String = btn_from.currentTitle!
        let to_lang : String = btn_to.currentTitle!
        let title : String = edt_translation_title.text!
        let content : String = edt_content.text!
        if(content != "" || from_lang != "From" || to_lang != "To" || content != ""){
            let headers = [
                "Authorization": self.token as String,
                "Accept": "application/json"
            ]
            let parameters = [
                "to_lang": to_lang,
                "from_lang": from_lang,
                "title": title,
                "content": content
                ]
            
            Alamofire.request(.POST, "http://128.199.141.51:8000/api/questions/", headers: headers,parameters: parameters)
                .responseJSON { response in
                self.navigationController?.popViewControllerAnimated(true)
            }
        }else{
            showAlert("Please fill all information")
        }
    }
    
    func showAlert(title:String){
        let alertController = UIAlertController(title: title, message: nil, preferredStyle: .Alert)
        
        let cancelAction = UIAlertAction(title: "Ok", style: .Cancel) { (action) in
            // ...
        }
        
        alertController.addAction(cancelAction)
        self.presentViewController(alertController, animated: true) {
        }
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
