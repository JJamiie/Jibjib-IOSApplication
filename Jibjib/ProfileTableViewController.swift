//
//  ProfileTableViewController.swift
//  Jibjib
//
//  Created by JJamie Rashata on 5/12/2559 BE.
//  Copyright © 2559 Chulalongkorn University. All rights reserved.
//

import UIKit
import Alamofire

class ProfileTableViewController: UITableViewController {
    
    var token : String!
    var profile = [Profile]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setToken()
        getMyProfile()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 3
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if indexPath.row == 0{
            let cell :HeaderProfileTableViewCell = tableView.dequeueReusableCellWithIdentifier("header_profile") as! HeaderProfileTableViewCell
            // Configure the cell...
            // Set image profile to circle
            cell.selectionStyle = UITableViewCellSelectionStyle.None
            return cell
        }else{
            let cell :CommentProfileTableViewCell = tableView.dequeueReusableCellWithIdentifier("comment_profile") as! CommentProfileTableViewCell
            cell.selectionStyle = UITableViewCellSelectionStyle.None
            cell.lab_content.text = "asdfasfasfasdfasfasdfasdfasfasdfasfasdfasfsfasfasdfasfasfasfasfasdfasfsdfasdfasdfasdfasdfasfasfasfasfasfasfasdfasfasfsafasfasfsafasfasfasfasfasfasfasfasfsafsafsfsafasfasfsfasdfffasfasdfasfsdfasdfasdfasdfasdfasfasfasfasfasfasfasdfasfasfsafasfasfsafasfasfasfasfasfasfasfasfsafsafsfsafasfasfsfasdff"
            return cell
        }
        
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 291
        } else {
            // This is your 12th cell (indexPath.row 11), as we start counting at 0
            tableView.estimatedRowHeight = 91
            return UITableViewAutomaticDimension
        }
    }
    
    func setToken(){
        if let tbc : TabBarController = self.tabBarController as? TabBarController{
            self.token = tbc.token
        }
    }
    
    func getMyProfile(){
        let headers = [
            "Authorization": self.token as String,
            "Accept": "application/json"
        ]
        
        Alamofire.request(.GET, "http://128.199.141.51:8000/api/userProfiles/own/", headers: headers)
            .responseJSON { response in
                var json: NSDictionary!
                do {
                    json = try NSJSONSerialization.JSONObjectWithData(response.data!, options: NSJSONReadingOptions()) as? NSDictionary
                    if(json != nil){
                        
                    }
                } catch {
                    print(error)
                }
        }
    }
}
