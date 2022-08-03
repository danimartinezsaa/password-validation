import Foundation

public struct PasswordValidation {

    private let validatorFactory = ValidatorFactory()
    
    func validate(_ password: String, validator: ValidationType = .validation1) -> Bool {
        validatorFactory.create(validator: validator).validate(password)
    }
}
