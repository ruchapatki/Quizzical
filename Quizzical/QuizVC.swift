//
//  QuizVC.swift
//  Quizzical
//
//  Created by Rucha Patki on 3/31/18.
//  Copyright © 2018 ruchapatki. All rights reserved.
//

import UIKit
import QuartzCore

var score = 0;
var total = 0;
var questionIndex = 0;

class QuizVC: UIViewController {
    
    @IBOutlet weak var qNum: UILabel!
    @IBOutlet weak var question: UITextView!
    @IBOutlet weak var arrow: UIButton!
    
    
    @IBOutlet weak var answer1: UIButton!
    @IBOutlet weak var answer2: UIButton!
    @IBOutlet weak var answer3: UIButton!
    @IBOutlet weak var answer4: UIButton!
    

    
    var questions = ["The 16th president of the United States was _____", "2 + 2 = ____", "What was the importance of Washington?", "What is the best flavor of ice cream?"]
    var answers = [["Alexander Hamilton", "Abraham Lincoln", "James Madison", "Thomas Jefferson"],["4","1","Window","21"]]
    var correct = [2,1];
    
    
    var correctTag = 0;
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        qNum.layer.masksToBounds = true
        qNum.layer.cornerRadius = 20
        question.isEditable = false
        
        answer1.layer.masksToBounds = true
        answer2.layer.masksToBounds = true
        answer3.layer.masksToBounds = true
        answer4.layer.masksToBounds = true
        answer1.layer.cornerRadius = 5
        answer2.layer.cornerRadius = 5
        answer3.layer.cornerRadius = 5
        answer4.layer.cornerRadius = 5
        
        arrow.isHidden = true
        arrow.isEnabled = false
        
        score = 0;
        total = 0;
        questionIndex = 0;
        total = correct.count;

        updateQuestion(questions: questions, answers: answers, correct: correct[questionIndex])
        
    }
    
    func updateQuestion(questions: [String], answers: [[String]], correct: Int){
        let myColor = UIColor(red: 43/255, green: 33/255, blue: 49/255, alpha: 1)
        arrow.isHidden = true;
        arrow.isEnabled = false;
        
        answer1.isEnabled = true
        answer2.isEnabled = true
        answer3.isEnabled = true
        answer4.isEnabled = true
        
        answer1.backgroundColor = myColor
        answer2.backgroundColor = myColor
        answer3.backgroundColor = myColor
        answer4.backgroundColor = myColor
        
        qNum.text = "Question \(questionIndex+1)"
        
        let questionText = questions[questionIndex]
        question.text = questionText
        
        let answerOne = answers[questionIndex][0]
        let answerTwo = answers[questionIndex][1]
        let answerThree = answers[questionIndex][2]
        let answerFour = answers[questionIndex][3]
        
        answer1.setTitle("   \(answerOne)", for: .normal)
        answer2.setTitle("   \(answerTwo)", for: .normal)
        answer3.setTitle("   \(answerThree)", for: .normal)
        answer4.setTitle("   \(answerFour)", for: .normal)
        
        correctTag = correct;
    }
    
    @IBAction func answerClicked(_ sender: UIButton) {
        let myGreen = UIColor(red: 0, green: 1, blue: 0, alpha: 0.5)
        let myRed = UIColor(red: 1, green: 0, blue: 0, alpha: 0.5)
        if(sender.tag == correctTag){
            
            sender.backgroundColor = myGreen
            arrow.isHidden = false
            arrow.isEnabled = true
            score += 1;
            
            answer1.isEnabled = false
            answer2.isEnabled = false
            answer3.isEnabled = false
            answer4.isEnabled = false
        }
        else{
            sender.backgroundColor = myRed
            if let button = self.view.viewWithTag(correctTag) as? UIButton
            {
                button.backgroundColor = myGreen
            }
            arrow.isHidden = false
            arrow.isEnabled = true
            
            answer1.isEnabled = false
            answer2.isEnabled = false
            answer3.isEnabled = false
            answer4.isEnabled = false
        }
    }
    
    
    @IBAction func arrowClicked(_ sender: Any) {
        if(questionIndex < questions.count-3){
            questionIndex+=1
            updateQuestion(questions: questions, answers: answers, correct: correct[questionIndex])
        }
        else{
            questionIndex+=1
            performSegue(withIdentifier: "toShort", sender: nil)
        }
    }
    
    
    
    
}
