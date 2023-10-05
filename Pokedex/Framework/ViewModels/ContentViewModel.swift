//
//  ContentViewModel.swift
//  Pokedex
//
//  Created by peblo on 03/10/23.
//

import Foundation

class ContentViewModel: ObservableObject {
    @Published var pokemonList = [PokemonBase]()
    
    var pokemonListRequirement: PokemonListRequirementProtocol
    var pokemonInfoRequirement: PokemonInfoRequirementProtocol
    
    init(pokemonListRequirement: PokemonListRequirementProtocol = PokemonListRequirement.shared,
         pokemonInfoRequirement: PokemonInfoRequirementProtocol = PokemonInfoRequirement.shared) {
        self.pokemonListRequirement = pokemonListRequirement
        self.pokemonInfoRequirement = pokemonInfoRequirement
    }
    
    @MainActor 
    func getPokemonList() async {
        let result = await pokemonListRequirement.getPokemonList(limit: 1279)
        
        for pokemon in result!.results {
            let numberPokemon = Int(pokemon.url.split(separator: "/")[5])!
            
            let infoPokemon = await pokemonInfoRequirement.getPokemonInfo(numberPokemon: Int(String(numberPokemon))!)
            let tempPokemon = PokemonBase(id: Int(String(numberPokemon))!, pokemon: pokemon, profile: infoPokemon)
            
            self.pokemonList.append(tempPokemon)
            
        }
    }
}
