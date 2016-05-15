//
//  MyTopicTableViewController.swift
//  Jibjib
//
//  Created by Kerk on 5/6/16.
//  Copyright © 2016 Chulalongkorn University. All rights reserved.
//

import UIKit

class MyTopicTableViewController: UITableViewController {
    var token : String!
    override func viewDidLoad() {
        super.viewDidLoad()
        setToken()
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
    
    func setToken(){
        if let tbc : TabBarController = self.tabBarController as? TabBarController{
            self.token = tbc.token
        }
    }
    
}
