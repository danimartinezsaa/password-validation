//
//  ValidationRequirement.swift
//  
//
//  Created by Daniel Martínez on 5/8/22.
//

import Foundation

protocol ValidationRequirement {
    func validate(password: String) -> ValidationRequirementResult
}

struct ValidationRequirementResult {
    let error: ValidationRequirementError?
    
    init(error: ValidationRequirementError? = nil) {
        self.error = error
    }
}

enum ValidationRequirementError {
    case missingCapitalLetter, missingLowercaseLetter, invalidCharacters, missingNumber, missingUnderscore
}
