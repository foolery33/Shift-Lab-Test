//
//  ConvertDateToStringUseCase.swift
//  Shift-Lab-Test
//
//  Created by admin on 25.04.2023.
//

import Foundation

final class ConvertDateToStringUseCase {
    
    func convertDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy"
        formatter.locale = Locale(identifier: "en_US_POSIX")
        return formatter.string(from: date)
    }
    
}
