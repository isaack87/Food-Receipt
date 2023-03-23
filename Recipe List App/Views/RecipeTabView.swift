//
//  RecipeTabView.swift
//  Recipe List App
//
//  Created by Isaac Kim on 3/20/23.
//

import SwiftUI

struct RecipeTabView: View {
    
    var body: some View {
       
        TabView {
            
            RecipeFeaturedView()
                .tabItem {
                    VStack {
                        Image(systemName: "star.fill")
                        Text("Featured")
                    }
                }
            
            RecipeListView()
                .tabItem {
                    VStack {
                        Image(systemName: "list.bullet")
                        Text("List")
                    }
                }
        }
        // this line allows us to pass the data from line 12 all down the view hierachy
        .environmentObject(RecipeModel())
    }
}

struct RecipeTabView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeTabView()
    }
}
