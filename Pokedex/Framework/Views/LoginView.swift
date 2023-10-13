//
//  LoginView.swift
//  Pokedex
//
//  Created by peblo on 04/10/23.
//

import SwiftUI

struct LoginView: View {
    @StateObject var loginViewModel = LoginViewModel()
    let goMenu: () -> Void
    
    var body: some View {
        VStack(alignment: .center) {
            Spacer().frame(height: 48)
            
            Text("Pokedex").font(.largeTitle)
            
            Spacer()
            
            VStack(spacing: 0) {
                TextField(text: $loginViewModel.email) {
                    Text("Email")
                }.multilineTextAlignment(.center)
                    .keyboardType(.emailAddress)
                    .padding()
                    .font(.title3)
                    .textInputAutocapitalization(.never)
                
                Divider()
            }
            
            Spacer()
            
            Button {
                loginViewModel.setCurrentUser()
                goMenu()
            } label: {
                Text("Login")
            }
        }.onAppear() {
            loginViewModel.getCurrentUser()
            
            if loginViewModel.email != "" {
                goMenu()
            }
        }.padding()
            .alert(isPresented: $loginViewModel.showAlert) {
                Alert(
                    title: Text("Oops!"),
                    message: Text(loginViewModel.messageAlert)
                )
            }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView {()}
    }
}

