//
//  Recipe_List_AppApp.swift
//  Recipe List App
//
//  Created by Isaac Kim on 3/16/23.
//

import SwiftUI

@main
struct Recipe_List_AppApp: App {
    var body: some Scene {
        WindowGroup {
            //starting point of app / this is first screen that is shown when app starts
            RecipeTabView()
        }
    }
}
