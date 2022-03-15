//
//  Favorite+CoreDataProperties.swift
//  pokedexV5
//
//  Created by Consultant on 3/14/22.
//
//

import Foundation
import CoreData


extension Favorite {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Favorite> {
        return NSFetchRequest<Favorite>(entityName: "Favorite")
    }

    @NSManaged public var imageSprite: String?
    @NSManaged public var isFavorite: Bool
    @NSManaged public var pokemonName: String?
    @NSManaged public var pokemonNumber: Int16
    @NSManaged public var pokemonType: String?
    @NSManaged public var abilities: [String]?
    @NSManaged public var movements: [String]?
    @NSManaged public var image3D: String?

}

extension Favorite : Identifiable {

}
