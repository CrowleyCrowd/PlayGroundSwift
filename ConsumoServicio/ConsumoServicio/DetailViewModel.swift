//
//  DetailViewModel.swift
//  ConsumoServicio
//
//  Created by Andres Chango on 6/12/23.
//

import Foundation
class DetailViewModel : ObservableObject {
    @Published var imageUrl  : String = ""
    func executeRequest( url : String) async {
        let characterURL = URL(string: url)!
        let jsonDecoder = JSONDecoder()
        let (data, _) = try! await URLSession.shared.data(from: characterURL)
        let pokemonDetailModel = try! jsonDecoder.decode(PokemonDetailModel.self, from: data)
        print("PokemonDetailModel \(pokemonDetailModel)")
        DispatchQueue.main.async {
            self.imageUrl = pokemonDetailModel.sprites.frontDefault
        }
    }
}
