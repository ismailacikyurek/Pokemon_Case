//
//  PokemonDetailModel.swift
//  pokemonCase
//
//  Created by İSMAİL AÇIKYÜREK on 27.03.2023.
//

import Foundation

public struct PokemonDetailModel : Codable {
    let abilities : [Ability]
    let name : String
    let sprites : Sprite
}


struct Ability : Codable {
    let ability : AbilityDetails
}
struct AbilityDetails : Codable {
    let name : String
    let url : String
}

struct Sprite : Codable {
    let front_default : String
    let other : OtherPhotos
}

struct OtherPhotos : Codable {
    let home : DreamWorld
}
struct DreamWorld : Codable {
    let front_default : String
}
