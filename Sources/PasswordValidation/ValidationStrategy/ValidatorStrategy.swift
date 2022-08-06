//
//  Validator.swift
//  
//
//  Created by Daniel Martínez on 3/8/22.
//

import Foundation

class ValidatorStrategy {

    private let requirements: [ValidationRequirement]
    private let MAX_ERRORS_VALID_PASSWORD = 1
    
    init(requirements: [ValidationRequirement]) {
        self.requirements = requirements
    }
    
    func validate(_ password: String) -> Validation {
        var errors = [ValidationRequirementError]()
        
        requirements.forEach { requirement in
            if let error = requirement.validate(password: password).error {
                errors.append(error)
            }
        }
        
        return Validation(valid: errors.count <= MAX_ERRORS_VALID_PASSWORD, errors: errors)
    }
}
