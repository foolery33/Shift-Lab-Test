//
//  ValidateSurnameUseCase.swift
//  Shift-Lab-Test
//
//  Created by admin on 25.04.2023.
//

import Foundation

final class ValidateSurnameUseCase {
    
    // Проверка того, что фамилия содержит или ТОЛЬКО русские, или ТОЛЬКО латинские буквы и ничего больше.
    // Длина фамилии должна быть не менее 2-ух букв
    func isValidSurname(_ surname: String) -> Bool {
        let surnameRegex = "[А-ЯЁ][а-яё]*|[A-Z][a-z]*"
        let surnamePredicate = NSPredicate(format:"SELF MATCHES %@", surnameRegex)
        return surnamePredicate.evaluate(with: surname) && surname.count >= 2
    }
    
}
