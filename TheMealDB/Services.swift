//
//  Services.swift
//  TheMealDB
//
//  Created by Rachel Lecesne on 11/12/23.
//

import Foundation
import SwiftUI


class Service: NSObject {
    
    static let service = Service()
    var errMessageDesserts: String = ""
    var errMessageRecipe: String = ""
    
    // Func to use api to get list of meals from Dessert category
    //
    // Returns
    // [Meal]? : Optional list of meals
    // Error? : error recieived if applicable
    func fetchDesserts(completion: @escaping ([Meal]?, Error?) -> ()) {
            let urlString = "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert"
            // check if valid URL
            guard let url = URL(string: urlString) else { return }
        
            URLSession.shared.dataTask(with: url) { (data, resp, err) in
                if let err = err {
                    completion(nil, err)
                    self.errMessageDesserts = "Failed to fetch desserts"
                    print("Failed to fetch desserts:", err)
                    return
                }
                // validate return
                guard let data = data else {return }
                
                // decode json
                do {
                    let category = try JSONDecoder().decode(Category.self, from: data)
                    let meals = category.meals
                    DispatchQueue.main.async {
                        completion(meals, nil)
                    }
                } catch let jsonErr {
                    self.errMessageDesserts = "Failed to fetch desserts"
                    print("Failed to decode:", jsonErr)
                }
                }.resume()
    }
    
    // Func to fetch recipe given a meal id
    //
    // Parameters
    // id : meal ID
    //
    // Returns
    // [Recipe]? : Optional list of recipes for given meal id
    // Error? : error recieived if applicable
    func fetchRecipe(id: String, completion: @escaping ([Recipe]?, Error?) -> ()) {
            
            let urlString = "https://themealdb.com/api/json/v1/1/lookup.php?i=\(id)"
        
            // check if we have a valid url with the given id
            guard let url = URL(string: urlString) else { return }
        
            URLSession.shared.dataTask(with: url) { (data, resp, err) in
                if let err = err {
                    completion(nil, err)
                    self.errMessageRecipe = "Failed to fetch recipes"
                    print("Failed to fetch recipes:", err)
                    return
                }
    
                // validate return
                guard let data = data else { return }
                
                //decode json
                do {
                    let category = try JSONDecoder().decode(RecipeCategory.self, from: data)
                    let recipes = category.meals
                    
                    DispatchQueue.main.async {
                        completion(recipes, nil)
                    }
                } catch let jsonErr {
                    self.errMessageRecipe = "Failed to fetch recipes"
                    print("Failed to decode:", jsonErr)
                }
                }.resume()
    }
    
    // Func to load a UIImage given an URL
    //
    // Parameters
    // urString: URL of image
    //
    // returns
    // UIImage? : image if found
    // Error? : error recieived if applicable
    func loadImageFromURL(urlString: String, completion: @escaping (UIImage?, Error?) -> ()) {
            // check if we got a valid url
            guard let url = URL(string: urlString) else { return }

            URLSession.shared.dataTask(with: url) { data, response, error in
                guard error == nil else {
                    print(error ?? "unknown error")
                    return
                }
                // validate data recieved
                guard let data = data else { return }
                guard let loadedImage = UIImage(data: data) else { return }
                
                let image = loadedImage
                
                DispatchQueue.main.async {
                    completion(image, nil)
                }
            }.resume()
        }
    
}
