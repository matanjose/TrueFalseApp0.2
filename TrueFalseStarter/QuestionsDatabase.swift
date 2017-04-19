//
//  QuestionsDatabase.swift
//  TrueFalseStarter
//
//  Created by Jose Portuondo-Dember on 4/18/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import GameKit


//
//  QuestionsAndAnswers.swift
//  PlayingWithButtons
//
//  Created by Jose Portuondo-Dember on 4/18/17.
//  Copyright © 2017 Jose Portuondo-Dember. All rights reserved.
//
/*
 --------------
 Final Template
 --------------
 */

//For Data Source File
import GameKit

//Struct for storing data units and creating a string that stores the
//prompt, correct answer in first two indices and then randomizes all answers
//(sought and RedHerrings) and appends them after the prompt and correct answer

struct CapitalCity {
    let prompt: String
    let soughtAnswer: String
    let firstRedHerring: String
    let secondRedHerring: String
    let thirdRedHerring: String
    
    func generateFinalArrayForDisplayAndConfirmation() -> [String] {
        
        let originalAnswerArray = [soughtAnswer, firstRedHerring, secondRedHerring, thirdRedHerring]
        let randomAnswerArray = GKRandomSource.sharedRandom().arrayByShufflingObjects(in: originalAnswerArray)
        var finalArrayForDisplayAndConfirmation = [prompt, soughtAnswer]
        
        for item in randomAnswerArray {
            finalArrayForDisplayAndConfirmation.append(item as! String)
        }
        return finalArrayForDisplayAndConfirmation
    }
}

//Input data here

let canada = CapitalCity(prompt: "Canada", soughtAnswer: "Ottawa", firstRedHerring: "Vancouver", secondRedHerring: "Montreal", thirdRedHerring: "Toronto").generateFinalArrayForDisplayAndConfirmation()

let unitedStates = CapitalCity(prompt: "United States", soughtAnswer: "Washington, D.C.", firstRedHerring: "New York City", secondRedHerring: "Philadelphia", thirdRedHerring: "Boston").generateFinalArrayForDisplayAndConfirmation()

let colombia = CapitalCity(prompt: "Colombia", soughtAnswer: "Bógota", firstRedHerring: "Cartagena", secondRedHerring: "Barranquilla", thirdRedHerring: "Medellín").generateFinalArrayForDisplayAndConfirmation()

let brazil = CapitalCity(prompt: "What is the capital of Brazil?", soughtAnswer: "Brasilia", firstRedHerring: "São Paolo", secondRedHerring: "Salvador", thirdRedHerring: "Rio de Janeiro").generateFinalArrayForDisplayAndConfirmation()

let france = CapitalCity(prompt: "France", soughtAnswer: "Paris", firstRedHerring: "Versailles", secondRedHerring: "Nice", thirdRedHerring: "Biarritz").generateFinalArrayForDisplayAndConfirmation()

let cuba = CapitalCity(prompt: "Cuba", soughtAnswer: "La Habana", firstRedHerring: "Santiago de Cuba", secondRedHerring: "Santa Clara", thirdRedHerring: "Viñales").generateFinalArrayForDisplayAndConfirmation()

let theNetherlands = CapitalCity(prompt: "The Netherlands", soughtAnswer: "Amsterdam", firstRedHerring: "The Hague", secondRedHerring: "Rotterdam", thirdRedHerring: "Holland").generateFinalArrayForDisplayAndConfirmation()

let japan = CapitalCity(prompt: "Japan", soughtAnswer: "Tokyo", firstRedHerring: "Kyoto", secondRedHerring: "Nara", thirdRedHerring: "Nagasaki").generateFinalArrayForDisplayAndConfirmation()

let kenya = CapitalCity(prompt: "Kenya", soughtAnswer: "Nairobi", firstRedHerring: "Mombasa", secondRedHerring: "Kisumu", thirdRedHerring: "Nakuru").generateFinalArrayForDisplayAndConfirmation()

let mexico = CapitalCity(prompt: "Mexico", soughtAnswer: "Mexico City", firstRedHerring: "Mérida", secondRedHerring: "Cancún", thirdRedHerring: "Juárez").generateFinalArrayForDisplayAndConfirmation()

//Final product of Data Source File
let masterTriviaListOrdered: [[String]] = [
    canada, unitedStates, colombia, brazil, france, cuba, theNetherlands, japan, kenya, mexico
]

//Insert into ViewController file as part of a func, declare empty array outside of func if necessary
let masterTriviaListRandomized: [[String]] = GKRandomSource.sharedRandom().arrayByShufflingObjects(in: masterTriviaListOrdered) as! [[String]]














