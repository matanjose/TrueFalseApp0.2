//
//  QuestionsDatabase.swift
//  TrueFalseStarter
//
//  Created by Jose Portuondo-Dember on 4/18/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import GameKit


struct Capital {
    let country: String
    let capital: String
    let wrongAnswerOne: String
    let wrongAnswerTwo: String
    let wrongAnswerThree: String
    
    func answerRandomizer() -> [String] {
        
        let originalAnswerArray = [capital, wrongAnswerOne, wrongAnswerTwo, wrongAnswerThree]
        let randomizedAnswerArray = GKRandomSource.sharedRandom().arrayByShufflingObjects(in: originalAnswerArray)
        
        return randomizedAnswerArray as! [String]
    }
}

let france = Capital(country: "France", capital: "Paris", wrongAnswerOne: "Versailles", wrongAnswerTwo: "Nice", wrongAnswerThree: "Biarritz")
let cuba = Capital(country: "Cuba", capital: "La Habana", wrongAnswerOne: "Santiago De Cuba", wrongAnswerTwo: "Santa Clara", wrongAnswerThree: "Viñales")
let theNetherlands = Capital(country: "The Netherlands", capital: "Amsterdam", wrongAnswerOne: "The Hague", wrongAnswerTwo: "Rotterdam", wrongAnswerThree: "Holland")
let japan = Capital(country: "Japan", capital: "Tokyo", wrongAnswerOne: "Kyoto", wrongAnswerTwo: "Nara", wrongAnswerThree: "Nagasaki")
let kenya = Capital(country: "Kenya", capital: "Nairobi", wrongAnswerOne: "Mombasa", wrongAnswerTwo: "Kisumu", wrongAnswerThree: "Nakuru")
let mexico = Capital(country: "Mexico", capital: "Mexico City", wrongAnswerOne: "Mérida", wrongAnswerTwo: "Cancún", wrongAnswerThree: "Juárez")
let colombia = Capital(country: "Colombia", capital: "Bógota", wrongAnswerOne: "Barranquilla", wrongAnswerTwo: "Cartagena", wrongAnswerThree: "Medellín")

let masterTriviaList = [france, cuba, theNetherlands, japan, kenya, mexico, colombia]






