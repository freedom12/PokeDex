//
//  Model.swift
//  PokeDex
//
//  Created by 王怀 on 16/1/15.
//  Copyright © 2016年 王怀. All rights reserved.
//

import Foundation

class Model{
    static var share = Model()
    
    private var db:SQLiteDB!
    private var pmList = [Int:PokemonMo]()
    
    private init(){
        //获取数据库实例
        db = SQLiteDB.sharedInstance()
    }
    
    func getPmNum() -> Int{
        return Global.share.totalPm
    }
    
    func getPmById(id:Int) -> PokemonMo{
        var pm = pmList[id]
        if ((pm) != nil) {
            return pm!
        }else{
            let data = db.query("select * from DB_PM_Basic where PM_ID_Gen0 = \(id)")
            pm = PokemonMo(obj: data[0])
            return pm!
        }
    }
}