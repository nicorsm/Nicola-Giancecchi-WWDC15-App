//
//  DataManager.swift
//  Nicola Giancecchi
//
//  Created by Nicola Giancecchi on 14/04/15.
//  Copyright (c) 2015 Nicola Giancecchi. All rights reserved.
//

import UIKit

private let _instance = DataManager()

class DataManager : NSObject {
    
    class var shared: DataManager {
        return _instance
    }
    
    func getStudy() -> Array<School>{
        
        var ar : Array = Array<School>()
        
        let data : Array<Dictionary<String,AnyObject>> = self.parseFile("Study") as! Array<Dictionary<String, AnyObject>>
        
        for v in data as [Dictionary<String,AnyObject>]{
            let school : School = School.init(dict: v)
            ar.append(school)
        }
        return ar
    }
    
    func getProjects() -> Array<Project>{
        var ar : Array = Array<Project>()
        let data : Array<Dictionary<String,AnyObject>> = self.parseFile("Projects") as! Array<Dictionary<String,AnyObject>>
        
        for v in data as [Dictionary<String,AnyObject>]{
            let school : Project = Project.init(dict: v)
            ar.append(school)
        }
        return ar
    }
    
    private func parseFile(fileName : String) -> AnyObject{
        let path : String = NSBundle.mainBundle().pathForResource(fileName, ofType: "json")!
        var parseError: NSError?
        let parsedObject: AnyObject? = NSJSONSerialization.JSONObjectWithData(NSData(contentsOfFile: path)!,
            options: NSJSONReadingOptions.AllowFragments,
            error:&parseError)
        return parsedObject!
    }
}