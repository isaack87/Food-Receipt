//
//  RecipeDetailView.swift
//  Recipe List App
//
//  Created by Isaac Kim on 3/18/23.
//

import SwiftUI

struct RecipeDetailView: View {
    
    var recipe:Recipe
    
    @State var selectedServingSize = 6
    
    var body: some View {
        ScrollView {
            VStack (alignment: .leading) {
                
                // MARK: IMages
                Image(recipe.image)
                    .resizable().scaledToFit()
                VStack(alignment: .leading) {
                    
                // MARK: Recipe Title
                    
                    Text(recipe.name)
                        .bold()
                        .padding(.top, 20)
                        .padding(.leading)
                        .font(.largeTitle)
                    
                // MARK: Serving Size Picker
                    VStack(alignment: .leading) {
                        Text("Select your serving size")
                        Picker( "", selection: $selectedServingSize) {
                              Text("2").tag(2)
                              Text("4").tag(4)
                              Text("6").tag(6)
                              Text("8").tag(8)
                        }.pickerStyle(SegmentedPickerStyle())
                            .frame(width:160)
                    }


                // MARK: ingrediants
                    Text("Ingredients").font(.headline).padding(.bottom, 10)
                    ForEach (recipe.ingredients) { r in
                        // we have access to RecipeMOdel because we passed it in as a enviroment in tabview
                        Text("•" + RecipeModel.getPortion(ingredient: r, recipeServings: recipe.servings, targetServings: selectedServingSize) + " " + r.name.lowercased()).padding(.bottom, 1)
                    }
                }.padding(.horizontal)
                // MARK: instructions
                VStack(alignment: .leading) {
                    Text("Directions")
                        .font(.headline)
                        .padding([.bottom, .top], 5)
                    ForEach (0..<recipe.directions.count, id: \.self) { index in
                        Text(String(index+1) + ". " + recipe.directions[index]).padding(.bottom, 5)
                    }
                }.padding(.horizontal)
            }
        }
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        
        // create a dummy recipe and pass it into the detail view so that we can see a preview for test
        
        let model = RecipeModel()
        
        RecipeDetailView(recipe: model.recipes[0])
    }
}
