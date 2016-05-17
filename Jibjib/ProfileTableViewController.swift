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
    var profile = Profile()
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
        return comment.count+1
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if indexPath.row == 0{
            let cell :HeaderProfileTableViewCell = tableView.dequeueReusableCellWithIdentifier("header_profile") as! HeaderProfileTableViewCell
            // Configure the cell...
            cell.selectionStyle = UITableViewCellSelectionStyle.None
            //user profile pic
            if(self.profile.user_pic != nil){
                let link : String = profile.user_pic
                let url = NSURL(string: link)
                let data = NSData(contentsOfURL: url!)
                cell.img_profile.image = UIImage(data: data!)
            }
            cell.txt_name.text = "\(profile.firstname) \(profile.lastname)"
            cell.txt_work.text = profile.work
            cell.txt_answers.text = profile.count_own_ans
            cell.txt_votes.text = profile.count_own_vote
            cell.txt_comments.text = String(comment.count)
            
            return cell
        }else{
            let cell :CommentProfileTableViewCell = tableView.dequeueReusableCellWithIdentifier("comment_profile") as! CommentProfileTableViewCell
            cell.selectionStyle = UITableViewCellSelectionStyle.None
            cell.lab_name.text = self.comment[indexPath.row-1].commenter
            cell.lab_content.text = self.comment[indexPath.row-1].content
            //commenter's profile pic
            if(self.comment[indexPath.row-1].commenter_pic != nil){
                let link : String = "http://128.199.141.51:8000"+self.comment[indexPath.row-1].commenter_pic
                let url = NSURL(string: link)
                let data = NSData(contentsOfURL: url!)
                cell.img_profile.image = UIImage(data: data!)
            }
            
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
                            self.profile.owner = self.dict.valueForKey("owner") as! String
                            self.profile.firstname = self.dict.valueForKey("firstname") as! String
                            self.profile.lastname = self.dict.valueForKey("lastname") as! String
                            self.profile.email = self.dict.valueForKey("email") as! String
                            self.profile.user_pic = self.dict.valueForKey("user_pic") as! String
                            self.profile.work = self.dict.valueForKey("work") as! String
                            self.profile.id = String(self.dict.valueForKey("id") as! NSNumber)
                            self.profile.count_own_ans = String(self.dict.valueForKey("count_own_ans") as! NSNumber)
                            self.profile.count_own_vote = String(self.dict.valueForKey("count_own_vote") as! NSNumber)
                            var array : NSArray = self.dict.valueForKey("own_comment") as! NSArray
                            for a in array{
                                var comm = Comment()
                                comm.commenter = a.valueForKey("commenter") as! String
                                comm.content = a.valueForKey("content") as! String
                                comm.id = String(a.valueForKey("id") as! NSNumber)
                                comm.owner = a.valueForKey("owner") as! String
                                comm.commenter_pic = (a.valueForKey("userprofile") as! NSDictionary).valueForKey("user_pic") as! String
                                self.comment.append(comm)
                            }
                        }
                    }
                    self.tableView.reloadData()
                } catch {
                    print(error)
                }
        }
    }
}
