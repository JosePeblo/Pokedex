//
//  PokemonInfoRequirements.swift
//  Pokedex
//
//  Created by peblo on 03/10/23.
//

import Foundation


protocol PokemonInfoRequirementProtocol {
    func getPokemonInfo(numberPokemon: Int) async -> Profile?
}

class PokemonInfoRequirement: PokemonInfoRequirementProtocol {
    let dataRepository: PokemonRepository
    static let shared = PokemonInfoRequirement()
    
    init(dataRepository: PokemonRepository = PokemonRepository.shared) {
        self.dataRepository = dataRepository
    }
    
    func getPokemonInfo(numberPokemon: Int) async -> Profile? {
        return await dataRepository.getPokemonInfo(numberPokemon: numberPokemon)
    }
}
