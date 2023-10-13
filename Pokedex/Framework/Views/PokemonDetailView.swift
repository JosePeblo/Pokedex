//
//  PokemonDetailView.swift
//  Pokedex
//
//  Created by peblo on 06/10/23.
//

import SwiftUI
import SDWebImageSwiftUI

struct PokemonDetailView: View {
    var pokemonBase: PokemonBase
    
    var body: some View {
        VStack {
            WebImage(url: URL(string: pokemonBase.profile?.sprites.front_default ?? ""))
            Text(pokemonBase.pokemon.name)
                .font(.largeTitle)
        }
        
    }
}
