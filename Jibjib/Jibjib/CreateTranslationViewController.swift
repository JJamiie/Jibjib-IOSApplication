//
//  CreateTranslationViewController.swift
//  Jibjib
//
//  Created by JJamie Rashata on 5/14/2559 BE.
//  Copyright © 2559 Chulalongkorn University. All rights reserved.
//

import UIKit

class CreateTranslationViewController: UIViewController {

    
  
    @IBOutlet weak var btn_to_language: UIButton!
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
        let alertController = UIAlertController(title: "Default Style", message: "A standard alert.", preferredStyle: .Alert)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel) { (action) in
            // ...
        }
        alertController.addAction(cancelAction)
        
        let OKAction = UIAlertAction(title: "OK", style: .Default) { (action) in
            // ...
        }
        alertController.addAction(OKAction)
        
        self.presentViewController(alertController, animated: true) {
            // ...
        }
        
    }
    @IBAction func btn_to_language(sender: AnyObject) {
        
    }
    

}
