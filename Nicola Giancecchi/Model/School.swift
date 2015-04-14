//
//  School.swift
//  Nicola Giancecchi
//
//  Created by Nicola Giancecchi on 14/04/15.
//  Copyright (c) 2015 Nicola Giancecchi. All rights reserved.
//

import UIKit

class School {
    var school : String = ""
    var institution : String = ""
    var course : String = ""
    var type : String = ""
    var vote : String = ""
    var img1 : String = ""
    var img2 : String = ""
    var img3 : String = ""
    var projects : Array<String> = []
    
    init(dict : Dictionary<String,AnyObject>){
        school = dict["school"]! as! String
        institution = dict["institution"] as! String
        course = dict["course"] as! String
        type = dict["type"] as! String
        vote = dict["vote"] as! String
        img1 = dict["img1"] as! String
        img2 = dict["img2"] as! String
        img3 = dict["img3"] as! String
        projects = dict["projects"] as! Array<String>
    }
}

