//
//  ContentViewModel.swift
//  Pokedex
//
//  Created by peblo on 03/10/23.
//

import Foundation

class ContentViewModel: ObservableObject {
    @Published var pokemonList = [PokemonBase]()
    
    @MainActor func getPokemonList() async {
        let pokemonRepository = PokemonRepository()
        let result = await pokemonRepository.getPokemonList(limit: 1279)
        
        for pokemon in result!.results {
            let numberPokemon = Int(pokemon.url.split(separator: "/")[5])!
            
            let infoPokemon = await pokemonRepository.getPokemonInfo(numberPokemon: Int(String(numberPokemon))!)
            let tempPokemon = PokemonBase(id: Int(String(numberPokemon))!, pokemon: pokemon, profile: infoPokemon)
            
            self.pokemonList.append(tempPokemon)
            
        }
    }
}
