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
    private var pmData:[PokemonMo]!
    
    private init(){
        //获取数据库实例
        db = SQLiteDB.sharedInstance()
        pmData = PokemonMo().allRows("PM_ID_Gen0 ASC")
    }
    
    func getPmNum() -> Int{
        return pmData.count
    }
    
    func getPmById(id:Int) -> PokemonMo{
        return pmData[id-1]
    }
    
}