import Foundation

public struct PasswordValidation {

    private let validatorStrategyFactory = ValidatorStrategyFactory()
    
    func validate(_ password: String, strategy: ValidationStrategy = .first) -> [ValidationRequirementError] {
        validatorStrategyFactory.create(validator: strategy).validate(password)
    }
}
