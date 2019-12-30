//
//  ViewController.swift
//  QuizzApp
//
//  Created by Vibhor Gupta on 2/15/19.
//  Copyright © 2019 Vibhor Gupta. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var trueButton : UIButton!
    @IBOutlet weak var falseButton : UIButton!
    @IBOutlet weak var progress : UILabel!


    let allQuestions = QuestionModel()
    var pickedAnswer =  false
    var questionNumber = 0
    var score = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        let firstQuestion = allQuestions.list[0]
        questionLabel.text = firstQuestion.question

        trueButton.layer.cornerRadius = 10
        falseButton.layer.cornerRadius = 10


    }

    @IBAction func answerPressed(_ sender: AnyObject) {
        if sender.tag == 1 {
            pickedAnswer = true
        }else if sender.tag == 2 {
            pickedAnswer = false
        }

        checkAnswer()

        questionNumber += 1
        nextQuestion()

    }


    func updateUI(){
        scoreLabel.text =  " \(score)"
        progress.text = "\(questionNumber)/13"
    }

    func updateQuestion(){

    }
    func checkAnswer(){

        let correctAnswer = allQuestions.list[questionNumber].answer

        if correctAnswer == pickedAnswer {
            score += 1
            updateUI()
        }else{
            updateUI()
        }
    }
    func restart(){
        questionNumber = 0
        nextQuestion()

    }



    func nextQuestion(){
        if questionNumber  <= 12 {
            questionLabel.text = allQuestions.list[questionNumber].question

        }else{
            let alert  =  UIAlertController(title: "Well Done!!", message: "Do you want to restart?", preferredStyle: .alert)

            let restartAction = UIAlertAction(title: "Restart", style: .default) { (UIAlertAction) in
                self.restart()
            }
            alert.addAction(restartAction)
            present(alert, animated: true, completion: nil)
        }
    }
}

