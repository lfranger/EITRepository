//
//  FavoriteDetailController.swift
//  pokedexV5
//
//  Created by Consultant on 3/14/22.
//

import UIKit

class FavoriteDetailController: UIViewController{
    
    @IBOutlet weak var pokemonType: UILabel!
    @IBOutlet weak var pokemonNumber: UILabel!
    @IBOutlet weak var pokemonImage: UIImageView!
    @IBOutlet weak var pokemonName: UILabel!
    
    @IBOutlet weak var abilitiesTable: UITableView!
    @IBOutlet weak var movesTable: UITableView!
    
    var favorite: Favorite?
    
    var movementsArray = [String]()
    var abilitiesArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        movesTable.register(UITableViewCell.self, forCellReuseIdentifier: "favMoveCell")
        movesTable.delegate = self
        movesTable.dataSource = self

        abilitiesTable.register(UITableViewCell.self, forCellReuseIdentifier: "favAbilityCell")
        abilitiesTable.delegate = self
        abilitiesTable.dataSource = self
        
        
        print(favorite?.pokemonName ?? "Nothing")
        
        pokemonType.text = favorite?.pokemonType?.capitalized
        
        let pokemonNumberString: String = "No. \(favorite?.pokemonNumber ?? 0)"
        pokemonNumber.text = pokemonNumberString
        
        let spriteURL = favorite?.image3D
        do {
            let url = URL(string: spriteURL!)
            let data = try Data(contentsOf: url!)
            pokemonImage.image = UIImage(data: data)
        }
        catch{
            print(error)
        }
        
        pokemonName.text = favorite?.pokemonName?.capitalized
        
        self.movementsArray = (favorite?.movements)!
        self.abilitiesArray = (favorite?.abilities)!
        
        dump(abilitiesArray)
        
    }
}

extension FavoriteDetailController: UITableViewDelegate, UITableViewDataSource{


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int)->Int{

        if tableView == movesTable{
            return movementsArray.count
        }

        return abilitiesArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        if tableView == movesTable{
            let cell = tableView.dequeueReusableCell(withIdentifier: "favMoveCell", for: indexPath)
            cell.textLabel!.text = movementsArray[indexPath.row]
            cell.imageView?.image = UIImage(systemName: "arrowtriangle.right")
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "favAbilityCell", for: indexPath)
            cell.textLabel!.text = abilitiesArray[indexPath.row]
            cell.imageView?.image = UIImage(systemName: "arrowtriangle.right")
            return cell

        }
    }
}
