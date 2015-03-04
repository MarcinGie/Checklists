//
//  DataModel.swift
//  Checklists
//
//  Created by Marcin on 04.03.2015.
//  Copyright (c) 2015 Marcin. All rights reserved.
//

import Foundation

class DataModel {
    var lists = [Checklist]()
    
    init() {
        loadChecklists()
    }
    
    func documentsDirectory() -> String {
        let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true) as [String]
        return paths[0]
    }
    
    func dataFilePath() -> String {
        return documentsDirectory().stringByAppendingPathComponent("Checklist.plist")
    }
    
    func saveChecklists() {
        let data = NSMutableData()
        let archiever = NSKeyedArchiver(forWritingWithMutableData: data)
        archiever.encodeObject(lists, forKey: "Checklists")
        archiever.finishEncoding()
        data.writeToFile(dataFilePath(), atomically: true)
    }
    
    func loadChecklists() {
        let path = dataFilePath()
        if NSFileManager.defaultManager().fileExistsAtPath(path) {
            if let data = NSData(contentsOfFile: path) {
                let unarchiver = NSKeyedUnarchiver(forReadingWithData: data)
                lists = unarchiver.decodeObjectForKey("Checklists") as [Checklist]
                unarchiver.finishDecoding()
            }
        }
    }
}