//
//  ValidateAllFieldsEmptiness.swift
//  Shift-Lab-Test
//
//  Created by admin on 29.04.2023.
//

import Foundation

final class ValidateAllRegisterFieldsEmptiness {
    
    func areFilled(name: String, surname: String, dateOfBirth: String, password: String, confirmPassword: String) -> Bool {
        return !name.isEmpty && !surname.isEmpty && !dateOfBirth.isEmpty && !password.isEmpty && !confirmPassword.isEmpty
    }
    
}
