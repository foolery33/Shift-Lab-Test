//
//  AppError.swift
//  Shift-Lab-Test
//
//  Created by admin on 29.04.2023.
//

import Foundation

enum AppError: Error, LocalizedError, Identifiable, Equatable {
    
    case contestsError(ContestsRepositoryImplementation.ContestsError)
    
    var id: String {
        self.errorDescription
    }
    var errorDescription: String {
        switch self {
        case .contestsError(let error):
            return error.errorDescription
        }
    }
    
}
