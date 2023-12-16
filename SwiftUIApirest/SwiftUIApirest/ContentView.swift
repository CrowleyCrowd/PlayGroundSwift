//
//  ContentView.swift
//  SwiftUIApirest
//
//  Created by Usuario invitado on 16/12/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel  = PokemonViewModel()
    var body: some View {
        NavigationStack {
            VStack {
                
                Form {
                    ForEach(viewModel.pokemons, id: \.name) {
                        pokemon in Text (pokemon.name)
                    }
                }
            }
            
            .padding()
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
