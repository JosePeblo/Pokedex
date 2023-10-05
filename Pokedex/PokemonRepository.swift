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

protocol PokemonAPIProtocol {
    //https://pokeapi.co/api/v2/pokemon/limit=1279
    func getPokemonList(limit: Int) async -> Pokedex?
    //https://pokeapi.co/api/v2/pokemon/{number_pokemon}/
    func getPokemonInfo(numberPokemon: Int) async -> Profile?
}


class PokemonRepository: PokemonAPIProtocol {
    let nservice: NetworkAPIService
    static let shared = PokemonRepository()
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

