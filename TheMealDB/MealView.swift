//
//  MealView.swift
//  TheMealDB
//
//  Created by Rachel Lecesne on 11/12/23.
//

import SwiftUI

struct MealView: View {
    @State  var id: String
    @State  private var meals: [Recipe] = []
    @State  private var ingredientStr: String = ""
    @State  private var image: UIImage = UIImage()
    @State  private var errMessage: String = "Failed to fetch recipe. Please try again or choose a new recipe."
    
    var body: some View {
        
        // in case info doesn't load for whatever reason
        Text(Service.service.errMessageRecipe)
            .padding()
            .foregroundColor(.red)
        
        // Create page with meal name, id, image, instructions,
        // and ingredients
        List(meals, id: \.idMeal) { meal in
            VStack(alignment: .center) {
                Text("\n" + meal.strMeal).bold()
                Text("ID: " + meal.idMeal)
                
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(10)
                
                Text("\nInstructions:").bold()
                Text(meal.strInstructions)
                
                Text("\nIngredients:").bold()
                Text(ingredientStr)
                
            }
        }
        .onAppear {
            fetchRecipe()
        }
    }
    
    // Func to grab the recipe using Service
    private func fetchRecipe() {
        Service.service.fetchRecipe(id: id) { (meals, err) in
            if let err = err {
                print("Failed to fetch recipe:", err)
                return
            }
            self.meals = meals ?? []
            errMessage = ""
            fetchIngredients()
            fetchImage()
        }
    }
    
    // Func to format the ingredients
    private func fetchIngredients() {
        var ingredients: [String] = []
        for meal in meals {
            ingredients.append(meal.strMeasure1)
            ingredients.append(meal.strIngredient1)
            ingredients.append(meal.strMeasure2)
            ingredients.append(meal.strIngredient2)
            ingredients.append(meal.strMeasure3)
            ingredients.append(meal.strIngredient3)
            ingredients.append(meal.strMeasure4)
            ingredients.append(meal.strIngredient4)
            ingredients.append(meal.strMeasure5)
            ingredients.append(meal.strIngredient5)
            ingredients.append(meal.strMeasure6)
            ingredients.append(meal.strIngredient6)
            ingredients.append(meal.strMeasure7)
            ingredients.append(meal.strIngredient7)
            ingredients.append(meal.strMeasure8)
            ingredients.append(meal.strIngredient8)
            ingredients.append(meal.strMeasure9)
            ingredients.append(meal.strIngredient9)
            ingredients.append(meal.strMeasure10)
            ingredients.append(meal.strIngredient10)
            ingredients.append(meal.strMeasure11)
            ingredients.append(meal.strIngredient11)
            ingredients.append(meal.strMeasure12)
            ingredients.append(meal.strIngredient12)
            ingredients.append(meal.strMeasure13)
            ingredients.append(meal.strIngredient13)
            ingredients.append(meal.strMeasure14)
            ingredients.append(meal.strIngredient14)
            ingredients.append(meal.strMeasure15)
            ingredients.append(meal.strIngredient15)
            ingredients.append(meal.strMeasure16)
            ingredients.append(meal.strIngredient16)
            ingredients.append(meal.strMeasure17)
            ingredients.append(meal.strIngredient17)
            ingredients.append(meal.strMeasure18)
            ingredients.append(meal.strIngredient18)
            ingredients.append(meal.strMeasure19)
            ingredients.append(meal.strIngredient19)
            ingredients.append(meal.strMeasure20)
            ingredients.append(meal.strIngredient20)
        }
        // get rid of any empty values
        ingredients.removeAll(where: {$0 == ""} )
        
        // populate a string of ingredients which we can present to user
        var index = 0
        for i in ingredients {
            if index < ingredients.count - 1 {
                 if index%2 != 0 {
                    self.ingredientStr += i + "\n"
                 } else {
                    self.ingredientStr += i + " of "
                 }
            } else {
                self.ingredientStr += i
            }
            index += 1
        }
    }
    
    // Func to grab meal image from Service
    private func fetchImage() {
        Service.service.loadImageFromURL(urlString: meals[0].strMealThumb) { (image, err) in
            if let err = err {
                print("Failed to fetch image:", err)
                return
            }
            self.image = image ?? UIImage()
        }
    }
    

struct MealView_Previews: PreviewProvider {
    static var previews: some View {
        MealView(id: "12345")
    }
}
}
