//
//  PmInfoView.swift
//  PokeDex
//
//  Created by 王怀 on 16/1/16.
//  Copyright © 2016年 王怀. All rights reserved.
//

import UIKit

class PmInfoView: UIView{
    var pm:PokemonMo!
    var specieLab:UILabel!
    var egg1Lab:UILabel!
    var egg2Lab:UILabel!
    var catchLab:UILabel!
    var maxExpLab:UILabel!
    var maxEggLab:UILabel!
    var effortLab:UILabel!
    var sexualLab:UILabel!
    var heightLab:UILabel!
    var weightLab:UILabel!
    init(pm:PokemonMo) {
        super.init(frame: CGRect(x: 0, y: 0, width: 0, height: 40*8))
        
        self.pm = pm
        
        self.specieLab = self.addContent("种类", at:0)
        self.specieLab.text = self.pm.getSpecie()
        
        self.egg1Lab = self.addContent("生蛋组1", at:40*1)
        self.egg1Lab.text = self.pm.getEggGroup(at:1)

        self.catchLab = self.addContent("捕获率", at:40*2)
        self.catchLab.text = self.pm.getCatchRate()

        self.maxExpLab = self.addContent("满级经验", at:40*3)
        self.maxExpLab.text = self.pm.getMaxExp()

        self.maxEggLab = self.addContent("孵化步数", at:40*4)
        self.maxEggLab.text = self.pm.getMaxEgg()

        self.effortLab = self.addContent("努力值", at:40*5)
        self.effortLab.text = self.pm.getSpecie()

        self.sexualLab = self.addContent("性别比", at:40*6)
        self.sexualLab.text = self.pm.getSpecie()
        
        self.heightLab = self.addContent("身高", at:40*7)
        self.heightLab.text = self.pm.getSpecie()


    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func addContent(name:String, at posY:Float) -> UILabel {
        let layer = UIView.init()
        layer.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(layer)
        
        let lab = UILabel.init()
        lab.text = name
        lab.textAlignment = .Left
        lab.translatesAutoresizingMaskIntoConstraints = false
        layer.addSubview(lab)
        
        let ret = UILabel.init()
        ret.text = "--"
        ret.textAlignment = .Right
        ret.translatesAutoresizingMaskIntoConstraints = false
        layer.addSubview(ret)
        
        let line = UIView.init()
        line.backgroundColor = UIColor.lightGrayColor()
        line.translatesAutoresizingMaskIntoConstraints = false
        layer.addSubview(line)
        
        var views = ["lab": lab, "ret": ret, "line": line]
        layer.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|-[lab]-|", options: NSLayoutFormatOptions(), metrics: nil, views: views))
        layer.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|-[ret]-|", options: NSLayoutFormatOptions(), metrics: nil, views: views))
        layer.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:[line(==0.5)]|", options: NSLayoutFormatOptions(), metrics: nil, views: views))

        layer.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-[lab(>=100)]-[ret(>=100)]-|", options: NSLayoutFormatOptions(), metrics: nil, views: views))
        layer.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|[line]|", options: NSLayoutFormatOptions(), metrics: nil, views: views))
        views = ["layer": layer]
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|-\(posY)-[layer(==40)]", options: NSLayoutFormatOptions(), metrics: nil, views: views))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|[layer]|", options: NSLayoutFormatOptions(), metrics: nil, views: views))
        
        return ret
    }

}
