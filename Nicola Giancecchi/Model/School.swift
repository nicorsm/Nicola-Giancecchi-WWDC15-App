//
//  School.swift
//  Nicola Giancecchi
//
//  Created by Nicola Giancecchi on 14/04/15.
//  Copyright (c) 2015 Nicola Giancecchi. All rights reserved.
//

import UIKit

class School : JSONObject {
    var school : String = ""
    var institution : String = ""
    var course : String = ""
    var website : String = ""
    var title : String = ""
    var vote : String = ""
    var text : String = ""
    var logo : String = ""
    var background : String = ""
    
    required init(dict : Dictionary<String,AnyObject>){
        school = dict["school"]! as! String
        institution = dict["institution"] as! String
        course = dict["course"] as! String
        website = dict["website"] as! String
        title = dict["title"] as! String
        vote = dict["vote"] as! String
        text = dict["text"] as! String
        logo = dict["logo"] as! String
        background = dict["background"] as! String
    }
}
