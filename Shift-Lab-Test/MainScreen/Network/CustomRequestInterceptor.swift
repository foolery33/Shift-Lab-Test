//
//  CustomRequestInterceptor.swift
//  Shift-Lab-Test
//
//  Created by admin on 29.04.2023.
//

import Foundation
import Alamofire

class CustomRequestInterceptor: RequestInterceptor {
    private let retryLimit = 2
    private let retryDelay: TimeInterval = 1
    
    func adapt(_ urlRequest: URLRequest,
               for session: Session,
               completion: @escaping (Result<URLRequest, Error>) -> Void) {
        var urlRequest = urlRequest
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        completion(.success(urlRequest))
    }
    
    func retry(_ request: Request,
               for session: Session,
               dueTo error: Error,
               completion: @escaping (RetryResult) -> Void) {
        guard let statusCode = (request.task?.response as? HTTPURLResponse)?.statusCode else {
            completion(.doNotRetry)
            return
        }
        switch statusCode {
        case (501...599):
            guard request.retryCount < retryLimit else { return }
            completion(.retryWithDelay(retryDelay))
        default:
            completion(.doNotRetry)
        }
    }
    
}
