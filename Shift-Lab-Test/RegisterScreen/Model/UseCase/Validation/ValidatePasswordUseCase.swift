//
//  ValidatePasswordUseCase.swift
//  Shift-Lab-Test
//
//  Created by admin on 25.04.2023.
//

import Foundation

final class ValidatePasswordUseCase {
    
    func validatePassword(_ password: String) -> Bool {
        // Проверка длины пароля
        guard password.count >= 6 else {
            return false
        }
        // Проверка наличия только латинских букв и цифр
        let alphanumericCharacterSet = CharacterSet.alphanumerics
        guard password.rangeOfCharacter(from: alphanumericCharacterSet.inverted) == nil else {
            return false
        }
        // Проверка наличия хотя бы одной заглавной буквы, строчной буквы и цифры
        let uppercaseLetterCharacterSet = CharacterSet.uppercaseLetters
        let lowercaseLetterCharacterSet = CharacterSet.lowercaseLetters
        let decimalDigitCharacterSet = CharacterSet.decimalDigits
        guard password.rangeOfCharacter(from: uppercaseLetterCharacterSet) != nil,
              password.rangeOfCharacter(from: lowercaseLetterCharacterSet) != nil,
              password.rangeOfCharacter(from: decimalDigitCharacterSet) != nil else {
            return false
        }
        return true
    }
    
}
