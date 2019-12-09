//
//  RecipesList.swift
//  Want To Pohavat
//
//  Created by Дмитрий Гришин on 06/12/2019.
//  Copyright © 2019 Дмитрий Гришин. All rights reserved.
//

import UIKit

class RecipesList: UIViewController {
    let tableViewRecipes = UITableView()


    override func viewDidLoad() {
        super.viewDidLoad()
        let safeArea = view.safeAreaLayoutGuide
        view.backgroundColor = .white
        tableViewRecipes.frame = view.frame
        tableViewRecipes.delegate = self
        tableViewRecipes.dataSource = self
        self.title = "Список рецептов"
        tableViewRecipes.rowHeight = 200 //Высота ячейки всегда постоянная
        view.addSubview(tableViewRecipes)
        tableViewRecipes.register(RecipesListCellTableViewCell.self, forCellReuseIdentifier: RecipesListCellTableViewCell.reusedId)
    }
    



}

extension RecipesList: UITableViewDelegate
{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = ShowRecipeVC()
        vc.initialRecipe(recipe: listOfRecipes[indexPath.row])
        navigationController?.pushViewController(vc, animated: true)
        tableViewRecipes.deselectRow(at: indexPath, animated: true)
        
    }
}

extension RecipesList: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listOfRecipes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: RecipesListCellTableViewCell.reusedId, for: indexPath) as! RecipesListCellTableViewCell
        let word = listOfRecipes[indexPath.row].nameOfRecipe
        cell.headerLabel.text = word
        var imageForCell: UIImage?
        concurrentQueue.async {
            if let image = GlobalFunctions.loadImage(stringUrl: "\(imagesLink)\(listOfRecipes[indexPath.row].nameOfPicture)") {
                imageForCell = image
            }
            if ((imageForCell) != nil) {
                DispatchQueue.main.async {
                    cell.recipeImage.image = imageForCell
                }
            }
        }
        cell.ccalsLabel.text = "\(listOfRecipes[indexPath.row].countCCalIn100Gram) ккал"
        cell.portionsLabel.text = "\(listOfRecipes[indexPath.row].countOfPortion) порции"
        cell.timeLabel.text = "\(listOfRecipes[indexPath.row].timeOfCooking) мин"
        
        
        
//        cell.setNeedsLayout()
//        cell.layoutIfNeeded()
        return cell
    }
}
