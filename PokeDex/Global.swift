//
//  Global.swift
//  PokeDex
//
//  Created by 王怀 on 16/1/15.
//  Copyright © 2016年 王怀. All rights reserved.
//

import Foundation

class Global{
    static var share = Global()
    
    var language:Int!
    var gen:Int = 5
    var totalPm = 649
    private init(){
        language = 1
    }
}