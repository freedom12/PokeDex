//
//  PokemonMo.swift
//  PokeDex
//
//  Created by 王怀 on 16/1/11.
//  Copyright © 2016年 王怀. All rights reserved.
//

import Foundation

class PokemonMo:SQLTable {
    var PM_ID = -1
    var PM_ID_Gen0 = -1
    var PM_ID_Gen1 = -1
    var PM_ID_Gen2 = -1
    var PM_ID_Gen3 = -1
    var PM_ID_Gen4 = -1
    var PM_ID_Gen5 = -1
    var PM_Forme_ID = -1
    var Type1_ID = -1
    var Type2_ID = -1
    var Ability1_ID = -1
    var Ability2_ID = -1
    var AbilityH_ID = -1
    var PM_EggGroup1_ID = -1
    var PM_EggGroup2_ID = -1
    var PM_BodyStyle_ID = -1
    var PM_GenderRatio_ID = -1
    var PM_Species_ID = -1
    var PM_Color_ID = -1
    var PM_Habitat_ID = -1
    var PM_CatchRate = -1
    var PM_HatchStep = -1
    var PM_BaseTameness = -1
    var PM_Exp = -1
    var PM_Exp100 = -1
    var PM_Height_0 = -1
    var PM_Weight_0 = -1
    var PM_Height_1 = -1
    var PM_Weight_1 = -1
    var BS_HP = -1
    var BS_ATK = -1
    var BS_DEF = -1
    var BS_SPATK = -1
    var BS_SPDEF = -1
    var BS_SPD = -1
    var BS_TTL = -1
    var EV_HP = -1
    var EV_ATK = -1
    var EV_DEF = -1
    var EV_SPATK = -1
    var EV_SPDEF = -1
    var EV_SPD = -1
    var EV_TTL = -1
    var PM_VSType1 = -1
    var PM_VSType2 = -1
    var PM_VSType3 = -1
    var PM_VSType4 = -1
    var PM_VSType5 = -1
    var PM_VSType6 = -1
    var PM_VSType7 = -1
    var PM_VSType8 = -1
    var PM_VSType9 = -1
    var PM_VSType10 = -1
    var PM_VSType11 = -1
    var PM_VSType12 = -1
    var PM_VSType13 = -1
    var PM_VSType14 = -1
    var PM_VSType15 = -1
    var PM_VSType16 = -1
    var PM_VSType17 = -1
    init() {
        //对应的数据库表
        super.init(tableName:"DB_PM_Basic")
    }
        
    //设置主键（如果主键字段名就是id的话，这个可以省去,不用覆盖）
    override func primaryKey() -> String {
        return "PM_ID";
    }
    
    required convenience init(tableName:String) {
        self.init()
    }
    
    func getName() -> String {
        let db = SQLiteDB.sharedInstance()
        let language = Global.share.language
        let data = db.query("select PM_Name_\(language) from ID_PM_Name where PM_ID_Gen0 = '\(PM_ID_Gen0)'")
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
}