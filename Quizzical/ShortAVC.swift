//
//  ShortAVC.swift
//  Quizzical
//
//  Created by Rucha Patki on 3/31/18.
//  Copyright © 2018 ruchapatki. All rights reserved.
//

import UIKit

class ShortAVC: UIViewController {
    
    @IBOutlet weak var qNum: UILabel!
    @IBOutlet weak var question: UITextView!
    @IBOutlet weak var submitAns: UIButton!
    @IBOutlet weak var answerField: UITextView!
    
    
    var questions = ["The 16th president of the United States was _____", "2 + 2 = ____", "What is the importance of Washington?", "What is the best flavor of ice cream?"]
    var answers = [["Alexander Hamilton", "Abraham Lincoln", "George Washington", "Thomas Jefferson"],["4","1","Window","21"]]
    var correct = [2,1];
    
    override func viewDidLoad() {
        super.viewDidLoad()
        answerField.isEditable = true
        answerField.layer.masksToBounds = true
        answerField.layer.cornerRadius = 10
        qNum.layer.masksToBounds = true
        qNum.layer.cornerRadius = 20
        question.isEditable = false
        updateQuestion(questions: questions)
        
    }
    
    
    func updateQuestion(questions: [String]){
        let myColor = UIColor(red: 43/255, green: 33/255, blue: 49/255, alpha: 1)
        
        qNum.text = "Question \(questionIndex+1)"
        let questionText = "\(questions[questionIndex])"
        question.text = questionText
        answerField.text = ""
    }
    
    
    @IBAction func submitPressed(_ sender: Any) {
        if(questionIndex < questions.count-1){
            questionIndex+=1
            updateQuestion(questions: questions)
        }
        else{
            performSegue(withIdentifier: "toScore", sender: nil)
        }
    
    }
    
}
