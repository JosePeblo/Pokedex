//
//  PokemonAPIProtocol.swift
//  Pokedex
//
//  Created by peblo on 02/10/23.
//

import Foundation

protocol PokemonAPIProtocol {
    //https://pokeapi.co/api/v2/pokemon/limit=1279
    func getPokemonList(limit: Int) async -> Pokedex?
    //https://pokeapi.co/api/v2/pokemon/{number_pokemon}/
    func getPokemonInfo(numberPokemon: Int) async -> Profile?
}
