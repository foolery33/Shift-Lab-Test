//
//  ValidateNameUseCase.swift
//  Shift-Lab-Test
//
//  Created by admin on 25.04.2023.
//

import Foundation

final class ValidateNameUseCase {
    
    // Проверка того, что имя содержит или ТОЛЬКО русские, или ТОЛЬКО латинские буквы и ничего больше.
    // Длина имени должна быть не менее 2-ух букв
    func isValidName(_ name: String) -> Bool {
        let nameRegex = "[А-ЯЁ][а-яё]*|[A-Z][a-z]*"
        let namePredicate = NSPredicate(format:"SELF MATCHES %@", nameRegex)
        return namePredicate.evaluate(with: name) && name.count >= 2
    }
    
}
