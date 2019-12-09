//
//  GlobalValues.swift
//  Want To Pohavat
//
//  Created by Дмитрий Гришин on 05/12/2019.
//  Copyright © 2019 Дмитрий Гришин. All rights reserved.
//

import Foundation

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
