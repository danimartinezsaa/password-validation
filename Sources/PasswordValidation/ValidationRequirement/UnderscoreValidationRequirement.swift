//
//  UnderscoreValidationRequirement.swift
//  
//
//  Created by Daniel Martínez on 5/8/22.
//

import Foundation

class UnderscoreValidationRequirement: ValidationRequirement {
    func validate(password: String) -> ValidationRequirementResult {
        password.contains("_") ?
        ValidationRequirementResult() :
        ValidationRequirementResult(error: .missingUnderscore)
    }
}
