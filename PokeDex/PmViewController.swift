//
//  PmViewController.swift
//  PokeDex
//
//  Created by 王怀 on 16/1/16.
//  Copyright © 2016年 王怀. All rights reserved.
//

import UIKit

class PmViewController: UITableViewController {
    var pm:PokemonMo!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = pm.getName()
        tableView.tableHeaderView = UIImageView(frame: CGRectMake(0, 0, tableView.bounds.width, tableView.bounds.width))
        (tableView.tableHeaderView as! UIImageView).image = UIImage(named: pm.getRes())
        addButtomLine(tableView.tableHeaderView!)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //1.1默认返回一组
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    // 1.2 返回行数
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    //1.3 返回行高
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat{
        return 40
    }
    
    //1.4每组的头部高度
    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = UIColor.whiteColor()
        addButtomLine(view)
        
        if(section == 0) {
            let nameLab = UILabel()
            nameLab.text = pm.getName()
            nameLab.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(nameLab)
            
            let numLab = UILabel()
            numLab.text = "No." + pm.getFormateId()
            numLab.textAlignment = .Right
            numLab.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(numLab)

            
            let views = ["nameLab": nameLab, "numLab": numLab]
            view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|[nameLab]|", options: NSLayoutFormatOptions(), metrics: nil, views: views))
            view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-[nameLab(>=100)]", options: NSLayoutFormatOptions(), metrics: nil, views: views))
            
            view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|[numLab]|", options: NSLayoutFormatOptions(), metrics: nil, views: views))
            view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:[numLab(>=100)]-|", options: NSLayoutFormatOptions(), metrics: nil, views: views))
            
        }
        return view
    }
    
    //1.5每组的底部高度
    override func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0
    }
    
    //1.6 返回数据源
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let identifier = "tmp";
        var cell = tableView.dequeueReusableCellWithIdentifier(identifier)
        if(cell == nil){
            cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: identifier)
        }
        cell?.selectionStyle = .None
        addButtomLine(cell!)
        
        if(indexPath.section == 0) {
            if(indexPath.row == 0) {
                
            }
        } else {
            
        }
        
        return cell!
    }
    
    func addButtomLine(view:UIView){
        let line = UIView()
        line.backgroundColor = UIColor.lightGrayColor()
        line.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(line)
        let views = ["line": line]
        view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:[line(0.5)]|", options: NSLayoutFormatOptions(), metrics: nil, views: views))
        view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|[line]|", options: NSLayoutFormatOptions(), metrics: nil, views: views))
    }

}
