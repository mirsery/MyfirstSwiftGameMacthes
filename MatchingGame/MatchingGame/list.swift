//
//  list.swift
//  MatchingGame
//
//  Created by mirsery on 15/11/25.
//  Copyright © 2015年 mirsery. All rights reserved.
//

import Foundation
import UIKit
class ListViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    func numberOfSectionsInTableView(tableView:UITableView)->Int{
        return 1
    }
    func tableView(tableView:UITableView,numberOfRowsInSection section:Int)->Int{
        return score.count
    }
    func tableView(tableView :UITableView,cellForRowAtIndexPath indexPath:NSIndexPath)->UITableViewCell{
        var CellIdentifier:NSString = "Cell"
        var cell:UITableViewCell?=(tableView.dequeueReusableCellWithIdentifier(CellIdentifier as String) as? UITableViewCell?)!
        if(cell == nil){
            cell = UITableViewCell(style: UITableViewCellStyle.Default,reuseIdentifier: CellIdentifier as String)
            cell!.textLabel?.text="\(score.objectAtIndex(indexPath.row))"}
            return cell!
    }
}