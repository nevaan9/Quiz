//
//  ViewController.swift
//  Quizzler
//
//  ProgressHUD code pulled from RelatedCode GitHub Account

import UIKit

class ViewController: UIViewController {
    
    let allQuestions = QuestionBank()
    var pickedAnswer: Bool = false
    var currentQuestion: Int = 0
    var cureentScore = 0
    
    //Place your instance variables here
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        
        
    }


    @IBAction func answerPressed(_ sender: AnyObject) {
        if sender.tag == 1{
            pickedAnswer = true
            cureentScore += 1
            ProgressHUD.showSuccess("Correct")
        }
        else{
            pickedAnswer = false
            ProgressHUD.showError("Wrong!")
        }
    
        nextQuestion()
    }
    
    
    func updateUI() {
        scoreLabel.text = "\(cureentScore)"
        progressLabel.text = "\(currentQuestion+1)/13"
        questionLabel.text = allQuestions.list[currentQuestion].questionText
        progressBar.frame.size.width = view.frame.size.width / 13 * CGFloat(currentQuestion+1)
        
    }
    

    func nextQuestion() {
        currentQuestion = (currentQuestion + 1) % 14
        if currentQuestion != 13 {
            updateUI()
        }
        else {
            let alert = UIAlertController(title: "Awesome!", message: "You finished the quiz", preferredStyle: .alert)
            
            let restartAction = UIAlertAction(title: "Restart", style: .default, handler: { (UIAlertAction) in
                self.startOver()
            })
            
            alert.addAction(restartAction)
            
            present(alert, animated: true, completion: nil)
        }
    }
    
    func startOver() {
        cureentScore = 0
        currentQuestion = 0
        progressLabel.text = "1/13"
        scoreLabel.text = "\(cureentScore)"
        questionLabel.text = allQuestions.list[currentQuestion].questionText
        progressBar.frame = CGRect(x: progressBar.frame.origin.x, y: progressBar.frame.origin.y, width: (progressBar.frame.width + UIScreen.main.bounds.width/13+1).truncatingRemainder(dividingBy: UIScreen.main.bounds.width), height: progressBar.frame.height)
    }
    

    
}
