//
//  ValidatorStrategyBuilder.swift
//  
//
//  Created by Daniel Martínez on 3/8/22.
//

import Foundation

class ValidatorStrategyBuilder {
    
    var requirements = [ValidationRequirement]()
    
    init() {}
    
    func withMinimumLenght(_ lenght: Int) -> ValidatorStrategyBuilder {
        requirements.append(CharactersValidationRequierement(minimunCharacters: lenght))
        return self
    }
    
    func withCapitalLetterNeeded() -> ValidatorStrategyBuilder {
        requirements.append(CapitalLetterValidationRequirement())
        return self
    }
    
    func withLowercaseLetterNeeded() -> ValidatorStrategyBuilder {
        requirements.append(LowercaseLetterValidationRequirement())
        return self
    }
    
    func withNumberNeeded() -> ValidatorStrategyBuilder {
        requirements.append(NumberValidationRequirement())
        return self
    }
    
    func withUnderscoreNeeded() -> ValidatorStrategyBuilder {
        requirements.append(UnderscoreValidationRequirement())
        return self
    }
    
    func build() -> ValidatorStrategy {
        ValidatorStrategy(requirements: requirements)
    }
}
