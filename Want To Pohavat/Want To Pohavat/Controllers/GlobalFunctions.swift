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
            getAllImagesFromCoreData()
            return true
        } else {
            //Делаем действия как будто базы данных на устройстве нет или она устарела
            if let codableData = downloadDataBase() {
                if (parseDataBase(codableData: codableData)) {
                    //Выполняем действия, в случае когда база данных только что скачана и парсинг прошел успешно
                    removeAllInformationFromCoreData()
                    downloadAllImagesFromRecipesAndPushToCoreDataAndAddToLocaleStore() //Скачиваем все картинки и кидаем в Core Data и заполняем локальный массив
                    return true
                } else {return false}
            } else {return false}
        }

    }
    static func downloadDataBase() -> Data? {
        var returnData = try? Data(contentsOf: URL(string: recipesDataBaseLink)!)
        return returnData
    }
    
    static func loadImage(stringUrl: String) -> UIImage? { //Загружает картинку, если ошибка вернет nil
        if let url = URL(string: "\(imagesLink)\(stringUrl)") {
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    return image
                }
            }
        }
        return nil
    }
    
    static func getImage(nameOfImage: String) -> UIImage? {//Ищет картинку на устройстве, если не находит вернет nil
        var returnImage: UIImage?
        for i in 0...savedImages.count - 1
        {
            if savedImages[i].nameOfImage == nameOfImage {
                returnImage = savedImages[i].image
            }
        }
        return returnImage
    }
    static private func checkVersionOfDataBase() -> Bool {// Функция проверяет версию базы данных на сервере
        if let data = try? Data(contentsOf: URL(string: versionLink)!) {
            if let stringVersion = String(data: data, encoding: .utf8) {
                if let version = Int(stringVersion) {
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
    static func getSubCategories() -> [String] { //функция возвразщает список подкатегорий
        var subCategories: [String] = []
        for i in listOfRecipes {
            if (!subCategories.contains(i.nameOfSubCategory)) {
                subCategories.append(i.nameOfSubCategory)
            }
        }
        return subCategories
    }
    static func getDifferentIngridients() -> [String] {//Функция возвращает список всех ингридиентов найденых в рецептах
        var differentIngridients: [String] = []
        for i in listOfRecipes {
            for j in i.ingredients {
                if (!differentIngridients.contains(j.nameOfIngredient)) {
                    differentIngridients.append(j.nameOfIngredient)
                }
            }
        }
        return differentIngridients
    }
    static func getRecipesWithIngridients(ingridients: [String]) -> [Recipe] {//Функция ищет рецепты, в которых есть выбранные ингридиенты, поиск осуществляется по всем рецептам!
        var recipes: [Recipe] = []
        var headerRecipes: [String] = []
        for i in ingridients {
            for j in listOfRecipes {
                for z in j.ingredients {
                    if z.nameOfIngredient == i {
                        if (!headerRecipes.contains(j.nameOfRecipe)) {//Не знаю как проверить имеется ли элемент в массиве recipe, поэтому использую дополнительный массив string с названиями рецептов
                            headerRecipes.append(j.nameOfRecipe)
                            recipes.append(j)
                        }
                    }
                }
            }
        }
        return recipes
    }
    
    //Функции для работы с CoreData
    static func pushToCoreData(name: String, image: UIImage) {//Закинуть картинку в Core Data
        if let dataImage = image.pngData() {
            CoreDataManager.shared.saveImage(name: name, image: dataImage)
            print("\(name) was pushed to coreData")
        }
    }
    static func getAllImagesFromCoreData() -> Bool {//Получить все картинки из Core Data
        if let fetchedResults = fetchedResultsControllerImage.fetchedObjects {
            print(fetchedResults.count)
            savedImages = []
//            По непонятной мне причине, в случае отсутствия картинок в core data и вызове данного метода вылетает приложение. Судя по ошибке, типо выход за пределы массива. Но если в fetchedResults 0 элементов, каким образом может вообще пойти иттерация цикла?!
            for i in fetchedResults {
                if let imageForSave = UIImage(data: i.image) {
                    savedImages.append(recipeImage(nameOfImage: i.name, image: imageForSave))
                    print("\(i.name) was get from core data")
                }
            }
            return true
        } else {return false}
    }
    static func downloadAllImagesFromRecipesAndPushToCoreDataAndAddToLocaleStore() -> Bool {//Скачивает изображения всех рецептов из интернета из заносит их в Core Data а также в локальный массив saveImages
//        Данная функция изначально занималась только тем, что отправляла картинки на сохранение в core data. Однако я заметил, что когда я считываю картинки из core data, после того как только что их туда сохранил, то 1-2 последних картинки я не могу прочитать. После дебаггинга понял, что метод performBackgroundTask выполняет свою задачу не сразу, а ассинхронно отправляет на свою внутреннюю очередь. Поэтому сразу читать из только что записанной core dat'ы у меня не получилось
        for i in listOfRecipes {
            if let downloadedImage = loadImage(stringUrl: i.nameOfPicture) {
                print("\(i.nameOfPicture) was downloaded")
                pushToCoreData(name: i.nameOfPicture, image: downloadedImage)
                savedImages.append(recipeImage(nameOfImage: i.nameOfPicture, image: downloadedImage))
            }
        }
        return true
    }
    static func removeAllInformationFromCoreData() {//Функция удаляет базу данных и все картинки хранящиеся на устройстве
        CoreDataManager.shared.deleteImagesFromCoreData()
    }
//    static func getDataBaseJSONFromCoreData() -> Data? {
//
//    }

    
}
