//
//  ValidateDateOfBirthUseCase.swift
//  Shift-Lab-Test
//
//  Created by admin on 25.04.2023.
//

import Foundation

final class ValidateDateOfBirthUseCase {
    
    func isValidDateOfBirth(_ dateString: String) -> Bool {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"
        guard let date = dateFormatter.date(from: dateString) else {
            return false
        }
        let dateStringConverted = dateFormatter.string(from: date)
        return dateString == dateStringConverted
    }
    
}
