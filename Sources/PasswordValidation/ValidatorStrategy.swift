//
//  Validator.swift
//  
//
//  Created by Daniel Martínez on 3/8/22.
//

import Foundation

struct ValidatorStrategy {

    private let requirements: [ValidationRequirement]
    
    init(requirements: [ValidationRequirement]) {
        self.requirements = requirements
    }
    
    func validate(_ password: String) -> [ValidationRequirementError] {
        var errors = [ValidationRequirementError]()
        
        requirements.forEach { requirement in
            if let error = requirement.validate(password: password).error {
                errors.append(error)
            }
        }
        
        return errors
    }
}
