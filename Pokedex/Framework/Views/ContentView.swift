//
//  ContentView.swift
//  Pokedex
//
//  Created by peblo on 29/09/23.
//

import SwiftUI
import SDWebImageSwiftUI

struct ContentView: View {
    @StateObject var contentViewModel = ContentViewModel()
    
    var body: some View {
        List(contentViewModel.pokemonList) { pokemonBase in
            HStack {
                WebImage(url: URL(string: pokemonBase.profile?.sprites.front_default ?? ""))
                    .resizable()
                    .scaledToFit()
                    .frame(width: 48, height: 48, alignment: .center)
                Text(pokemonBase.pokemon.name)
            }
        }.onAppear {
            Task {
                await contentViewModel.getPokemonList()
            }
        }
    }
}

#Preview {
    ContentView()
}

