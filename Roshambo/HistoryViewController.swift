//
//  HistoryViewController.swift
//  Roshambo
//
//  Created by Hieu Vo on 12/23/15.
//  Copyright © 2015 Hieu Vo. All rights reserved.
//

import Foundation
import UIKit



class HistoryViewController : UIViewController,UITableViewDelegate,UITableViewDataSource{
    
   
    var arrayRPS:[RPS]?
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayRPS!.count
    
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseHistory")! as UITableViewCell
       let RPS = arrayRPS![indexPath.row]
        cell.imageView!.image = UIImage(named: RPS.imageName)
        cell.textLabel!.text = RPS.statu
        if let detailTextLabel = cell.detailTextLabel {
            detailTextLabel.text = RPS.resultStr
        }

        return cell
    }  
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let resultVC = storyboard.instantiateViewControllerWithIdentifier("resultViewController") as! ResultViewController
        let rPS = arrayRPS![indexPath.row]
        resultVC.rPS = rPS
        self.navigationController!.pushViewController(resultVC, animated: true)
    }
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.Delete){
            arrayRPS?.removeAtIndex(indexPath.row)
            tableView.reloadData()
        }
    }
}
