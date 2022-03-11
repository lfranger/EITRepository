//
//  Hero.swift
//  projectCodable2
//
//  Created by Consultant on 3/2/22.
//

import Foundation

struct Hero: Codable{
    let name: String
    let primaryAttribute: String
    let attackType: String
    let legs: Int
    let image: String
    
    /*
     Codable types can declare a special nested enumeration named CodingKeys that conforms to the CodingKeys. When this enumeration is present its cases serve as the authoritative list of properties that must be included when instances of a codable type are encoded or decoded. The names of the enumeration cases should match the names you've given to the corresponding properties in your type
     */
    
    enum CodingKeys: String, CodingKey{
        case name = "localized_name"
        case primaryAttribute = "primary_attr"
        case attackType = "attack_type"
        case legs
        case image = "img"
    }
    
    
}
