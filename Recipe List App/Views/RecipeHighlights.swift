//
//  RecipeHighlights.swift
//  Recipe List App
//
//  Created by Isaac Kim on 3/23/23.
//

import SwiftUI

struct RecipeHighlights: View {
    
    var allHighlights = ""
    
    init (highlights:[String]) {
        // loop through array and build stirng
        for index in 0..<highlights.count {
            
            //if this is last item, dont add a comma
            if index == highlights.count-1 {
                allHighlights += highlights[index]
            } else {
                allHighlights += highlights[index] + ", "
            }
        }
    }
    
    var body: some View {
        Text(allHighlights)
    }
}

struct RecipeHighlights_Previews: PreviewProvider {
    static var previews: some View {
        RecipeHighlights(highlights: ["test1", "test2", "test3"])
    }
}
