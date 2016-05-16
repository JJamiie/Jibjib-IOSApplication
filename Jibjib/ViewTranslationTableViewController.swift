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
        self.refreshControl?.addTarget(self, action: "refresh:", forControlEvents: UIControlEvents.ValueChanged)
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
            cell.lab_number_of_answer.text = String(answers.count) + " answers"
            cell.selectionStyle = UITableViewCellSelectionStyle.None
            return cell
        }
        else if indexPath.row == answers.count+1{
            let cell:PostAnswerTableViewCell = tableView.dequeueReusableCellWithIdentifier("post_answer_translation")as! PostAnswerTableViewCell
            cell.btn_post_answer.tag = indexPath.row
            cell.btn_post_answer.addTarget(self, action: #selector(ViewTranslationTableViewController.postAnswer(_:)), forControlEvents: .TouchUpInside)
            cell.selectionStyle = UITableViewCellSelectionStyle.None
            return cell
        }
        else{
            let cell:AnswerTranslaTableViewCell = tableView.dequeueReusableCellWithIdentifier("answer_question") as! AnswerTranslaTableViewCell
            cell.lab_name.text = answers[indexPath.row-1].owner
            cell.lab_answer.text = answers[indexPath.row - 1].content
            cell.lab_sum_vote.text = answers[indexPath.row - 1].vote
            let link : String = "http://128.199.141.51:8000"+answers[indexPath.row-1].userprofile.user_pic
            let url = NSURL(string: link)
            let data = NSData(contentsOfURL: url!)
            cell.img_profile.image = UIImage(data: data!)
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
            return 104 + UITableViewAutomaticDimension
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
                self.answers.removeAll()
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
                            
                            let dictVote: NSArray = dict.valueForKey("vote") as! NSArray
                            var sum : Int = 0
                            for vote in dictVote{
                                sum += vote.valueForKey("score") as! Int
                            }
                            answer.vote = String(sum)
                            self.answers.append(answer)
                        }
                    }
                    self.tableView.reloadData()
                    self.refreshControl?.endRefreshing()
                } catch {
                    print(error)
                }
        }
    }
    @IBAction func postAnswer(sender: AnyObject) {
        let indexPath = NSIndexPath(forRow: sender.tag, inSection: 0)
        let cell : PostAnswerTableViewCell = self.tableView.cellForRowAtIndexPath(indexPath) as! PostAnswerTableViewCell
        let content : String = cell.edt_type_answer.text!
        if(content != ""){
            let headers = [
                "Authorization": self.token as String,
                "Accept": "application/json"
            ]
            print(self.token)
            print(content)
            print(self.id_question)
            let parameters = [
                "content": content,
                "question": self.id_question,
                ]
            
            Alamofire.request(.POST, "http://128.199.141.51:8000/api/answers/", headers: headers,parameters: parameters)
                .responseJSON { response in
                    self.answers.removeAll()
                    self.getAnswersContent()
                    cell.edt_type_answer.text = ""
            }
        }else{
            showAlert("Please fill your answer")
        }
        
    }
    
    func showAlert(title:String){
        let alertController = UIAlertController(title: title, message: nil, preferredStyle: .Alert)
        
        let cancelAction = UIAlertAction(title: "Ok", style: .Cancel) { (action) in
            // ...
        }
        
        alertController.addAction(cancelAction)
        self.presentViewController(alertController, animated: true) {
        }
    }
    
    func refresh(sender:AnyObject)
    {
        getAnswersContent()
    }
    
    
    
}
