//
//  heroCustomCell.swift
//  projectCodable2
//
//  Created by Consultant on 3/9/22.
//

import UIKit

class heroCustomCell: UITableViewCell{
    
    @IBOutlet weak var favButton: UIButton!
    @IBOutlet weak var heroName: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var hero: Hero?
    
    @IBAction func iconTapped(_ sender: UIButton){
        print("Fav icon tapped")
        UserDefaults.standard.set(true, forKey: "UserLoggedIn")
        var superview = sender.superview
            while let view = superview, !(view is UITableViewCell) {
                superview = view.superview
            }
            guard let cell = superview as? UITableViewCell else {
                print("button is not contained in a table view cell")
                return
            }
            guard let indexPath = tableView.indexPath(for: cell) else {
                print("failed to get index path for cell containing button")
                return
            }
            // We've got the index path for the cell that contains the button, now do something with it.
            print("button is in row \(indexPath.row)")
        
        //let isSet = UserDefaults.standard.bool(forKey: "isFavorite")
        
        var isFavoriteArray = UserDefaults.standard.object(forKey: "isFavorite") as? [Bool]

        if isFavoriteArray?[indexPath.row] == true {
            let heroIcon = UIImage(systemName: "star")
            self.favButton.setImage(heroIcon, for: .normal)
            
            isFavoriteArray?[indexPath.row] = false
//            dump(isFavoriteArray)
            
            
            //UserDefaults.standard.set(!isFavorite, forKey: "isFavorite")
            
        }else{
            
            let heroIcon = UIImage(systemName: "star.fill")
            self.favButton.setImage(heroIcon, for: .normal)
            //UserDefaults.standard.set(!isFavorite, forKey: "isFavorite")
            
            isFavoriteArray?[indexPath.row] = true
//            dump(isFavoriteArray)
            //UserDefaults.standard.set(isFavoriteArray, forKey: "isFavorite")
            
        }
        
        UserDefaults.standard.set(isFavoriteArray, forKey: "isFavorite")
//        var isFavoriteArray2 = UserDefaults.standard.object(forKey: "isFavorite") as? [Bool]
//        dump(isFavoriteArray2)
        
    }
    
}
