//
//  Work.swift
//  Nicola Giancecchi
//
//  Created by Nicola Giancecchi on 17/04/15.
//  Copyright (c) 2015 Nicola Giancecchi. All rights reserved.
//

import UIKit

class Work: JSONObject {
    var title : String = ""
    var time : String = ""
    var position : String = ""
    var location : String = ""
    var brief : String = ""
    var why : String = ""
    var logo : String = ""
    var img : String = ""
    var website : String = ""
    var ownershipGroup : String = ""
    
    var animation_visited : Bool = false
    
    
    required init(dict : Dictionary<String,AnyObject>){
        title = dict["title"]! as! String
        time = dict["time"] as! String
        position = dict["position"] as! String
        location = dict["location"] as! String
        brief = dict["brief"] as! String
        why = dict["why"] as! String
        logo = dict["logo"] as! String
        img = dict["img"] as! String
        website = dict["website"] as! String
        ownershipGroup = dict["ownership_group"] as! String
    }

}
