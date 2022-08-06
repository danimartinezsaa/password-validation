//
//  ValidatorStrategyFactory.swift
//  
//
//  Created by Daniel Martínez on 3/8/22.
//

import Foundation

class ValidatorStrategyFactory {
    
    func create(validator: ValidationStrategy) -> ValidatorStrategy {
        switch validator {
        case .first:
            return createFirstValidatorStrategy()
        case .second:
            return createSecondValidatorStrategy()
        case .third:
            return createThirdValidatorStrategy()
        }
    }
    
    private func createFirstValidatorStrategy() -> ValidatorStrategy {
        return ValidatorStrategyBuilder()
            .withMinimumLenght(8)
            .withCapitalLetterNeeded()
            .withLowercaseLetterNeeded()
            .withNumberNeeded()
            .withUnderscoreNeeded()
            .build()
    }
    
    private func createSecondValidatorStrategy() -> ValidatorStrategy {
        return ValidatorStrategyBuilder()
            .withMinimumLenght(6)
            .withCapitalLetterNeeded()
            .withLowercaseLetterNeeded()
            .withNumberNeeded()
            .build()
    }
    
    private func createThirdValidatorStrategy() -> ValidatorStrategy {
        return ValidatorStrategyBuilder()
            .withMinimumLenght(16)
            .withCapitalLetterNeeded()
            .withLowercaseLetterNeeded()
            .withUnderscoreNeeded()
            .build()
    }
}
