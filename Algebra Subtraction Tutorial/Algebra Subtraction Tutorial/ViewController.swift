//
//  ViewController.swift
//  Algebra Subtraction Tutorial
//
//  Created by Julie Berry on 3/19/19.
//  Copyright © 2019 Julie Berry. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    // OUTLETS
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblQuestion: UILabel!
    @IBOutlet weak var txtInput: UITextField!
    @IBOutlet weak var btnCheckAnswer: UIButton!
    @IBOutlet weak var btnNo: UIButton!
    @IBOutlet weak var lblRightOrWrong: UILabel!
    @IBOutlet weak var lblProgress: UILabel!
    
    
    // GLOBAL VARIABLES
    
    var randomNumber1 : Int?
    var randomNumber2 : Int?
    var lastRandomNumber : Int?
    var userAnswer : Int?
    var correctAnswer : Int?
    var progress : Int = 0
    var difficulty : String = "easy"
    
    
    // ACTIONS
    
    @IBAction func checkAnswerACTION(_ sender: UIButton) {
        
    }
    
    @IBAction func chooseNoACTION(_ sender: UIButton) {
        
    }
    
    // FUNCTIONS
    
    // x - rn1 = rn2 (x = rn1 - rn2) if x = 1
    // rn1 - x = rn2 (x = rn2 - rn1) if x = 0
    // random number generators
    func setUpQuestion(){
        // LOGIC: set x as type UInt32 because arc4random_uniform returns a UInt32 so it doesnt have to be cast
            // set x = either 0 or 1
        let x_position : UInt32 = arc4random_uniform(2)
        // test to see what x is
        switch x_position {
        case 0 :
            // do the math to get the right answer
            correctAnswer = randomNumber2! - randomNumber1!
            // set question
            lblQuestion.text = "x  -  " + String(randomNumber1!) + "  =  " + String(randomNumber2!)
        case 1 :
            // do the math to get the right answer
            correctAnswer = randomNumber1! - randomNumber2!
            // set question
            lblQuestion.text = String(randomNumber1!) + "  -  x   =  " + String(randomNumber2!)
        default:
            break
        }
    }
    
    // get a seaparate set of numbers based on difficulty level
    func chooseQuestionNumbers(difficultLevel : String) {
        switch difficultLevel {
        case "easy":
            // rn1 includes 0 thru 6
            randomNumber1 = Int(arc4random_uniform(7))
            // rn2 includes 0 thru 6
            randomNumber2 = Int(arc4random_uniform(7))
            
            /* LOGIC NOTE:
                this says:   if (rn1 = lrn) or if (rn2 = lrn) or if (rn1 is less than rn2)
                TODO: ! it should say: if (rn1 does not = lrn) or if (rn2 does not = lrn) or if (rn1 is less than rn2)
             
             NOTE: randomNumber1! < randomNumber2! ensures there will be no neg. numbers
             */
            
             // make sure the same numbers dont get picked twice in a row
//            if (randomNumber1 == lastRandomNumber || randomNumber2 == lastRandomNumber || randomNumber1! < randomNumber2!) {
            // this should avoid repeats
              if (randomNumber1 != lastRandomNumber || randomNumber2 != lastRandomNumber || randomNumber1! < randomNumber2!) {
                // set question difficulty level
                chooseQuestionNumbers(difficultLevel: "easy")
            }
        case "medium":
            
            /* LOGIC NOTE:
              a)  Int(arc4random_uniform is always 0. Int(arc4random_uniform(x) includes 0 up to but not including  0 and not includingwhatever x is
              b) With Int(arc4random_uniform(6)  there are 5 numbers (1,2,3,4,5) between 0 and 6, so its value is 5
                  7 + is added to the 5 from above
              c)  So 7 + (0 + 5) = 12 then 7 + 5 = 12. These random numbers will start at 7 and end at 12
            */
            
            // rn1 includes 7 thru 12
            randomNumber1 = 7 + Int(arc4random_uniform(6))
            // rn2 includes 7 thru 12
            randomNumber2 = 7 + Int(arc4random_uniform(6))
            // make sure the same numbers dont get picked twice in a row
//            if (randomNumber1 == lastRandomNumber || randomNumber2 == lastRandomNumber || randomNumber1! < randomNumber2!) {
            // this should avoid repeats
            if (randomNumber1 != lastRandomNumber || randomNumber2 != lastRandomNumber || randomNumber1! < randomNumber2!) {
                // set question difficulty level
                chooseQuestionNumbers(difficultLevel: "medium")
            }
        case "hard":
            
            /* LOGIC NOTE:
             // this reads as 6 - (0 + 12) which is 6 - 12 and 6 - 12 = -6
             // so this starts at 6 and ends at -6
            */
            
            // rn1 includes 6 thru -6
            randomNumber1 = 6 - Int(arc4random_uniform(13))
            // rn2 includes 6 thru -6
            randomNumber2 = 6 - Int(arc4random_uniform(13))
            // make sure the same numbers dont get picked twice in a row
            //            if (randomNumber1 == lastRandomNumber || randomNumber2 == lastRandomNumber || randomNumber1! < randomNumber2!) {
                // this should avoid repeats
            // NOTE: (randomNumber1! < randomNumber2!) ensures there will be no neg. numbers. since this logic uses negative numbers, it is removed from the statement
            if (randomNumber1 != lastRandomNumber || randomNumber2 != lastRandomNumber || randomNumber1! < randomNumber2!) {
                    // set question difficulty level
                chooseQuestionNumbers(difficultLevel: "hard")
            }
                
        default:
            break
        }
        // assign last random number to contain the value of one of the generated random numbers
        lastRandomNumber = randomNumber1
        // generate the random numbers
        setUpQuestion()
    }
    
    // define what is correct or incorrect
    func checkIfCorrect() {
        
    }
    
    
    
    // OVERRIDES

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}
