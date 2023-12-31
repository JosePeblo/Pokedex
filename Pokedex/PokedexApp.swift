//
//  PokedexApp.swift
//  Pokedex
//
//  Created by peblo on 29/09/23.
//

import SwiftUI

@main
struct PokedexApp: App {
    @Environment(\.scenePhase) var scenePhase

    var body: some Scene {
        WindowGroup {
            CoordinatorView()
        }.onChange(of: scenePhase) { (newScenePhase) in
            switch newScenePhase {
            case .background:
                print("App State : Background")
            case .inactive:
                print("App State : Inactive")
            case .active:
                print("App State : Active")
            @unknown default:
                print("App State : Unknown")
            
            }
        }
    }
}
