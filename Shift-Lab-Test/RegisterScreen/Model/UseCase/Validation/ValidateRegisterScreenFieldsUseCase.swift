//
//  ValidateRegisterScreenFieldsUseCase.swift
//  Shift-Lab-Test
//
//  Created by admin on 25.04.2023.
//

import Foundation

final class ValidateRegisterScreenFieldsUseCase {
    
    func getError(name: String, surname: String, dateOfBirth: String, password: String, confirmPassword: String) -> String? {
        if CheckEmptyValidationUseCase().isEmptyField(name) ||
            CheckEmptyValidationUseCase().isEmptyField(surname) ||
            CheckEmptyValidationUseCase().isEmptyField(dateOfBirth) ||
            CheckEmptyValidationUseCase().isEmptyField(password) ||
            CheckEmptyValidationUseCase().isEmptyField(confirmPassword) {
            return R.string.registerScreenStrings.empty_field_error()
        }
        if ValidateNameUseCase().isValidName(name) == false {
            return R.string.registerScreenStrings.name_validation_error()
        }
        if ValidateSurnameUseCase().isValidSurname(surname) == false {
            return R.string.registerScreenStrings.surname_validation_error()
        }
        if ValidateDateOfBirthUseCase().isValidDateOfBirth(dateOfBirth) == false {
            return R.string.registerScreenStrings.date_of_birth_validation_error()
        }
        if ValidatePasswordUseCase().validatePassword(password) == false {
            return R.string.registerScreenStrings.password_validation_error()
        }
        if PasswordsEqualityValidationUseCase().areEqualPasswords(password, confirmPassword) == false {
            return R.string.registerScreenStrings.password_equality_error()
        }
        return nil
    }
    
}
