//
//  CoordinatorView.swift
//  Pokedex
//
//  Created by peblo on 05/10/23.
//

import SwiftUI
import FlowStacks

struct CoordinatorView: View {
    @State var routes: Routes<Screen> = [.root(.login)]
    
    enum Screen {
        case login
        case menu
    }
    
    var body: some View {
        Router($routes) { screen, _ in
            switch screen {
            case .login:
                LoginView (
                    goMenu: { routes.presentCover(.menu) }
                )
            case .menu:
                MenuView(
                    goRoot: { routes.presentCover(.login) }
                )
            }
        }
    }
    
    private func goRoot() {
        Task { @MainActor in
            await $routes.withDelaysIfUnsupported {
                $0.goBackToRoot()
            }
        }
    }
}

#Preview {
    CoordinatorView()
}
