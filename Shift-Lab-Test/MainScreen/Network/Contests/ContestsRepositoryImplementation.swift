//
//  ContestsRepositoryImplementation.swift
//  Shift-Lab-Test
//
//  Created by admin on 29.04.2023.
//

import Foundation
import Alamofire

final class ContestsRepositoryImplementation: ContestsRepository {
    
    let baseURL = "https://api/"
    let interceptor = CustomRequestInterceptor()
    
    func getContests(completion: @escaping (Result<[ContestModel], AppError>) -> Void) {
        let url = baseURL + "contests"
        AF.request(url, interceptor: interceptor).validate().responseData { response in
            switch response.result {
            case .success(let data):
                do {
                    let decodedData = try JSONDecoder().decode([ContestModel].self, from: data)
                    completion(.success(decodedData))
                } catch {
                    completion(.failure(.contestsError(.modelError)))
                }
            case .failure(_):
                if let requestStatusCode = response.response?.statusCode {
                    switch requestStatusCode {
                    case 500:
                        completion(.failure(.contestsError(.serverError)))
                    default:
                        completion(.failure(.contestsError(.unexpectedError)))
                    }
                }
            }
        }
    }
    
    enum ContestsError: Error, LocalizedError, Identifiable {
        case modelError
        case serverError
        case unexpectedError
        var id: String {
            self.errorDescription
        }
        var errorDescription: String {
            switch self {
            case .modelError:
                return R.string.errors.model_error()
            case .serverError:
                return R.string.errors.server_error()
            case .unexpectedError:
                return R.string.errors.unexpected_error()
            }
        }
    }
    
}
