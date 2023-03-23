//
//  DataService.swift
//  Recipe List App
//
//  Created by Isaac Kim on 3/16/23.
//

import Foundation

class DataService {
    
    
    // turns it into a type method, when you turn it to type method u dont have to create instance to call the method
    static func getLocalData() -> [Recipe] {
        
        //parse local json file
        let pathString = Bundle.main.path(forResource: "recipes", ofType: "json")
        
        // check if path string is not nil otherwise do this
        guard pathString != nil else {
            return [Recipe]()
        }
        
        //get url path to json file
        let url = URL(fileURLWithPath: pathString!)
        
        //  create a url object
        do {
            // create a data object
            let  data = try Data(contentsOf: url)
            
            // decode data with json decoder
            let decorder = JSONDecoder()
            
            do {
                let recipeData = try decorder.decode([Recipe].self, from: data)
                
                // add inique IDS
                for r in recipeData {
                    r.id = UUID()
                  
                    // adding unique IDS to recipe ingredients
                    for i in r.ingredients {
                        i.id = UUID()
                    }
                    
                }
                
                //return after
                return recipeData
            } catch {
                print(error)
            }
        } catch {
            print(error)
        }
        return [Recipe]()
    }
}
