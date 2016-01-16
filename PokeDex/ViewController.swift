//
//  ViewController.swift
//  PokeDex
//
//  Created by 王怀 on 16/1/11.
//  Copyright © 2016年 王怀. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.title="图鉴"
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
            return Model.share.getPmNum()
    }
    
    //1.3 返回行高
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat{
        return 80
    }
    
    //1.4每组的头部高度
    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0
    }

    //1.5每组的底部高度
    override func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0
    }
    
    //1.6 返回数据源
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let identifier="identtifier";
        var cell=tableView.dequeueReusableCellWithIdentifier(identifier)
        if(cell == nil){
            cell=UITableViewCell(style: UITableViewCellStyle.Value1, reuseIdentifier: identifier)
        }
        let pm = Model.share.getPmById(indexPath.row+1)
        cell?.detailTextLabel?.text = "No." + pm.getFormateId()
        cell?.textLabel?.text = pm.getName()
        cell?.accessoryType=UITableViewCellAccessoryType.DisclosureIndicator
        cell?.imageView?.image = UIImage(named: pm.getRes())
        return cell!;
    }
    
    //1.7 表格点击事件
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //取消选中的样式
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        //获取点击的行索引
        let vc = PmViewController()
        vc.pm = Model.share.getPmById(indexPath.row+1)
        self.navigationController!.pushViewController(vc, animated:true)
    }
}

