//
//  User.swift
//  Snacks
//
//  Created by Yavuz Güner on 26.12.2022.
//

import Foundation

struct User:Codable{
    var firstName:String = ""
    var lastName:String = ""
    var email:String = ""
    var birthdate = Date()
    var extraNapkins:Bool = false
    var frequentRefills:Bool = false
}
