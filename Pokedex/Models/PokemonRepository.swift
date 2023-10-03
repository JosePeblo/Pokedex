//
//  PokemonRepository.swift
//  Pokedex
//
//  Created by peblo on 02/10/23.
//

import Foundation

struct Api {
    static let base = "https://pokeapi.co/api/v2"
    
    struct routes {
        static let pokemon = "/pokemon"
    }
}

class PokemonRepository: PokemonAPIProtocol {
    let nservice: NetworkAPIService
    init(nservice: NetworkAPIService = NetworkAPIService.shared) {
        self.nservice = nservice
    }
    func getPokemonList(limit: Int) async -> Pokedex? {
        return await nservice.getPokedex(url: URL(string: "\(Api.base)\(Api.routes.pokemon)")!, limit: limit)
    }
    func getPokemonInfo(numberPokemon: Int) async -> Profile? {
        return await nservice.getPokemonInfo(url: URL(string: "\(Api.base)\(Api.routes.pokemon)/\(numberPokemon)")!)
    }
}

