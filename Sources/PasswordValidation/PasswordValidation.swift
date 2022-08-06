import Foundation

public struct PasswordValidation {

    private let validatorStrategyFactory = ValidatorStrategyFactory()
    
    func validate(_ password: String, strategy: ValidationStrategy = .first) -> Validation {
        let validationStrategy = validatorStrategyFactory.create(validator: strategy)
        return validationStrategy.validate(password)
    }
}
