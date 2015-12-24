//
//  ResultController.swift
//  Roshambo
//
//  Created by Hieu Vo on 12/11/15.
//  Copyright © 2015 Hieu Vo. All rights reserved.
//

import UIKit

class ResultViewController : UIViewController{
    var result : String?
    var nameImage : String?
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        if let result = self.result{
            resultLabel.text = result
        }
        if let nameImage = self.nameImage{
            self.imageView.image = UIImage(named : nameImage)
        }
    }
    
    @IBAction func exit(){
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}