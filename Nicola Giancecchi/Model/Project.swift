//
//  Project.swift
//  Nicola Giancecchi
//
//  Created by Nicola Giancecchi on 15/04/15.
//  Copyright (c) 2015 Nicola Giancecchi. All rights reserved.
//

import UIKit

class Project: NSObject {
    var title : String = ""
    var subtitle : String = ""
    var appIcon : String = ""
    var appColor : String = ""
    var textColor : String = ""
    var appLink : String = ""
    var firstImage : String = ""
    var secondImage : String = ""
    var firstColumnText : String = ""
    var secondColumnText : String = ""
    
    override init(){
        
    }
    
    init(dict : Dictionary<String,AnyObject>){
        title = dict["title"] as! String
        subtitle = dict["subtitle"] as! String
        appIcon = dict["appIcon"] as! String
        appColor = dict["appColor"] as! String
        appLink = dict["appLink"] as! String
        textColor = dict["textColor"] as! String
        firstImage = dict["firstImage"] as! String
        secondImage = dict["secondImage"] as! String
        firstColumnText = dict["firstColumnText"] as! String
        secondColumnText = dict["secondColumnText"] as! String
    }
}
