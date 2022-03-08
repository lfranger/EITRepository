//
//  pokemonDictionary.swift
//  pokedexV3
//
//  Created by Consultant on 3/5/22.
//

import Foundation

struct pokemonDictionary: Codable{
    let count: Int
    let next: String?
    let previous: String?
    let results: [PokemonName]
}
