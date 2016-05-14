//
//  ProfileTableViewController.swift
//  Jibjib
//
//  Created by JJamie Rashata on 5/12/2559 BE.
//  Copyright © 2559 Chulalongkorn University. All rights reserved.
//

import UIKit

class ProfileTableViewController: UITableViewController {
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
       
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        

        
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
            cell.img_profile.layer.masksToBounds = false
            cell.img_profile.layer.cornerRadius = 50
            cell.img_profile.clipsToBounds = true
            cell.img_profile.layer.borderWidth = 3
            cell.img_profile.layer.borderColor = UIColor.whiteColor().CGColor
            return cell
        }else{
            let cell :CommentProfileTableViewCell = tableView.dequeueReusableCellWithIdentifier("comment_profile") as! CommentProfileTableViewCell
            cell.selectionStyle = UITableViewCellSelectionStyle.None
            cell.lab_content.text = "asdfasfasfasdfasfasdfasdfasfasdfasfasdfasfsfasfasdfasfasfasfasfasdfasfsdfasdfasdfasdfasdfasfasfasfasfasfasfasdfasfasfsafasfasfsafasfasfasfasfasfasfasfasfsafsafsfsafasfasfsfasdfffasfasdfasfsdfasdfasdfasdfasdfasfasfasfasfasfasfasdfasfasfsafasfasfsafasfasfasfasfasfasfasfasfsafsafsfsafasfasfsfasdff"
            return cell
        }
        
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if (indexPath.row == 0) {
            return 291
        } else {
            // This is your 12th cell (indexPath.row 11), as we start counting at 0
            tableView.estimatedRowHeight = 91
            return UITableViewAutomaticDimension
        }
    }
    
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
     if editingStyle == .Delete {
     // Delete the row from the data source
     tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
     } else if editingStyle == .Insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
