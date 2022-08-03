import Foundation
public struct PasswordValidation {
    
    private let MIN_LENGHT = 8
    
    func validate(_ password: String) -> Bool {
        
        return containsAtLeastOneLowercase(password) &&
            containsAtLeastOneUppercase(password) &&
            hasTheMinimunLenght(password) &&
            containsAtLeastOneNumber(password) &&
            containsAtLeastOneUnderscore(password)
    }
    
    private func containsAtLeastOneUppercase(_ text: String) -> Bool { text.lowercased() != text }
    private func containsAtLeastOneLowercase(_ text: String) -> Bool { text.uppercased() != text }
    private func hasTheMinimunLenght(_ text: String) -> Bool { text.count >= MIN_LENGHT }
    private func containsAtLeastOneNumber(_ text: String) -> Bool { text.rangeOfCharacter(from: CharacterSet.decimalDigits) != nil }
    private func containsAtLeastOneUnderscore(_ text: String) -> Bool { text.contains("_") }
}
