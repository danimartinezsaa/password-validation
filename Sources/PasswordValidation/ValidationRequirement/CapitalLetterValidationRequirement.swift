//
//  CapitalLetterValidationRequirement.swift
//  
//
//  Created by Daniel Martínez on 5/8/22.
//

import Foundation

class CapitalLetterValidationRequirement: ValidationRequirement {
    
    func validate(password: String) -> ValidationRequirementResult {
        password.lowercased() == password ?
        ValidationRequirementResult(error: .missingCapitalLetter) :
        ValidationRequirementResult()
    }
}
