//
//  Extension+URLSessionRequest.swift
//  pokedexV3
//
//  Created by Consultant on 3/5/22.
//

import Foundation

extension URLSession {
    
    func getRequest<T:Codable>(url: URL?, decoding: T.Type, completion: @escaping(Result <T, Error>) ->()){
        
        guard let url = url else {
            completion(.failure(RequestErrors.badURL))
            return
        }
        
        let task = self.dataTask(with: url){
            data, _, error in
            
            guard data != nil else{
                completion(.failure(RequestErrors.badData))
                return}
            
            if let error = error {
                completion(.failure(error))
                return
            }
            
            do{
                let jsonResult = try JSONDecoder().decode(decoding, from: data!)
                completion(.success(jsonResult))
            }catch{
                completion(.failure(error))
            }
        }
        task.resume()
    }
}
