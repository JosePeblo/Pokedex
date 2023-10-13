//
//  LocalService.swift
//  Pokedex
//
//  Created by peblo on 04/10/23.
//

import Foundation

class LocalService {
    static let shared = LocalService()
    
    func getCurrentUser() -> String? {
        return UserDefaults.standard.string(forKey: "currentUser")
    }
    
    func setCurrentUser(email: String) {
        UserDefaults.standard.set(email, forKey: "currentUser")
    }
    
    func removeCurrentUser() {
        UserDefaults.standard.removeObject(forKey: "currentUser")
    }
}
