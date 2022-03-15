//
//  APIEndpoints.swift
//  pokedexV3
//
//  Created by Consultant on 3/5/22.
//

import Foundation
 
struct APIEndpoints{
    
    
    var limit: String = "&limit=30"
    var pokemonAPI: String = "https://pokeapi.co/api/v2/pokemon?"//offset=0&limit=30")
    
    func returnURL(givenOffset: Int) -> URL{
        
        var pokemonURL: URL
        let offset = "offset=\(String(givenOffset))"
        
        pokemonURL = URL(string: "\(pokemonAPI)\(offset)\(limit)")!
        print(pokemonURL)
        
        return pokemonURL
        
    }
}
