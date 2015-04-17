//
//  Award.swift
//  Nicola Giancecchi
//
//  Created by Nicola Giancecchi on 17/04/15.
//  Copyright (c) 2015 Nicola Giancecchi. All rights reserved.
//

import UIKit

class Award: JSONObject {
    var logo : String = ""
    var background : String = ""
    var title : String = ""
    var subtitle1 : String = ""
    var subtitle2 : String = ""
    var link : String = ""
    var text1 : String = ""
    var text2 : String = ""
    
    required init(dict : Dictionary<String,AnyObject>){
        logo = dict["logo"]! as! String
        background = dict["background"] as! String
        title = dict["title"] as! String
        subtitle1 = dict["subtitle1"] as! String
        subtitle2 = dict["subtitle2"] as! String
        link = dict["link"] as! String
        text1 = dict["text1"] as! String
        text2 = dict["text2"] as! String
    }
}
