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
    var token : String!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.header.frame =  CGRectMake(0 , 0, self.view.frame.width, 60)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(FeedTableViewController.getToken(_:)), name:"NotificationIdentifier", object: nil)
    }
    
    func getToken(notification:NSNotification){
        self.token = notification.userInfo!["token"]! as! String
        print(self.token)
    }
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell_question",forIndexPath: indexPath)
        return cell
    }
}
