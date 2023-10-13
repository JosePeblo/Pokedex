//
//  UserProfileViewModel.swift
//  Pokedex
//
//  Created by peblo on 06/10/23.
//

import Foundation

class UserProfileViewModel: ObservableObject {
    @Published var email = ""
    
    var userRequirement: UserRequirementProtocol
    
    init(userRequirement: UserRequirementProtocol = UserRequirement.shared) {
        self.userRequirement = userRequirement
    }
    
    @MainActor
    func getCurrentUser() {
        self.email = self.userRequirement.getCurrentUser() ?? ""
    }
    
    @MainActor
    func logOut() {
        self.email = ""
        self.userRequirement.removeCurrentUser()
    }
}
