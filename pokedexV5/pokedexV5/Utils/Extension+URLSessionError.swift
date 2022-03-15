//
//  Extension+URLSessionError.swift
//  pokedexV3
//
//  Created by Consultant on 3/5/22.
//

import Foundation

extension URLSession{
    enum RequestErrors: Error {
        case badURL
        case badData
    }
}
