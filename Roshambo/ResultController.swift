//
//  ResultController.swift
//  Roshambo
//
//  Created by Hieu Vo on 12/11/15.
//  Copyright © 2015 Hieu Vo. All rights reserved.
//

import UIKit

class ResultViewController : UIViewController{
    
    var arrayRPS : [RPS]?
    var index : Int?
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        let swipeLeftChange = UISwipeGestureRecognizer(target: self, action: Selector("changeResult:"))
        let swipeRightChange = UISwipeGestureRecognizer(target: self, action: Selector("changeResult:"))
        swipeLeftChange.direction = .Left
        swipeRightChange.direction = .Right
        view.addGestureRecognizer(swipeLeftChange)
        view.addGestureRecognizer(swipeRightChange)
        if let rPS = arrayRPS?[index!]{
            getInfo(rPS)
        }
    }
    
    func getInfo (rPS : RPS){
        resultLabel.text = rPS.resultStr
        imageView.image = UIImage(named : rPS.imageName)
    }
    func changeResult(sender:UISwipeGestureRecognizer){
        if sender.direction == UISwipeGestureRecognizerDirection.Right{
            index = ((index! - 1) < 0) ? 0 : (index! - 1)
            if let rPS = arrayRPS?[index!]{
                getInfo(rPS)
            }
        }
        if sender.direction == .Left{
            index = ((index! + 1) >= arrayRPS!.count) ? (arrayRPS!.count - 1) : (index! + 1)
            if let rPS = arrayRPS?[index!]{
                getInfo(rPS)
            }
        }
    }
    
    @IBAction func exit(){
       if let navigationController = self.navigationController {
            navigationController.popToRootViewControllerAnimated(true)
        }
    }
}