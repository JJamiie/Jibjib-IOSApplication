//
//  CreateTranslationViewController.swift
//  Jibjib
//
//  Created by JJamie Rashata on 5/14/2559 BE.
//  Copyright © 2559 Chulalongkorn University. All rights reserved.
//

import UIKit

class CreateTranslationViewController: UIViewController,UIAlertViewDelegate {
    
    var itemLanguageFrom = ["Thai","English","Chinese"]
    var itemLanguageTo = ["English","Thai","Chinese"]
    
    @IBOutlet weak var outlet_from_language: UIButton!
    @IBOutlet weak var outlet_to_language: UIButton!
    @IBOutlet weak var edt_translation_title: PaddingTextField!
    @IBOutlet weak var edt_content: PaddingTextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btn_from_language(sender: AnyObject) {
        showAlert(itemLanguageFrom)
    }
    
    @IBAction func btn_to_language(sender: AnyObject) {
        showAlert(itemLanguageTo)
        
    }
    
    func showAlert(item:Array<String>){
        let alertController = UIAlertController(title: "Choose language", message: nil, preferredStyle: .Alert)
        
        for (index , element) in item.enumerate() {
            let action = UIAlertAction(title: element, style: .Default) { (action) in
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
    
    
}
