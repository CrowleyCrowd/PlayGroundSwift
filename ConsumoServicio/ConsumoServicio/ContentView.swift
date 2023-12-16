//
//  ContentView.swift
//  ConsumoServicio
//
//  Created by Andres Chango on 6/12/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel: PokemonViewModel = PokemonViewModel()

       var body: some View {
           NavigationStack {
               Form {
                   ForEach(viewModel.pokemons, id: \.name) { pokemon in

                       NavigationLink {
                           PokemonDetailView(urlDetail: pokemon.url)
                       } label: {
                           Text(pokemon.name)
                       }
                   }
               }
               .navigationTitle("Pokemons")
           }.onAppear {
               viewModel.getPokemons()
           }
       }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
