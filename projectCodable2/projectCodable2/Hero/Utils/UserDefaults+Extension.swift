//
//  UserDefaults+Extension.swift
//  projectCodable2
//
//  Created by Consultant on 3/9/22.
//

import Foundation

extension UserDefaults{
    
    private enum UserDefaultKeys: String{
        case isFavorite
    }
    
    var isFavorite: Bool{
        get{
            bool(forKey: UserDefaultKeys.isFavorite.rawValue)
        }
        
        set{
            setValue(newValue, forKey: UserDefaultKeys.isFavorite.rawValue)
        }
    }
}
