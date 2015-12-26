//
//  ResultController.swift
//  Roshambo
//
//  Created by Hieu Vo on 12/11/15.
//  Copyright © 2015 Hieu Vo. All rights reserved.
//

import UIKit

class ResultViewController : UIViewController{
    
    var rPS:RPS?
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        if let rPS = self.rPS{
            resultLabel.text = rPS.resultStr
            imageView.image = UIImage(named : rPS.imageName)
        }
    }
    
    @IBAction func exit(){
       if let navigationController = self.navigationController {
            navigationController.popToRootViewControllerAnimated(true)
        }
    }
}