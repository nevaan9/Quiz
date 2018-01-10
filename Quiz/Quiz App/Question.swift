//
//  Question.swift
//  Quizzler
//
//  Created by Nevaan Perera on 11/24/17.
//

import Foundation

class Question {
    
    let questionText: String
    let answer: Bool
    
    // Create an initializer for this class
    init(text: String, correctAnswer: Bool){
        questionText = text
        answer = correctAnswer
    }
}
