//
//  Pokedex.swift
//  Pokedex
//
//  Created by peblo on 30/09/23.
//

import Foundation

struct Pokedex: Codable {
    var count: Int
    var results: [Pokemon]
}

struct Pokemon: Codable {
    var name: String
    var url: String
}

struct Profile: Codable {
    var sprites: Sprite
}

struct Sprite: Codable {
    var front_default: String
    var back_default: String
}

struct PokemonBase: Identifiable {
    var id: Int
    var pokemon: Pokemon
    var profile: Profile?
}
