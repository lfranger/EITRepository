//
//  DetailViewController.swift
//  pokedexV3
//
//  Created by Consultant on 3/7/22.
//

import UIKit

class DetailViewController: UIViewController{
    
    @IBOutlet weak var pokemonImage: UIImageView!
    @IBOutlet weak var pokemonName: UILabel!
    
    @IBOutlet weak var pokemonIdentifier: UILabel!
    
    @IBOutlet weak var element: UILabel!
    
    @IBOutlet weak var movementsTableView: UITableView!
    
    @IBOutlet weak var abilitiesTableView: UITableView!
    
    var movements = [Moves]()
    var abilities = [Abilities]()
    
    var pokemonData: PokemonData?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        movementsTableView.register(UITableViewCell.self, forCellReuseIdentifier: "moveCell")
        movementsTableView.delegate = self
        movementsTableView.dataSource = self
        
        abilitiesTableView.register(UITableViewCell.self, forCellReuseIdentifier: "moveCell")
        abilitiesTableView.delegate = self
        abilitiesTableView.dataSource = self
        
        pokemonName.text = pokemonData?.name.capitalized
        
        let pokemonID: String = "No. \(String(pokemonData!.id))"
        
        pokemonIdentifier.text = pokemonID
        
        element.text = pokemonData?.types.first?.type.name.capitalized
        
        self.movements = pokemonData!.moves

        self.abilities = pokemonData!.abilities
        
        let spriteURL = pokemonData?.sprites.other.home.front_default
        do {
            let url = URL(string: spriteURL!)
            let data = try Data(contentsOf: url!)
            pokemonImage.image = UIImage(data: data)
        }
        catch{
            print(error)
        }
    }
}

extension DetailViewController: UITableViewDelegate, UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int)->Int{
        
        if tableView == movementsTableView{
            return movements.count
        }
        
        return abilities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if tableView == movementsTableView{
            let cell = tableView.dequeueReusableCell(withIdentifier: "moveCell", for: indexPath)
            cell.textLabel!.text = movements[indexPath.row].move.name
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "abilityCell", for: indexPath)
            cell.textLabel!.text = abilities[indexPath.row].ability.name
            return cell
            
        }
    }
}
