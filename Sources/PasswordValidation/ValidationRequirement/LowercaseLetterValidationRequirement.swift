//
//  LowercaseLetterValidationRequirement.swift
//  
//
//  Created by Daniel Martínez on 5/8/22.
//

import Foundation

class LowercaseLetterValidationRequirement: ValidationRequirement {
    
    func validate(password: String) -> ValidationRequirementResult {
        password.uppercased() == password ?
        ValidationRequirementResult(error: .missingLowercaseLetter) :
        ValidationRequirementResult()
    }
}
