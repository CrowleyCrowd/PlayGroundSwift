//
//  PokemonViewModel.swift
//  SwiftUIApirest
//
//  Created by Usuario invitado on 16/12/23.
//

import Foundation

class PokemonViewModel : ObservableObject {
    
    @Published var pokemons : [Result] = []
    
    func getPokemons () {
        let url = URL (string : "https://pokeapi.co/api/v2/pokemon/?offset=0&limit=151")
        
        URLSession.shared.dataTask(with: url!) { data, response, error in
            if let error = error {
                print ("Error \(error)")
            }
            
            if let data  = data,
               let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 {
                let pokemonDataModel = try! JSONDecoder().decode(PokemonModel.self, from: data)
                print("Pokemons \(pokemonDataModel)")
                
                DispatchQueue.main.async {
                    self.pokemons = pokemonDataModel.results
                }
            }
        }.resume()
    }
}
