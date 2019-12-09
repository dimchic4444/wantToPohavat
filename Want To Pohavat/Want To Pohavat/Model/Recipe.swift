
//  Want To Pohavat
//
//  Created by Дмитрий Гришин on 05/12/2019.
//  Copyright © 2019 Дмитрий Гришин. All rights reserved.
//

import Foundation

class Recipe {
    var nameOfRecipe: String = ""
    var ingredients = [Ingredient]()
    var instruction = [String]()
    var timeOfCooking: Int = 0
    var countOfPortion: Int = 0
    var countCCalIn100Gram: Int = 0
    var nameOfCategory: String = ""
    var nameOfSubCategory: String = ""
    var nameOfPicture: String = ""
    init(nameOfRecipe: String, ingredients: [Ingredient], instruction: [String], timeOfCooking: Int, countOfPortion: Int, countCCalIn100Gram: Int, nameOfCategory: String, nameOfSubCategory: String, nameOfPicture: String) {
        self.nameOfRecipe = nameOfRecipe
        self.ingredients = ingredients
        self.instruction = instruction
        self.timeOfCooking = timeOfCooking
        self.countOfPortion = countOfPortion
        self.countCCalIn100Gram = countCCalIn100Gram
        self.nameOfCategory = nameOfCategory
        self.nameOfSubCategory = nameOfSubCategory
        self.nameOfPicture = nameOfPicture
    }
}

class Ingredient {
    var isCalculating: Bool = false
    var countOf: Double = 0.0
    var nameOfMeasure: String = ""
    var nameOfIngredient: String = ""
    init(isCalculating: Bool, countOf: Double, nameOfMeasure: String, nameOfIngredient: String) {
        self.isCalculating = isCalculating
        self.countOf = countOf
        self.nameOfMeasure = nameOfMeasure
        self.nameOfIngredient = nameOfIngredient
    }
}


struct RecipeDTO: Codable {
    var nameOfRecipe: String
    var ingredients: [IngredientDTO]
    var instruction: [String]
    var timeOfCooking: Int
    var countOfPortion: Int
    var countCCalIn100Gram: Int
    var nameOfCategory: String
    var nameOfSubCategory: String
    var nameOfPicture: String = ""
}

struct IngredientDTO: Codable {
    var isCalculating: Bool
    var countOf: Double
    var nameOfMeasure: String
    var nameOfIngredient: String
}

struct  RecipeDTOResponse: Codable {
    enum CodingKeys: String, CodingKey {
        case items
    }
    let items: [RecipeDTO]
}
