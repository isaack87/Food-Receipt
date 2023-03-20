//
//  RecipeModel.swift
//  Recipe List App
//
//  Created by Isaac Kim on 3/16/23.
//

import Foundation

class RecipeModel: ObservableObject {
    
    @Published var recipes = [Recipe]()
    
    init () {
        // getting data and setting it to line 12
        self.recipes = DataService.getLocalData()
    }
    
}
