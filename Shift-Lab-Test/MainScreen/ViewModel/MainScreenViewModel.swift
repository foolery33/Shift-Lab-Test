//
//  MainScreenViewModel.swift
//  Shift-Lab-Test
//
//  Created by admin on 25.04.2023.
//

import Foundation

final class MainScreenViewModel {
    
    private var model = MainScreenModel()
    private var contestsRepository: ContestsRepository
    
    init(contestsRepository: ContestsRepository) {
        self.contestsRepository = contestsRepository
    }
    
    var error: String = ""
    
    var contests: [ContestModel] {
        get {
            model.contests
        }
        set {
            model.contests = newValue
        }
    }
    
    func getContests(completion: @escaping (Bool) -> Void) {
        self.contestsRepository.getContests { [weak self] result in
            switch result {
            case .success(let data):
                self?.contests = data
                completion(true)
            case .failure(let error):
                self?.error = error.errorDescription
                completion(false)
            }
        }
    }
    
}
