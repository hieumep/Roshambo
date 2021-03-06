//
//  ViewController.swift
//  Roshambo
//
//  Created by Hieu Vo on 12/10/15.
//  Copyright © 2015 Hieu Vo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    enum status:String{
        case win = "win"
        case lose = "lose"
        case tie = "tie"
    }

    enum cards:String{
        case Rock = "Rock"
        case Paper = "Paper"
        case Scissors = "Scissores"
        init() {
            let ranIndex = arc4random() % 3;
            switch ranIndex{
            case 0 :
                self = .Rock
            case 1 :
                self = .Paper
            default :
                self = .Scissors
            }
        }
        func nameImage(win: status)-> String{
            switch(self, win){
            case (.Rock, .win) , (.Scissors, .lose) :
                return "RockCrushesScissors"
            case (.Paper, .win), (.Rock,.lose):
                return "PaperCoversRock"
            case (.Scissors, .win), (.Paper,.lose):
                return "SissorsCutsPaper"
            case (_, .tie) :
                return "ItsATie"
            }
        }
    }
    
    struct match{
        let p1 : cards
        let p2 : cards 
        
        
        init (p1:cards, p2:cards) {
            self.p1 = p1
            self.p2 = p2
        }
        
        func compare() -> RPS{
            switch (p1,p2) {
            case (.Rock,.Scissors), (.Paper,.Rock), (.Scissors,.Paper) :
                let resultStr = "You win computer with \(p1.rawValue) vs \(p2.rawValue)"
                return RPS(resultStr: resultStr,statu: status.win.rawValue,imageName: p1.nameImage(.win))
            case (.Rock,.Rock), (.Paper,.Paper), (.Scissors, .Scissors) :
                let resultStr =  "You tie with computer. \(p1.rawValue) vs \(p2.rawValue)"
                return RPS(resultStr: resultStr,statu: status.tie.rawValue, imageName: p1.nameImage(.tie))
            default :
                let resultStr = "You lose computer with \(p1.rawValue) vs \(p2.rawValue)"
                return RPS(resultStr: resultStr,statu: status.lose.rawValue, imageName: p1.nameImage(.lose))

            }
            
        }
    }
    
    var arrayRPS = [RPS]()
    
    @IBOutlet weak var scissorsButton: UIButton!
    @IBOutlet weak var rockButton: UIButton!
    @IBOutlet weak var paperButton: UIButton!
    
    @IBOutlet weak var labelResult: UILabel!
    
    func play(p1:cards){
        let p2 = cards()
        let theMatch = match(p1: p1,p2 : p2)
        let theResult = theMatch.compare()
        arrayRPS.append(theResult)
    }
    
    @IBAction func pickRock(){
        play(.Rock)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let resultVC = storyboard.instantiateViewControllerWithIdentifier("resultViewController") as! ResultViewController
        resultVC.arrayRPS = arrayRPS
        resultVC.index = arrayRPS.count - 1
        navigationController?.pushViewController(resultVC, animated: true)
    }
    
    @IBAction func pickPaper(){
        performSegueWithIdentifier("pickPaperSegue", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        switch segue.identifier!{
        case "theScissorrsSegue":
            let resultVC = segue.destinationViewController as! ResultViewController
            play(.Scissors)
            resultVC.arrayRPS = arrayRPS
            resultVC.index = arrayRPS.count - 1
        case "pickPaperSegue" :
            let resultVC = segue.destinationViewController as! ResultViewController
            play(.Paper)
            resultVC.arrayRPS = arrayRPS
            resultVC.index = arrayRPS.count - 1
        default :
            let historyVC = segue.destinationViewController as! HistoryViewController
            historyVC.arrayRPS = arrayRPS
        }
        
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

