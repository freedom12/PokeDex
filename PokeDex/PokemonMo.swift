//
//  PokemonMo.swift
//  PokeDex
//
//  Created by 王怀 on 16/1/11.
//  Copyright © 2016年 王怀. All rights reserved.
//

import Foundation

class PokemonMo {
    var obj:[String:AnyObject]!
    var PM_ID = -1
    var id = -1
    var ids = [Int]()
    
    init(obj:[String:AnyObject]) {
        self.obj = obj
        self.PM_ID = obj["PM_ID"] as! Int
        self.id = obj["PM_ID_Gen0"] as! Int
        for i in 0...Global.share.gen {
            ids.append(obj["PM_ID_Gen\(i)"] as! Int)
        }
    }
    
    func getFormateId() -> String {
        return getFormateId(inGen:0)
    }
    
    func getFormateId(inGen gen:Int) -> String {
        return String(format: "%03d", ids[gen])
    }
    
    func getName() -> String {
        let db = SQLiteDB.sharedInstance()
        let language = Global.share.language
        let data = db.query("select PM_Name_\(language) from ID_PM_Name where PM_ID_Gen0 = '\(id)'")
        var str:String?
        if (data.count > 0){
            str = data[0]["PM_Name_\(language)"] as? String
        }
        if let ret = str {
            return ret
        }else{
            return "N/A"
        }
    }
    
    func getRes() -> String {
        return getFormateId() + ".png"
    }
}