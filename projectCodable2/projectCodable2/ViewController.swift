//
//  ViewController.swift
//  projectCodable2
//
//  Created by Consultant on 3/2/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var heroes = [Hero]()
    let userDefaults = UserDefaults.standard
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        if UserDefaults.standard.bool(forKey: "UserLoggedIn") == false {
            let favoriteArray = [
                false,
                false,
                false,
                false,
                false,
                false,
                false,
                false,
                false,
                false,
                false,
                false,
                false,
                false,
                false,
                false,
                false,
                false,
                false,
                false,
                false,
                false,
                false,
                false,
                false,
                false,
                false,
                false,
                false,
                false,
                false,
                false,
                false,
                false,
                false,
                false,
                false,
                false,
                false,
                false,
                false,
                false,
                false,
                false,
                false,
                false,
                false,
                false,
                false,
                false,
                false,
                false,
                false,
                false,
                false,
            false,
            false,
            false,
            false,
            false,
            false,
            false,
            false,
            false,
            false,
            false,
            false,
            false,
            false,
            false,
            false,
            false,
            false,
            false,
            false,
            false,
            false,
            false,
            false,
            false,
            false,
            false,
            false,
            false,
            false,
            false,
            false,
            false,
            false,
            false,
            false,
            false,
            false,
            false,
            false,
            false,
            false,
            false,
            false,
            false,
            false,
            false,
            false,
            false,
            false,
            false,
            false,
            false,
            false,
            false,
            false,
            false,
                false,
                false,
                false,
                false,
                false,
                false,
                false,
                false,
                false,
                false,
                false,
                false,
                false,
                false,
                false,
                false
            ]
            userDefaults.set(favoriteArray, forKey: "isFavorite")
        }
        let isFavoriteArray = userDefaults.object(forKey: "isFavorite") as? [Bool]
        userDefaults.set(isFavoriteArray, forKey: "isFavorite")
        
    }
    
    func setupTableView(){
        fetchJson {
            self.tableView.reloadData()
        }
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    /*
     
     A closure is said to escape a function when the closure is passed as an arggument to the function, but is called after the function returns. Escaping closures outlive the function it was passed into
     
     */
    
    func fetchJson(completed: @escaping () -> ()){
        
        guard let url = URL(string: "https://api.opendota.com/api/heroStats") else {print("Bad URL"); return}
        
        let session = URLSession.shared
        let task = session.dataTask(with: url){data, response, error in
            
            guard error == nil else {
                print("Error: \(error?.localizedDescription ?? "Something strange happened")")
                return
            }
            
            guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
                print("Server Error!")
                return
            }
            
            guard data != nil else{
                print("Error: We have no data bub")
                return
            }
            
            do{
                //  Instead of first needing to serialize the json with JSONSerialization class associated function we can instead let the instance of our array of heroes hold the decoded data directly. As of Swift 4.0 no more manual serialization
                self.heroes = try JSONDecoder().decode([Hero].self, from: data!)
                
                DispatchQueue.main.async {
                    // Here we call the closure to indicate this is where the result of the fetch should be
                    completed()
                }
                
            }catch{
                print("Error: \(error.localizedDescription)")
            }
        }
        task.resume()
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return heroes.count
        
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! heroCustomCell?
        
        let isFavoriteArray = userDefaults.object(forKey: "isFavorite") as? [Bool]
        
        if isFavoriteArray?[indexPath.row] == true{
            
            let heroIcon = UIImage(systemName: "star.fill")
            cell?.favButton.setImage(heroIcon, for: .normal)
            
        }else{
            
            let heroIcon = UIImage(systemName: "star")
            cell?.favButton.setImage(heroIcon, for: .normal)
            
        }
        
//        if UserDefaults.standard.bool(forKey: "isFavorite") == true {
//            
//            let heroIcon = UIImage(systemName: "star.fill")
//            cell?.favButton.setImage(heroIcon, for: .normal)
//            
//        }else{
//            
//            let heroIcon = UIImage(systemName: "star")
//            cell?.favButton.setImage(heroIcon, for: .normal)
//            
//        }
        
        cell?.heroName.text = heroes[indexPath.row].name.capitalized
        
//        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
//        cell.textLabel?.text = heroes[indexPath.row].name.capitalized
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        
        performSegue(withIdentifier: "detailSegue", sender: self)
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DecodeViewController {
            destination.hero = heroes[(tableView.indexPathForSelectedRow?.row)!]
        }
    }
}

