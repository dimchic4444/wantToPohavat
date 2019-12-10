//
//  GlobalValues.swift
//  Want To Pohavat
//
//  Created by Дмитрий Гришин on 05/12/2019.
//  Copyright © 2019 Дмитрий Гришин. All rights reserved.
//

import Foundation
import UIKit
import CoreData


let apiKey = "AIzaSyBP3Nis_VTkIv_rgavtwYj3RC7LbHutLVA"
var recipesDataBaseLink: String {
    return "https://want-to-pohavat.firebaseio.com/.json?avvrdd_token=\(apiKey)"
}
var versionLink: String {
    return "https://want-to-pohavat.firebaseio.com/version.json?avvrdd_token=\(apiKey)"
}
var listOfRecipes: [Recipe] = []
let imagesLink = "http://176.119.157.57/sber/"
var concurrentQueue = DispatchQueue(label: "concurentQueue")

//Core Data
var savedImages: [recipeImage] = []
var fetchedResultsControllerImage: NSFetchedResultsController<MOImage> = {
    let controller = CoreDataManager.shared.getFetchedResultsControllerImage()
    return controller
}()
var fetchedResultsControllerDataBase: NSFetchedResultsController<MODataBase> = {
    let controller = CoreDataManager.shared.getFetchedResultsControllerDataBase()
    return controller
}()
