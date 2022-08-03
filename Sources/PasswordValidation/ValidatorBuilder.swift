//
//  ValidatorBuilder.swift
//  
//
//  Created by Daniel Martínez on 3/8/22.
//

import Foundation

class ValidatorBuilder {
    
    var minCharacters = 8
    var shouldContainCapitalLetter = false
    var shouldContainLowercaseLetter = false
    var shouldContainNumber = false
    var shouldContainUnderscore = false
    
    init() {}
    
    func withMinimumLenght(_ lenght: Int) -> ValidatorBuilder {
        minCharacters = lenght
        return self
    }
    
    func withCapitalLetterNeeded() -> ValidatorBuilder {
        shouldContainCapitalLetter = true
        return self
    }
    
    func withLowercaseLetterNeeded() -> ValidatorBuilder {
        shouldContainLowercaseLetter = true
        return self
    }
    
    func withNumberNeeded() -> ValidatorBuilder {
        shouldContainNumber = true
        return self
    }
    
    func withUnderscoreNeeded() -> ValidatorBuilder {
        shouldContainUnderscore = true
        return self
    }
    
    func build() -> Validator {
        Validator(minCharacters: minCharacters,
                  shouldContainCapitalLetter: shouldContainCapitalLetter,
                  shouldContainLowercaseLetter: shouldContainLowercaseLetter,
                  shouldContainNumber: shouldContainNumber,
                  shouldContainUnderscore: shouldContainUnderscore)
    }
}
