//
//  DessertView.swift
//  TheMealDB
//
//  Created by Rachel Lecesne on 11/12/23.
//

import SwiftUI

struct DessertView: View {
    @State private var meals: [Meal] = []
    @State var showingDetail = false

    var body: some View {
        
//        // in case info doesn't load for whatever reason
//       Text(Service.service.errMessageDesserts)
//            .padding()
//            .foregroundColor(.red)
        
        // Present list of meals that will open the
        // corresponding meal page when selected
        List(meals, id: \.id) { meal in
            VStack(alignment: .leading) {
                Button(action: {
                            self.showingDetail.toggle()
                        }) {
                    Text(meal.title)
                        }.sheet(isPresented: $showingDetail) {
                            MealView(id: meal.id)
                        }
            }
        }
        .onAppear {
            fetchDesserts()
        }
    }
    
    // Func to grab list of dessert meals using Service
    private func fetchDesserts() {
        Service.service.fetchDesserts() { (meals, err) in
            if let err = err {
                print("Failed to fetch courses:", err)
                return
            }
                    
            self.meals = meals ?? []
        }
    }
}

struct DessertView_Previews: PreviewProvider {
    static var previews: some View {
        DessertView()
    }
}
