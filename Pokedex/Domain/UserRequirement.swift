//
//  UserRequirement.swift
//  Pokedex
//
//  Created by peblo on 04/10/23.
//

import Foundation

protocol UserRequirementProtocol {
    func setCurrentUser(email: String)
    func getCurrentUser() -> String?
    func removeCurrentUser()
}

class UserRequirement: UserRequirementProtocol {
    static let shared = UserRequirement()
    let dataRepository: UserRepository
    
    init(dataRepository: UserRepository = UserRepository.shared) {
        self.dataRepository = dataRepository
    }
    
    func setCurrentUser(email: String) {
        self.dataRepository.setCurrentUser(email: email)
    }
    
    func getCurrentUser() -> String? {
        self.dataRepository.getCurrentUser()
    }
    
    func removeCurrentUser() {
        self.dataRepository.removeCurrentUser()
    }
}
