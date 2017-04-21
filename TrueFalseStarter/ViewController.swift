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
    
    
    
    let questionsPerRound = 6
    var questionsAsked = 0
    var correctQuestions = 0
    var masterTriviaListRandomized = GKRandomSource.sharedRandom().arrayByShufflingObjects(in: masterTriviaListOrdered) as! [[String]]
    
    
    var gameSound: SystemSoundID = 0
    
    
    var randomTriviaQuestions: [[String]] = []
    var randomTriviaAnswers: [[String]] = []
    var selectedQuestion: [String] = []
    
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
        //loadNextRoundWithDelay(seconds: 15)
        currentScoreField.text = "Score: \(correctQuestions) / \(questionsAsked)"
        
        selectedQuestion = masterTriviaListRandomized[0]
        
        questionField.text = "The capital of \(selectedQuestion[0]) is:"
        optionOneButton.setTitle(selectedQuestion[2], for: UIControlState.normal)
        optionTwoButton.setTitle(selectedQuestion[3], for: UIControlState.normal)
        optionThreeButton.setTitle(selectedQuestion[4], for: UIControlState.normal)
        optionFourButton.setTitle(selectedQuestion[5], for: UIControlState.normal)
        
        for button in [optionOneButton, optionTwoButton, optionThreeButton, optionFourButton] {
            if button?.currentTitle == "" {
                button?.isHidden = true
            } else {
                button?.isHidden = false
            }
        }
        
         playAgainButton.isHidden = true
        
        loadOutOfTimeWithDelay(seconds: 10)
        
    }
    func outOfTime() {
        questionsAsked += 1
        questionField.text = "Time's Up! The correct answer was \(selectedQuestion[1])."
        
        loadNextRoundWithDelay(seconds: 2)
    }
    func displayScore() {
        // Hide the current score and answer buttons
        currentScoreField.isHidden = true
        optionOneButton.isHidden = true
        optionTwoButton.isHidden = true
        optionThreeButton.isHidden = true
        optionFourButton.isHidden = true
        
        // Display play again button
        playAgainButton.isHidden = false
        
        questionField.text = "Way to go!\nYou got \(correctQuestions) out of \(questionsPerRound) correct!"
        
    }
    

    
    
    @IBAction func checkAnswer(_ sender: UIButton) {
        questionsAsked += 1
        let selectedAnswer = sender.currentTitle!
        let correctAnswer = selectedQuestion[1]
        
        if selectedAnswer == correctAnswer {
            correctQuestions += 1
            AudioServicesPlaySystemSound (1025)
            questionField.text = "Correct!"
        } else {
            AudioServicesPlaySystemSound (1024)
            questionField.text = "Sorry, \(selectedAnswer) is incorrect. The correct answer is \(correctAnswer)"
            
            for button in [optionOneButton, optionTwoButton, optionThreeButton, optionFourButton] {
                if button?.currentTitle == correctAnswer {
                    button?.isHighlighted = true
                } else {
                    button?.isHighlighted = false
                }
            }
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
        // Show the current score and answer buttons
        for button in [optionOneButton, optionTwoButton, optionThreeButton, optionFourButton] {
            button?.isHighlighted = false
            button?.isHidden = false
        }
        

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
    
    func loadOutOfTimeWithDelay(seconds: Int) {
        // Converts a delay in seconds to nanoseconds as signed 64 bit integer
        let delay = Int64(NSEC_PER_SEC * UInt64(seconds))
        // Calculates a time value to execute the method given current time and delay
        let dispatchTime = DispatchTime.now() + Double(delay) / Double(NSEC_PER_SEC)
        
        // Executes the nextRound method at the dispatch time on the main queue
        DispatchQueue.main.asyncAfter(deadline: dispatchTime) {
            self.outOfTime()
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

