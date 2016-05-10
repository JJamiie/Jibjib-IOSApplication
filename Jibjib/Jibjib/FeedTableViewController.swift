//
//  FeedTableViewController.swift
//  Jibjib
//
//  Created by Kerk on 5/6/16.
//  Copyright © 2016 Chulalongkorn University. All rights reserved.
//

import UIKit

class FeedTableViewController: UITableViewController {

    @IBOutlet weak var header: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.header.frame =  CGRectMake(0 , 0, self.view.frame.width, 60)
    }
}
