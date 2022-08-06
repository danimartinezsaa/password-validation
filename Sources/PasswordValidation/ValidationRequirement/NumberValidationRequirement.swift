//
//  NumberValidationRequirement.swift
//  
//
//  Created by Daniel Martínez on 5/8/22.
//

import Foundation

class NumberValidationRequirement: ValidationRequirement {
    
    func validate(password: String) -> ValidationRequirementResult {
        password.rangeOfCharacter(from: CharacterSet.decimalDigits) == nil ?
        ValidationRequirementResult(error: .missingNumber) :
        ValidationRequirementResult()
    }

}
