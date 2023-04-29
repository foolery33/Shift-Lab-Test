//
//  ContestsRepository.swift
//  Shift-Lab-Test
//
//  Created by admin on 29.04.2023.
//

import Foundation

protocol ContestsRepository {
    func getContests(completion: @escaping (Result<[ContestModel], AppError>) -> Void)
}
