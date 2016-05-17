//
//  Profile.swift
//  Jibjib
//
//  Created by Kerk on 5/15/16.
//  Copyright © 2016 Chulalongkorn University. All rights reserved.
//

import Foundation

struct Profile {
    var owner: String!
    var firstname: String!
    var lastname: String!
    var email: String!
    var user_pic: String!
    var work: String!
    var id: String!
    var count_own_ans: String!
    var count_own_vote: String!
    var own_comment: Comment!
    init(){
        firstname = ""
        lastname = ""
    }
}
