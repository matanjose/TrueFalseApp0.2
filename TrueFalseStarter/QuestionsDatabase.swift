//
//  QuestionsDatabase.swift
//  TrueFalseStarter
//
//  Created by Jose Portuondo-Dember on 4/18/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//

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
    
    func generateQuestionArray() -> [String] {
        
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

let canada = CapitalCity(prompt: "Canada", soughtAnswer: "Ottawa", firstRedHerring: "Vancouver", secondRedHerring: "Montreal", thirdRedHerring: "Toronto").generateQuestionArray()

let unitedStates = CapitalCity(prompt: "the United States", soughtAnswer: "Washington, D.C.", firstRedHerring: "New York City", secondRedHerring: "Philadelphia", thirdRedHerring: "Boston").generateQuestionArray()

let colombia = CapitalCity(prompt: "Colombia", soughtAnswer: "Bogotá", firstRedHerring: "Cartagena", secondRedHerring: "Barranquilla", thirdRedHerring: "Medellín").generateQuestionArray()

let brazil = CapitalCity(prompt: "Brazil", soughtAnswer: "Brasilia", firstRedHerring: "São Paolo", secondRedHerring: "Salvador", thirdRedHerring: "Rio de Janeiro").generateQuestionArray()

let france = CapitalCity(prompt: "France", soughtAnswer: "Paris", firstRedHerring: "Versailles", secondRedHerring: "Nice", thirdRedHerring: "Biarritz").generateQuestionArray()

let cuba = CapitalCity(prompt: "Cuba", soughtAnswer: "La Habana", firstRedHerring: "Santiago de Cuba", secondRedHerring: "Santa Clara", thirdRedHerring: "Viñales").generateQuestionArray()

let theNetherlands = CapitalCity(prompt: "the Netherlands", soughtAnswer: "Amsterdam", firstRedHerring: "the Hague", secondRedHerring: "Rotterdam", thirdRedHerring: "Holland").generateQuestionArray()

let japan = CapitalCity(prompt: "Japan", soughtAnswer: "Tokyo", firstRedHerring: "Kyoto", secondRedHerring: "Nara", thirdRedHerring: "Nagasaki").generateQuestionArray()

let kenya = CapitalCity(prompt: "Kenya", soughtAnswer: "Nairobi", firstRedHerring: "Mombasa", secondRedHerring: "Kisumu", thirdRedHerring: "Nakuru").generateQuestionArray()

let mexico = CapitalCity(prompt: "Mexico", soughtAnswer: "Mexico City", firstRedHerring: "Mérida", secondRedHerring: "Cancún", thirdRedHerring: "Juárez").generateQuestionArray()

var masterTriviaListOrdered: [[String]] = [canada, unitedStates, colombia, brazil, france, cuba, theNetherlands, japan, kenya, mexico]



















