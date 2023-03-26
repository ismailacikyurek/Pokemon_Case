//
//  File.swift
//  pokemonCase
//
//  Created by İSMAİL AÇIKYÜREK on 27.03.2023.
//

import Foundation


// MARK: - PokemonListModel
public struct PokemonListModel: Codable {
    let count: Int?
    let next: String?
    let results: [Result]?
}

// MARK: - Result
struct Result: Codable {
    let name: String?
    let url: String?
}
