//
//  FavoritesController.swift
//  pokedexV5
//
//  Created by Consultant on 3/13/22.
//

import Foundation
import UIKit
import CoreData

class FavoritesController: UIViewController{

    @IBOutlet weak var tableView: UITableView!
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var favorites:[Favorite]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.layer.cornerRadius = 10
        tableView.delegate = self
        tableView.dataSource = self
        
        NotificationCenter.default.addObserver(self, selector: #selector(fetchFavorites), name: NSNotification.Name(rawValue: "load"), object: nil)
        //fetchFavorites()
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "load"), object: nil)
        
    }
    
    @objc func fetchFavorites(notification: NSNotification){
        do{
            self.favorites = try context.fetch(Favorite.fetchRequest())

            DispatchQueue.main.async{
                self.tableView.reloadData()
            }

        }catch(let error){
            print(error.localizedDescription)
        }

    }
    
}

extension FavoritesController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int)-> Int{
        return self.favorites?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "favoriteCell", for: indexPath) as! favoriteCell
        cell.pokemonName?.text = favorites?[indexPath.row].pokemonName?.capitalized
        cell.pokemonElement?.text = favorites?[indexPath.row].pokemonType?.capitalized
        
        let spriteURL: String = (favorites?[indexPath.row].imageSprite) ?? "Nothing"
        
        do {
            let url = URL(string: spriteURL)
            let data = try Data(contentsOf: url!)
            cell.pokemonSprite.image = UIImage(data: data)
        }
        catch{
            print(error)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let action = UIContextualAction(style: .destructive, title: "Delete"){ (action, view, completionHandler) in
            
            let pokemonToDelete = self.favorites![indexPath.row]
            
            self.context.delete(pokemonToDelete)
            
            do{
                try self.context.save()
            }catch(let error){
                print(error.localizedDescription)
            }
            
            //self.fetchFavorites()
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "load"), object: nil)
        }
        
        return UISwipeActionsConfiguration(actions: [action])
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        performSegue(withIdentifier: "favoriteSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? FavoriteDetailController{
            destination.favorite = favorites?[(tableView.indexPathForSelectedRow?.row)!]
        }
    }
    
}
