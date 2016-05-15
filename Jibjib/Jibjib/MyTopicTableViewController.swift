//
//  MyTopicTableViewController.swift
//  Jibjib
//
//  Created by Kerk on 5/6/16.
//  Copyright © 2016 Chulalongkorn University. All rights reserved.
//

import UIKit
import Alamofire

class MyTopicTableViewController: UITableViewController {
    
    var token : String!
    var dict :NSDictionary!
    var questions = [Question]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setToken()
        getMyTopic()
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
    
    func getMyTopic(){
        let headers = [
            "Authorization": self.token as! String,
            "Accept": "application/json"
        ]
        
        Alamofire.request(.GET, "http://128.199.141.51:8000/api/questions/own/", headers: headers)
            .responseJSON { response in
                var json: NSArray!
                do {
                    json = try NSJSONSerialization.JSONObjectWithData(response.data!, options: NSJSONReadingOptions()) as? NSArray
                    if(json != nil){
                        for j in json{
                            var topic = Question()
                            self.dict = j as! NSDictionary
                            topic.owner = self.dict.valueForKey("owner") as! String
                            topic.title = self.dict.valueForKey("title") as! String
                            topic.content = self.dict.valueForKey("content") as! String
                            topic.from_lang = self.dict.valueForKey("from_lang") as! String
                            topic.to_lang = self.dict.valueForKey("to_lang") as! String
                            topic.id = String(self.dict.valueForKey("id") as! NSNumber)
                            topic.count_ans = String(self.dict.valueForKey("count_ans") as! NSNumber)
                            topic.count_vote = String(self.dict.valueForKey("count_vote") as! NSNumber)
                            topic.created_at = self.dict.valueForKey("created_at") as! String
                            self.questions.append(topic)
                            print(json)
                        }
                    }
                } catch {
                    print(error)
                }
        }
    }
    
}
