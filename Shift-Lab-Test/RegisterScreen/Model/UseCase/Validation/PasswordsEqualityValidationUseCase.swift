//
//  PasswordsEqualityValidationUseCase.swift
//  Shift-Lab-Test
//
//  Created by admin on 25.04.2023.
//

import Foundation

final class PasswordsEqualityValidationUseCase {
    
    func areEqualPasswords(_ password: String, _ confirmPassword: String) -> Bool {
        return password == confirmPassword
    }
    
}
