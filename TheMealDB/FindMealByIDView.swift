//
//  FindMealByIDView.swift
//  TheMealDB
//
//  Created by Rachel Lecesne on 11/11/23.
//

import SwiftUI

struct FindMealByIDView: View {
    
    @State private var input: String = ""
    @State private var errMessage: String = ""
    @State var showingDetail = false
    
    var body: some View {
        VStack(alignment: .leading) {
            
            // User instructions
            Text("Enter a five digit meal ID below to fetch a recipe.").padding()
            
            // error message if input is not valid
            Text(errMessage).padding().foregroundColor(.red)
            
            // text filed to enter meal id
            TextField("ENTER MEAL ID", text: $input)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            // Submit button
            Button(action: {
                        self.verifyInput()
            }) {
                Text("Submit")
                    .padding()
                    .accentColor(.blue)
                }.sheet(isPresented: $showingDetail) {
                    MealView(id: input)
                }
            }
        }
    
    // Func to determine if input is valid. If not, show err message
    private func verifyInput() {
        if Double(input) == nil || input.count != 5 {
            errMessage = "err: must be a five digit number"
        
        } else {
            errMessage = ""
            showingDetail = true
        }
    }
}

struct FindMealByIDView_Previews: PreviewProvider {
    static var previews: some View {
        FindMealByIDView()
    }
}
