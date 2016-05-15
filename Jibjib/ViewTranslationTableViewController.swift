//
//  ViewTranslationTableViewController.swift
//  Jibjib
//
//  Created by JJamie Rashata on 5/14/2559 BE.
//  Copyright © 2559 Chulalongkorn University. All rights reserved.
//

import UIKit

class ViewTranslationTableViewController: UITableViewController {
    
    var content = [Question]()
    
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
        return 5
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if indexPath.row == 0{
            let cell:HeaderTranslationTableViewCell = tableView.dequeueReusableCellWithIdentifier("header_translation") as! HeaderTranslationTableViewCell
            cell.lab_content.text = "asdfasfasasfasfasfasdfasdfasdfasfasfasdfasfasfasfasfasfsadfasfasfasfsafasfasfsafasfasfasfasfasfasfasfasfasfasfasfasfasfasfasfasfasfasfasfasfasfasfasfasfasasfasfasfasfasfasfasfafasfasdfasfasfasfasfasfasfasfasfasdfasfasfasdfasdfasdfasdfasdfasdfasdfasfasasfasfasfasdfasdfasdfasfasfasdfasfasfasfasfasfsadfasfasfasfsafasfasfsafasfasfasfasfasfasfasfasfasfasfasfasfasfasfasfasfasfasfasfasfasfasfasfasfasasfasfasfasfasfasfasfafasfasdfasfasfasfasfasfasfasfasfasdfasfasfasdfasdfasdfasdfasdfasdfasdfasfasasfasfasfasdfasdfasdfasfasfasdfasfasfasfasfasfsadfasfasfasfsafasfasfsafasfasfasfasfasfasfasfasfasfasfasfasfasfasfasfasfasfasfasfasfasfasfasfasfasasfasfasfasfasfasfasfafasfasdfasfasfasfasfasfasfasfasfasdfasfasfasdfasdfasdfasdfasdfasdf"
            cell.selectionStyle = UITableViewCellSelectionStyle.None
            return cell
        }else if indexPath.row == 4{
            let cell:PostAnswerTableViewCell = tableView.dequeueReusableCellWithIdentifier("post_answer_translation")as! PostAnswerTableViewCell
            cell.selectionStyle = UITableViewCellSelectionStyle.None
            return cell
        }else{
            let cell:AnswerTranslaTableViewCell = tableView.dequeueReusableCellWithIdentifier("answer_question") as! AnswerTranslaTableViewCell
            cell.lab_answer.text = "asdfasfasasfasfasfasdfasdfasdfasfasfasdfasfasfasfasfasfsadfasfasfasfsafasfasfsafasfasfasfasfasfasfasfasfasfasfasfasfasfasfasfasfasfasfasfasfasfasfasfasfasasfasfasfasfasfasfasfafasfasdfasfasfasfasfasfasfasfasfasdfasfasfasdfasdfasdfasdfasdfasdf"
            cell.selectionStyle = UITableViewCellSelectionStyle.None
            return cell
        }
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.row == 0 {
            tableView.estimatedRowHeight = 240
            return UITableViewAutomaticDimension
        } else if indexPath.row == 4{
            return 210
        } else {
            tableView.estimatedRowHeight = 104
            return UITableViewAutomaticDimension
        }
    }
    
}
