//
//  UserProfileView.swift
//  Pokedex
//
//  Created by peblo on 06/10/23.
//

import SwiftUI
import PhotosUI
import SwiftData

struct UserProfileView: View {
    @StateObject var userProfileViewModel = UserProfileViewModel()
    @State var image: Image?
    @State var inputImage: UIImage?
    @State var showingImagePicker = false
    
    @State var imageData: Data?
    
    let goRoot: () -> Void
    
    var body: some View {
        VStack (alignment: .center, spacing: 16) {
            image?
                .resizable()
                .scaledToFit()
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 400)
                .edgesIgnoringSafeArea(.all)
            
            Button {
                self.showingImagePicker = true
            } label: {
                HStack {
                    Image(systemName: "photo")
                        .font(.system(size: 20))
                    Text("Choose Photo")
                        .font(.headline)
                }
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 50)
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(20)
                .padding(.horizontal)
            }
            
            Text(userProfileViewModel.email)
            
            Button {
                userProfileViewModel.logOut()
                goRoot()
            } label : {
                HStack(spacing: 16) {
                    Image(systemName: "power")
                    Text("Logout")
                }.foregroundColor(.red)
            }
        }.onAppear {
            userProfileViewModel.getCurrentUser()
        }.onChange(of: inputImage) { _ in loadImage() }
        .sheet(isPresented: $showingImagePicker) {
            ImagePicker(image: $inputImage)
        }
    }
    
    func loadImage() {
        guard let inputImage = inputImage else { return }
        imageData = inputImage.jpegData(compressionQuality: 1) ?? inputImage.pngData()
        // TODO: Save data to persistent storage
//        Como Usuario quiero personalizar mi perfil y añadir una foto para poder alimentar mi narcisismo
//        Como usuario quiero buscar pokemones en mi Pokedex por nombre para encontrarlos más fácilmente
        image = Image(uiImage: inputImage)
    }
}

struct UserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileView{()}
    }
}
