//
//  FeedTableViewController.swift
//  Jibjib
//
//  Created by Kerk on 5/6/16.
//  Copyright © 2016 Chulalongkorn University. All rights reserved.
//

import UIKit
import Alamofire

class FeedTableViewController: UITableViewController {

    var questions = [Question]()
    @IBOutlet weak var header: UIView!
    var token : String!
    var dict :NSDictionary!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.header.frame =  CGRectMake(0 , 0, self.view.frame.width, 60)
        setToken()
        getQuestion()
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return questions.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell : QuestionTranslationTableViewCell = tableView.dequeueReusableCellWithIdentifier("cell_question",forIndexPath: indexPath) as! QuestionTranslationTableViewCell
        cell.lab_title.text = questions[indexPath.row].title
        
        if(questions[indexPath.row].from_lang == "English"){
            questions[indexPath.row].from_lang = "EN"
        }
        else if(questions[indexPath.row].from_lang == "Thai"){
            questions[indexPath.row].from_lang = "TH"
        }
        else if(questions[indexPath.row].from_lang == "Chinese"){
            questions[indexPath.row].from_lang = "CH"
        }
        
        if(questions[indexPath.row].to_lang == "English"){
            questions[indexPath.row].to_lang = "EN"
        }
        else if(questions[indexPath.row].to_lang == "Thai"){
            questions[indexPath.row].to_lang = "TH"
        }
        else if(questions[indexPath.row].to_lang == "Chinese"){
            questions[indexPath.row].to_lang = "CH"
        }
        
        cell.lab_from_language.text = questions[indexPath.row].from_lang
        cell.lab_to_language.text = questions[indexPath.row].to_lang
        cell.lab_number_of_question.text = questions[indexPath.row].count_ans
        cell.lab_number_of_vote.text = questions[indexPath.row].count_vote
        cell.lab_content.text = questions[indexPath.row].content
        cell.lab_time.text = questions[indexPath.row].created_at
        cell.lab_name.text = questions[indexPath.row].owner
        
        return cell
    }
    
    func setToken(){
        if let tbc : TabBarController = self.tabBarController as? TabBarController{
            self.token = tbc.token
        }
    }
    
    func getQuestion(){
        Alamofire.request(.GET, "http://128.199.141.51:8000/api/questions/", parameters: nil)
            .responseJSON { response in
                var json: NSArray!
                do {
                    json = try NSJSONSerialization.JSONObjectWithData(response.data!, options: NSJSONReadingOptions()) as? NSArray
                    if(json != nil){
                        for j in json{
                            var question = Question()
                            self.dict = j as! NSDictionary
                            question.owner = self.dict.valueForKey("owner") as! String
                            question.title = self.dict.valueForKey("title") as! String
                            question.content = self.dict.valueForKey("content") as! String
                            question.from_lang = self.dict.valueForKey("from_lang") as! String
                            question.to_lang = self.dict.valueForKey("to_lang") as! String
                            question.id = String(self.dict.valueForKey("id") as! NSNumber)
                            question.count_ans = String(self.dict.valueForKey("count_ans") as! NSNumber)
                            question.count_vote = String(self.dict.valueForKey("count_vote") as! NSNumber)
                            question.created_at = self.dict.valueForKey("created_at") as! String
                            self.questions.append(question)
                        }
                    }
                    self.tableView.reloadData()
                } catch {
                    print(error)
                }
        }
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "cell_question"{
            if let destination : ViewTranslationTableViewController = segue.destinationViewController as? ViewTranslationTableViewController{
                let indexpath = tableView.indexPathForSelectedRow
                destination.id_question = questions[indexpath!.row].id
                destination.token = self.token
                
            }
        }
    }
    
}
