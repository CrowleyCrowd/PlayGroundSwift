//
//  PokemonResponseDataModel.swift
//  ConsumoServicio
//
//  Created by Andres Chango on 6/12/23.
//

import Foundation
// MARK: - PokemonResponseDataModel
struct PokemonResponseDataModel: Codable {
    let results: [PokemonDataModel]
}

// MARK: - Result
