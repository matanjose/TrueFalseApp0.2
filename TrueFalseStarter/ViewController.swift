//
//  ViewController.swift
//  TrueFalseStarter
//
//  Created by Pasan Premaratne on 3/9/16.
//  Copyright © 2016 Treehouse. All rights reserved.
//

import UIKit
import GameKit
import AudioToolbox

class ViewController: UIViewController {
    
    
    let questionsPerRound = masterTriviaListOrdered.count
    var questionsAsked = 0
    var correctQuestions = 0
    var masterTriviaListRandomized = GKRandomSource.sharedRandom().arrayByShufflingObjects(in: masterTriviaListOrdered) as! [[String]]
    
    
    var gameSound: SystemSoundID = 0
    
    var randomTriviaQuestions: [[String]] = []
    var randomTriviaAnswers: [[String]] = []
    
    @IBOutlet weak var currentScoreField: UILabel!
    @IBOutlet weak var questionField: UILabel!
    @IBOutlet weak var optionOneButton: UIButton!
    @IBOutlet weak var optionTwoButton: UIButton!
    @IBOutlet weak var optionThreeButton: UIButton!
    @IBOutlet weak var optionFourButton: UIButton!
    @IBOutlet weak var playAgainButton: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        loadGameStartSound()
        // Start game
        playGameStartSound()
        displayQuestion()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func displayQuestion() {
        
        var selectedQuestion = masterTriviaListRandomized[0]
        
         questionField.text = "What is the capital of \(selectedQuestion[0])"
        optionOneButton.setTitle(selectedQuestion[2], for: UIControlState.normal)
        optionTwoButton.setTitle(selectedQuestion[3], for: UIControlState.normal)
        optionThreeButton.setTitle(selectedQuestion[4], for: UIControlState.normal)
        optionFourButton.setTitle(selectedQuestion[5], for: UIControlState.normal)
         playAgainButton.isHidden = true
        
        
    }
    
    func displayScore() {
        // Hide the answer buttons
        optionOneButton.isHidden = true
        optionTwoButton.isHidden = true
        optionThreeButton.isHidden = true
        optionFourButton.isHidden = true
        
        // Display play again button
        playAgainButton.isHidden = false
        
        questionField.text = "Way to go!\nYou got \(correctQuestions) out of \(questionsPerRound) correct!"
        
    }
    
    @IBAction func checkAnswer(_ sender: UIButton) {
        // Increment the questions asked counter
        questionsAsked += 1
        
        var selectedQuestion = masterTriviaListRandomized[0]
        let selectedAnswer = "\(sender.currentTitle)"
        let correctAnswer = selectedQuestion[1]
        
        if selectedAnswer == correctAnswer {
            correctQuestions += 1
            questionField.text = "Correct!"
        } else {
            questionField.text = "Sorry, wrong answer!"
        }
        
        loadNextRoundWithDelay(seconds: 2)
    }
    
    func nextRound() {
        masterTriviaListRandomized.remove(at: 0)
        if questionsAsked == questionsPerRound {
            // Game is over
            displayScore()
        } else {
            // Continue game
            displayQuestion()
        }
    }
    
    @IBAction func playAgain() {
        // Show the answer buttons
        optionOneButton.isHidden = false
        optionTwoButton.isHidden = false
        optionThreeButton.isHidden = false
        optionFourButton.isHidden = false
        
        questionsAsked = 0
        correctQuestions = 0
        masterTriviaListRandomized = GKRandomSource.sharedRandom().arrayByShufflingObjects(in: masterTriviaListOrdered) as! [[String]]
        nextRound()
    }
    

    
    // MARK: Helper Methods
    
    func loadNextRoundWithDelay(seconds: Int) {
        // Converts a delay in seconds to nanoseconds as signed 64 bit integer
        let delay = Int64(NSEC_PER_SEC * UInt64(seconds))
        // Calculates a time value to execute the method given current time and delay
        let dispatchTime = DispatchTime.now() + Double(delay) / Double(NSEC_PER_SEC)
        
        // Executes the nextRound method at the dispatch time on the main queue
        DispatchQueue.main.asyncAfter(deadline: dispatchTime) {
            self.nextRound()
        }
    }
    
    func loadGameStartSound() {
        let pathToSoundFile = Bundle.main.path(forResource: "GameSound", ofType: "wav")
        let soundURL = URL(fileURLWithPath: pathToSoundFile!)
        AudioServicesCreateSystemSoundID(soundURL as CFURL, &gameSound)
    }
    
    func playGameStartSound() {
        AudioServicesPlaySystemSound(gameSound)
    }
}

