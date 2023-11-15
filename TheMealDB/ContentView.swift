//
//  ContentView.swift
//  TheMealDB
//
//  Created by Rachel Lecesne on 11/11/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeView()
                    .tabItem {
                        Label("Home",systemImage: "star.fill")
                    }
            DessertView()
                .tabItem {
                    Label("Desserts",systemImage: "star.fill")
                    }
            FindMealByIDView()
                .tabItem {
                    Label("Find Meal By ID",systemImage: "star.fill")
                    }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
