//
//  ViewController.swift
//  pokedexV3
//
//  Created by Consultant on 3/5/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var pokemonData = [PokemonData]()
    var isLoading = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.layer.cornerRadius = 10
        
        //Register Loading Cell
        let tableViewLoadingCellNib = UINib(nibName: "LoadingCell", bundle: nil)
        self.tableView.register(tableViewLoadingCellNib, forCellReuseIdentifier: "loadingcellid")
        
        fetchPokemonData(offset: 0)
    }
    
    func fetchPokemonData(offset: Int){
        // AQUI COMIENZA EL GRUPO
        let group = DispatchGroup()
        
        let APICall = APIEndpoints()
        
        var pokemonNames = [PokemonName]()
        
        group.enter()
        URLSession.shared.getRequest(url: APICall.returnURL(givenOffset: offset), decoding: pokemonDictionary.self){ [weak self] result in
            
            switch result{
            case .success(let pokemonDictionary):
                //self?.pokemon.append(contentsOf: pokemonDictionary.results)
                pokemonNames.append(contentsOf: pokemonDictionary.results)
//                DispatchQueue.main.async {
//                    self?.tableView.reloadData()
//                }
                
            case .failure(let error):
                print(error.localizedDescription)
            }
            
            for pokemonName in pokemonNames {
                let pokemonURL = URL(string: pokemonName.url)
                URLSession.shared.getRequest(url: pokemonURL, decoding: PokemonData.self){[weak self] result in
                    switch result{
                    case .success(let PokemonData):
                        self?.pokemonData.append(PokemonData)
                        DispatchQueue.main.async {
                            self?.tableView.reloadData()
                        }
                        
                    case .failure(let error):
                        print(error)
                    }
                
                }
                
            }
            
            group.leave()
            
        }
        
        group.notify(queue: .main, execute:{
            print("Finished")
        })
        
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int)-> Int{
        //return pokemonData.count
        
        if section == 0 {
            //Return the amount of items
            return pokemonData.count
        } else if section == 1 {
            //Return the Loading cell
            return 1
        } else {
            //Return nothing
            return 0
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)->UITableViewCell{
        
        if indexPath.section == 0 {
                    let cell = tableView.dequeueReusableCell(withIdentifier: "pokemonCell", for: indexPath) as! pokemonCell
                    cell.pokemonName.text = pokemonData[indexPath.row].name.capitalized
            
                    let pokemonType: [Tyypes] = pokemonData[indexPath.row].types
                    cell.pokemonElement.text = pokemonType[0].type.name.capitalized
            
                    let spriteURL = pokemonData[indexPath.row].sprites.front_default
                    do {
                        let url = URL(string: spriteURL)
                        let data = try Data(contentsOf: url!)
                        cell.pokemonSprite.image = UIImage(data: data)
                    }
                    catch{
                        print(error)
                    }
            
                    return cell
                } else {
                    let cell = tableView.dequeueReusableCell(withIdentifier: "loadingcellid", for: indexPath) as! LoadingCell
                    cell.activityIndicator.startAnimating()
                    return cell
                }
        
//        let cell = tableView.dequeueReusableCell(withIdentifier: "pokemonCell", for: indexPath) as! pokemonCell
//        cell.pokemonName.text = pokemonData[indexPath.row].name.capitalized
//
//        let pokemonType: [Tyypes] = pokemonData[indexPath.row].types
//        cell.pokemonElement.text = pokemonType[0].type.name.capitalized
//
//        let spriteURL = pokemonData[indexPath.row].sprites.front_default
//        do {
//            let url = URL(string: spriteURL)
//            let data = try Data(contentsOf: url!)
//            cell.pokemonSprite.image = UIImage(data: data)
//        }
//        catch{
//            print(error)
//        }
//
//        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            if indexPath.section == 0 {
                return 69 //Item Cell height
            } else {
                return 55 //Loading Cell height
            }
        }
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
            let offsetY = scrollView.contentOffset.y
            let contentHeight = scrollView.contentSize.height

        if (offsetY > contentHeight - scrollView.frame.height * 4) && !self.isLoading {
                loadMoreData()
            }
        }
    
    func loadMoreData() {
            if !self.isLoading {
                self.isLoading = true
                DispatchQueue.global().async {
                    // Fake background loading task for 2 seconds
                    sleep(2)
                    
                    if(self.pokemonData.count <= 120){
                        self.fetchPokemonData(offset: self.pokemonData.count)
                        DispatchQueue.main.async {
                            self.tableView.reloadData()
                            self.isLoading = false
                        }
                    }
                }
            }
        }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        performSegue(withIdentifier: "detailSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DetailViewController{
            destination.pokemonData = pokemonData[(tableView.indexPathForSelectedRow?.row)!]
        }
    }
}

