//
//  WWDCDescriptor.swift
//  Nicola Giancecchi
//
//  Created by Nicola Giancecchi on 16/04/15.
//  Copyright (c) 2015 Nicola Giancecchi. All rights reserved.
//

import UIKit

class WWDCDescriptor: JSONObject {
    
    var title : String = ""
    var resume : String = ""
    var image : String = ""
    
    required init(dict : Dictionary<String,AnyObject>){
        title = dict["title"]! as! String
        resume = dict["resume"] as! String
        image = dict["image"] as! String
    }
}
