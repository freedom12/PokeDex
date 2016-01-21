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
    var specieId = -1
    var eggGroupIds = [Int]()
    var catchRate = 0
    var maxExp = 0
    var maxEgg = 0
    
    init(obj:[String:AnyObject]) {
        self.obj = obj
        self.PM_ID = obj["PM_ID"] as! Int
        self.id = obj["PM_ID_Gen0"] as! Int
        for i in 0...Global.share.gen {
            ids.append(obj["PM_ID_Gen\(i)"] as! Int)
        }
        self.specieId = obj["PM_Species_ID"] as! Int
        for i in 1...2 {
            eggGroupIds.append(obj["PM_EggGroup\(i)_ID"] as! Int)
        }
        catchRate = obj["PM_CatchRate"] as! Int
        maxExp = obj["PM_Exp100"] as! Int
        maxEgg = obj["PM_HatchStep"] as! Int
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
    
    func getSpecie() -> String {
        let db = SQLiteDB.sharedInstance()
        let language = Global.share.language
        let data = db.query("select PM_Species_\(language) from ID_PM_Species where PM_Species_ID = '\(specieId)'")
        var str:String?
        if (data.count > 0){
            str = data[0]["PM_Species_\(language)"] as? String
        }
        if let ret = str {
            return ret + "宝可梦"
        }else{
            return "N/A"
        }
    }
    
    func getEggGroup(at index:Int) -> String {
        let db = SQLiteDB.sharedInstance()
        let language = Global.share.language
        let data = db.query("select PM_EggGroup_\(language) from ID_PM_EggGroup where PM_EggGroup_ID = '\(eggGroupIds[index-1])'")
        var str:String?
        print(data.count, eggGroupIds[index-1])
        if (data.count > 0){
            str = data[0]["PM_EggGroup_\(language)"] as? String
        }
        if let ret = str {
            return ret
        }else{
            return "N/A"
        }
    }
    
    func getCatchRate() -> String {
        return String(catchRate)
    }
    
    func getMaxExp() -> String {
        return String(maxExp)
    }
    
    func getMaxEgg() -> String {
        return String(maxEgg)
    }

}