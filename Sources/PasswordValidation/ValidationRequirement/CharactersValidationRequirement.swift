//
//  CharactersValidationRequierement.swift
//  
//
//  Created by Daniel Martínez on 5/8/22.
//

import Foundation

class CharactersValidationRequierement: ValidationRequirement {
    
    private let minimunCharacters: Int
    
    init(minimunCharacters: Int) {
        self.minimunCharacters = minimunCharacters
    }
    
    func validate(password: String) -> ValidationRequirementResult {
        password.count < minimunCharacters ?
        ValidationRequirementResult(error: .invalidCharacters) :
        ValidationRequirementResult()
    }

}
