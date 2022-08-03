//
//  ValidatorFactory.swift
//  
//
//  Created by Daniel Martínez on 3/8/22.
//

import Foundation

class ValidatorFactory {
    
    func create(validator: ValidationType) -> Validator {
        switch validator {
        case .validation1:
            return createValidator1()
        case .validation2:
            return createValidator2()
        case .validation3:
            return createValidator3()
        }
    }
    
    private func createValidator1() -> Validator {
        return ValidatorBuilder()
            .withMinimumLenght(8)
            .withCapitalLetterNeeded()
            .withLowercaseLetterNeeded()
            .withNumberNeeded()
            .withUnderscoreNeeded()
            .build()
    }
    
    private func createValidator2() -> Validator {
        return ValidatorBuilder()
            .withMinimumLenght(6)
            .withCapitalLetterNeeded()
            .withLowercaseLetterNeeded()
            .withNumberNeeded()
            .build()
    }
    
    private func createValidator3() -> Validator {
        return ValidatorBuilder()
            .withMinimumLenght(16)
            .withCapitalLetterNeeded()
            .withLowercaseLetterNeeded()
            .withUnderscoreNeeded()
            .build()
    }
}
