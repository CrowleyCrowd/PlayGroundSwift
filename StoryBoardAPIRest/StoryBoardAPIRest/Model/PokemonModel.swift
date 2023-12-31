// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let pokemonModel = try? JSONDecoder().decode(PokemonModel.self, from: jsonData)

import Foundation

// MARK: - PokemonModel
struct PokemonModel: Codable {
    let count: Int
    let next: String
    let results: [Result]
}

// MARK: - Result
struct Result: Codable {
    let name: String
    let url: String
}
