//
//  RecipeDetailView.swift
//  Recipe List App
//
//  Created by Isaac Kim on 3/18/23.
//

import SwiftUI

struct RecipeDetailView: View {
    
    var recipe:Recipe
    
    var body: some View {
        ScrollView {
            VStack (alignment: .leading) {
                // MARK: IMages
                Image(recipe.image)
                    .resizable().scaledToFit()
                VStack(alignment: .leading) {

                // MARK: ingrediants
                    Text("Ingredients").font(.headline).padding(.bottom, 10)
                    ForEach (recipe.ingredients, id: \.self) { r in
                        Text("•" + r).padding(.bottom, 1)
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
            .navigationBarTitle(recipe.name)
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
