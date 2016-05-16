//
//  ViewTranslationTableViewController.swift
//  Jibjib
//
//  Created by JJamie Rashata on 5/14/2559 BE.
//  Copyright © 2559 Chulalongkorn University. All rights reserved.
//

import UIKit
import Alamofire

class ViewTranslationTableViewController: UITableViewController {
    
    var token : String!
    var id_question : String!
    var cont = Question()
    var answers = [Answer]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getQuestionContent()
        getAnswersContent()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return answers.count+2
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if indexPath.row == 0{
            let cell:HeaderTranslationTableViewCell = tableView.dequeueReusableCellWithIdentifier("header_translation") as! HeaderTranslationTableViewCell
            cell.lab_from_language.text = cont.from_lang
            cell.lab_content.text = cont.content
            cell.lab_to_language.text = cont.to_lang
            cell.selectionStyle = UITableViewCellSelectionStyle.None
            return cell
        }
        else if indexPath.row == answers.count+1{
            let cell:PostAnswerTableViewCell = tableView.dequeueReusableCellWithIdentifier("post_answer_translation")as! PostAnswerTableViewCell
            cell.selectionStyle = UITableViewCellSelectionStyle.None
            return cell
        }
        else{
            let cell:AnswerTranslaTableViewCell = tableView.dequeueReusableCellWithIdentifier("answer_question") as! AnswerTranslaTableViewCell
            cell.lab_name.text = "\(answers[indexPath.row - 1].userprofile.firstname) \(answers[indexPath.row - 1].userprofile.lastname)"
            cell.lab_answer.text = answers[indexPath.row - 1].content
            cell.selectionStyle = UITableViewCellSelectionStyle.None
            return cell
        }
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.row == 0 {
            tableView.estimatedRowHeight = 240
            return UITableViewAutomaticDimension
        } else if indexPath.row == answers.count+1{
            return 210
        } else {
            tableView.estimatedRowHeight = 104
            return UITableViewAutomaticDimension
        }
    }
    
    func getQuestionContent(){
        let headers = [
            "Authorization": self.token as String,
            "Accept": "application/json"
        ]
        
        Alamofire.request(.GET, "http://128.199.141.51:8000/api/questions/1", headers: headers)
            .responseJSON { response in
                var json: NSDictionary!
                do {
                    json = try NSJSONSerialization.JSONObjectWithData(response.data!, options: NSJSONReadingOptions()) as? NSDictionary
                    if(json != nil){
                        self.cont.owner = json.valueForKey("owner") as! String
                        self.cont.title = json.valueForKey("title") as! String
                        self.cont.content = json.valueForKey("content") as! String
                        self.cont.from_lang = json.valueForKey("from_lang") as! String
                        self.cont.to_lang = json.valueForKey("to_lang") as! String
                        self.cont.id = String(json.valueForKey("id") as! NSNumber)
                        self.cont.count_ans = String(json.valueForKey("count_ans") as! NSNumber)
                        self.cont.count_vote = String(json.valueForKey("count_vote") as! NSNumber)
                        self.cont.created_at = json.valueForKey("created_at") as! String
                    }
                    self.tableView.reloadData()
                } catch {
                    print(error)
                }
        }
    }
    
    func getAnswersContent(){
        let headers = [
            "Authorization": self.token as String,
            "Accept": "application/json"
        ]
        
        Alamofire.request(.GET, "http://128.199.141.51:8000/api/answers/id/\(id_question)", headers: headers)
            .responseJSON { response in
                var json: NSArray!
                var dict: NSDictionary!
                do {
                    json = try NSJSONSerialization.JSONObjectWithData(response.data!, options: NSJSONReadingOptions()) as? NSArray
                    if(json != nil){
                        for j in json{
                            var answer = Answer()
                            dict = j as! NSDictionary
                            answer.owner = dict.valueForKey("owner") as! String
                            answer.question = String(dict.valueForKey("question") as! NSNumber)
                            answer.content = dict.valueForKey("content") as! String
                            answer.id = String(dict.valueForKey("id") as! NSNumber)
                            
                            let dictUserprofile: NSDictionary = dict.valueForKey("userprofile") as! NSDictionary
                            answer.userprofile = Profile()
                            answer.userprofile.firstname = dictUserprofile.valueForKey("firstname") as! String
                            answer.userprofile.lastname = dictUserprofile.valueForKey("lastname") as! String
                            answer.userprofile.email = dictUserprofile.valueForKey("email") as! String
                            answer.userprofile.user_pic = dictUserprofile.valueForKey("user_pic") as! String
                            answer.userprofile.work = dictUserprofile.valueForKey("work") as! String
                            // vote still bug
//                            let dictVote: NSDictionary = dict.valueForKey("vote") as! NSDictionary
//                            answer.vote = Vote()
//                            answer.vote.owner = dictVote.valueForKey("owner") as! String
//                            answer.vote.answer = dictVote.valueForKey("answer") as! String
//                            answer.vote.score = dictVote.valueForKey("score") as! String
                            
                            self.answers.append(answer)
                        }
                    }
                    self.tableView.reloadData()
                } catch {
                    print(error)
                }
        }
    }
}
