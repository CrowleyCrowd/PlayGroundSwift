//
//  PokemonViewModel.swift
//  ConsumoServicio
//
//  Created by Andres Chango on 6/12/23.
//

import Foundation
final class PokemonViewModel : ObservableObject {
    @Published var pokemons : [PokemonDataModel] = []

    func getPokemons() {
        let url = URL(string: "https://pokeapi.co/api/v2/pokemon/?offset=0&limit=151")

        URLSession.shared.dataTask(with: url!) { data, response, error in
            if let _ = error {
                print("Error")
            }

            if let data = data,
               let httpResponse = response as? HTTPURLResponse,
               httpResponse.statusCode == 200 {
                let pokemonDataModel = try! JSONDecoder().decode(PokemonResponseDataModel.self, from: data)
                print("Pokemons \(pokemonDataModel)")
                DispatchQueue.main.async {
                    self.pokemons = pokemonDataModel.results
                               }
            }

        }.resume()
    }
}
