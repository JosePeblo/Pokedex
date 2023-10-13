//
//  MenuView.swift
//  Pokedex
//
//  Created by peblo on 04/10/23.
//

import SwiftUI

struct MenuView: View {
    let goRoot: () -> Void
    
    var body: some View {
        TabView {
            ContentView().tabItem {
                Image(systemName: "cricket.ball")
                Text("Pokedex")
            }
            UserProfileView(goRoot: goRoot).tabItem {
                Image(systemName: "person")
                Text("Profile")
            }
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView{()}
    }
}
