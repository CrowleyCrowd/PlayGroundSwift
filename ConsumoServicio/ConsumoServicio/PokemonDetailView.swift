//
//  PokemonDetailView.swift
//  ConsumoServicio
//
//  Created by Andres Chango on 6/12/23.
//

import SwiftUI

struct PokemonDetailView: View {
    let urlDetail: String
    @StateObject var detailViewModel : DetailViewModel  = DetailViewModel()
    var body: some View {
        ZStack {
            AsyncImage(url: URL(string: detailViewModel.imageUrl ) ){ phase in // 1
                       if let image = phase.image { // 2
                           // if the image is valid
                           image
                               .resizable()
                               .aspectRatio(contentMode: .fill)
                       } else if phase.error != nil { // 3
                           // some kind of error appears
                           Text("No image available")
                       } else {
                           //appears as placeholder image
                           Image(systemName: "photo") // 4
                               .resizable()
                               .aspectRatio(contentMode: .fill)
                       }
                   }.frame(width: 250, height: 250, alignment: .center)
        }.onAppear{
            Task {
                await detailViewModel.executeRequest(url: urlDetail)
            }
        }

    }

       

}

struct PokemonDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonDetailView(urlDetail: "Cannot convert value of type 'String' to expected argument type 'Binding<String>'")
    }
}
