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
    var dict: NSDictionary!
    var profile = [Profile]()
    var comment = [Comment]()
    
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
            cell.selectionStyle = UITableViewCellSelectionStyle.None
//            cell.img_profile.image = UIImage(contentsOfFile: profile[indexPath.row].user_pic)
            cell.txt_name.text = "\(profile[indexPath.row].firstname) \(profile[indexPath.row].lastname)"
            cell.txt_work.text = profile[indexPath.row].work
            return cell
        }else{
            let cell :CommentProfileTableViewCell = tableView.dequeueReusableCellWithIdentifier("comment_profile") as! CommentProfileTableViewCell
            cell.selectionStyle = UITableViewCellSelectionStyle.None
            cell.lab_content.text = ""
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
                var json: NSArray!
                do {
                    json = try NSJSONSerialization.JSONObjectWithData(response.data!, options: NSJSONReadingOptions()) as? NSArray
                    if(json != nil){
                        for j in json{
                            self.dict = j as! NSDictionary
                            var prof = Profile()
                            print("test")
                            prof.owner = self.dict.valueForKey("owner") as! String
                            prof.firstname = self.dict.valueForKey("firstname") as! String
                            prof.lastname = self.dict.valueForKey("lastname") as! String
                            prof.email = self.dict.valueForKey("email") as! String
                            prof.user_pic = self.dict.valueForKey("user_pic") as! String
                            prof.work = self.dict.valueForKey("work") as! String
                            prof.id = String(self.dict.valueForKey("id") as! NSNumber)
                            prof.count_own_ans = String(self.dict.valueForKey("count_own_ans") as! NSNumber)
                            prof.count_own_vote = String(self.dict.valueForKey("count_own_vote") as! NSNumber)
                            self.profile.append(prof)
//                            profile.own_comment = self.dict.valueForKey("own_comment") as! Comment
//                            print(profile.own_comment)
                        
//                        if(self.profile.own_comment != nil){
//                            //fixing
//                            for oc in self.profile.own_comment{
//                                var com = Comment()
//                                
//                                self.comment.append(com)
//                            }
//                        }
                        }
                    }
                    self.tableView.reloadData()
                } catch {
                    print(error)
                }
        }
    }
}
