//
//  GlobalFunctions.swift
//  Want To Pohavat
//
//  Created by Дмитрий Гришин on 05/12/2019.
//  Copyright © 2019 Дмитрий Гришин. All rights reserved.
//

import Foundation
import UIKit
class GlobalFunctions {
    static func loadListOfRecipes() -> Bool { //Инициализирует список всех рецептов в приложении
        if (checkVersionOfDataBase()) {
            print("Версия проверена")
            //Делаем действия в случае если база данных есть на устройстве
            return true
        } else {
            //Делаем действия как будто базы данных на устройстве нет или она устарела
            if let codableData = try? Data(contentsOf: URL(string: recipesDataBaseLink)!) {
                if (parseDataBase(codableData: codableData)) {
                    return true
                } else {return false}
            } else {return false}
        }

    }
    
    static func loadImage(stringUrl: String) -> UIImage? { //Загружает картинку, если ошибка вернет nil
        if let url = URL(string: stringUrl) {
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    return image
                }
            }
        }
        return nil
    }
    static private func checkVersionOfDataBase() -> Bool {// Функция проверяет версию базы данных
        if let data = try? Data(contentsOf: URL(string: versionLink)!) {
            if let stringVersion = String(data: data, encoding: .utf8) {
                if let version = Int(stringVersion) {
//                    print(version)
                    return false
                    //Сравниваем версию с userDefaults
                    //Если на устройстве загружена база и она актуально возвращаем true
                    //Если на устройстве отсутсвует база или ее версия устарела - false
                }
            }
        }
        return false
    }
    static private func parseDataBase(codableData: Data) -> Bool { //Функция получает decodable data и парсит JSON, если получилось распарсить - true, иначе false
        if let arrayOfRecipesNew: RecipeDTOResponse = try? JSONDecoder().decode(RecipeDTOResponse.self, from: codableData) {
//            print("Получили JSON - парсим")
            for recipe in arrayOfRecipesNew.items
            {
                var ingridientsTemp: [Ingredient] = []
                for ingridient in recipe.ingredients
                {
                    ingridientsTemp.append(Ingredient(isCalculating: ingridient.isCalculating, countOf: ingridient.countOf, nameOfMeasure: ingridient.nameOfMeasure, nameOfIngredient: ingridient.nameOfIngredient))
                }
                listOfRecipes.append(Recipe(nameOfRecipe: recipe.nameOfRecipe, ingredients: ingridientsTemp, instruction: recipe.instruction, timeOfCooking: recipe.timeOfCooking, countOfPortion: recipe.countOfPortion, countCCalIn100Gram: recipe.countCCalIn100Gram, nameOfCategory: recipe.nameOfCategory, nameOfSubCategory: recipe.nameOfSubCategory, nameOfPicture: recipe.nameOfPicture))
            }
            return true
        } else {return false}
    }
}
