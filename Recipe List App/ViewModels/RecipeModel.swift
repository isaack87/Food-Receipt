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
    
    
    // can call with static without creating instance of recipemodel
    // since we have envirmental attached as instance of REcipeModel() line 33 in REcipeTabView
    // we can now call RecipeModel.getPortion in receipdetailview line 43
    
    // if this wasnt a static method we just add @EnvironmentObject var model:RecipeModel in recipedetailview and call it normally
    
    static func getPortion(ingredient:Ingredient, recipeServings:Int, targetServings:Int) -> String {
        
        var portion = ""
        var numerator = ingredient.num ?? 1
        var denominator = ingredient.denom ?? 1
        var wholePortions = 0
        
        if (ingredient.num != nil) {
            
            // get single serving size by multiplying denom by recipe servings
            denominator *= recipeServings
            // get target protion by multiplying num by target serving
            numerator *= targetServings
            // reduce fraction by greatest ommon divisor
            let divisor = Rational.greatestCommonDivisor(numerator, denominator)
            numerator /= divisor
            denominator /= divisor
            
            // get the whole portion if num > demon
            if numerator >= denominator {
                wholePortions = numerator / denominator
                numerator = numerator % denominator
                
                portion += String(wholePortions)
            }
            // express remainder as fraction
            if (numerator > 0) {
                    // add space if  greater than 0
                portion += wholePortions > 0 ? " " : ""
                    portion += "\(numerator)/\(denominator)"
            }
            
            if let unit = ingredient.unit {
                // calculate and this unwraps option and sets to unit
                
                portion += ingredient.num == nil && ingredient.denom == nil ? "" : " "
                return portion + unit
            }
        }
        return portion
    }

    
}
