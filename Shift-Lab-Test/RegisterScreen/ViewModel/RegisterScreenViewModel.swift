//
//  RegisterScreenViewModel.swift
//  Shift-Lab-Test
//
//  Created by admin on 22.04.2023.
//

import Foundation

final class RegisterScreenViewModel {
    
    var name: String = ""
    var surname: String = ""
    var dateOfBirth: String = ""
    var password: String = ""
    var confirmPassword: String = ""
    
    var error: String = ""
    
    func updateName(with name: String) {
        self.name = name
    }
    func updateSurname(with surname: String) {
        self.surname = surname
    }
    func updateDateOfBirth(with dateOfBirth: String) {
        self.dateOfBirth = String(dateOfBirth.prefix(10))
    }
    func updatePassword(with password: String) {
        self.password = password
    }
    func updateConfirmPassword(with confirmPassword: String) {
        self.confirmPassword = confirmPassword
    }
    
    func convertDateToString(_ date: Date) -> String {
        return ConvertDateToStringUseCase().convertDate(date)
    }
    func onRegisterButtonClicked(completion: @escaping (Bool) -> Void) {
        if let validationError = ValidateRegisterScreenFieldsUseCase().getError(
            name: self.name,
            surname: self.surname,
            dateOfBirth: self.dateOfBirth,
            password: self.password,
            confirmPassword: self.confirmPassword
        ) {
            self.error = validationError
            completion(false)
        }
        else {
            completion(true)
        }
    }
    
    func goToMainScreen() {
//        let mainViewController = 
    }
    
}
