//
//  Validator.swift
//  
//
//  Created by Daniel Martínez on 3/8/22.
//

import Foundation

struct Validator {
    let minCharacters: Int
    let shouldContainCapitalLetter: Bool
    let shouldContainLowercaseLetter: Bool
    let shouldContainNumber: Bool
    let shouldContainUnderscore: Bool
    
    func validate(_ password: String) -> Bool {
        
        if shouldContainCapitalLetter && !containsAtLeastOneUppercase(password) {
            return false
        }
        
        if shouldContainLowercaseLetter && !containsAtLeastOneLowercase(password) {
            return false
        }
        
        if shouldContainNumber && !containsAtLeastOneNumber(password) {
            return false
        }
        
        if shouldContainUnderscore && !containsAtLeastOneUnderscore(password) {
            return false
        }
        
        return hasTheMinimunLenght(password, minimunLenght: minCharacters)
    }
    
    
    private func containsAtLeastOneUppercase(_ text: String) -> Bool { text.lowercased() != text }
    private func containsAtLeastOneLowercase(_ text: String) -> Bool { text.uppercased() != text }
    private func hasTheMinimunLenght(_ text: String, minimunLenght: Int) -> Bool { text.count >= minimunLenght }
    private func containsAtLeastOneNumber(_ text: String) -> Bool { text.rangeOfCharacter(from: CharacterSet.decimalDigits) != nil }
    private func containsAtLeastOneUnderscore(_ text: String) -> Bool { text.contains("_") }
}
