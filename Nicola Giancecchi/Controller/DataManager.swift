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
            let project : Project = Project.init(dict: v)
            ar.append(project)
        }
        return ar
    }
    
    
    func getWork() -> Array<Work>{
        var ar : Array = Array<Work>()
        let data : Array<Dictionary<String,AnyObject>> = self.parseFile("Work") as! Array<Dictionary<String,AnyObject>>
        
        for v in data as [Dictionary<String,AnyObject>]{
            let work : Work = Work.init(dict: v)
            ar.append(work)
        }
        return ar
    }
    
    func getAwards() -> Array<Award>{
        var ar : Array = Array<Award>()
        let data : Array<Dictionary<String,AnyObject>> = self.parseFile("Awards") as! Array<Dictionary<String,AnyObject>>
        
        for v in data as [Dictionary<String,AnyObject>]{
            let award : Award = Award.init(dict: v)
            ar.append(award)
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