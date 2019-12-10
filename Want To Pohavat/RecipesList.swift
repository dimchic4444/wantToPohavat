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
    var localListOfRecipes: [Recipe] = []

     init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?, recipeList: [Recipe]) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.localListOfRecipes = recipeList
        self.tabBarItem = UITabBarItem(title: "Рецепты", image: UIImage(named: "recipes"), selectedImage: UIImage(named: "recipes"))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
        vc.initialRecipe(recipe: localListOfRecipes[indexPath.row])
        navigationController?.pushViewController(vc, animated: true)
        tableViewRecipes.deselectRow(at: indexPath, animated: true)
        
    }
}

extension RecipesList: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return localListOfRecipes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: RecipesListCellTableViewCell.reusedId, for: indexPath) as! RecipesListCellTableViewCell
        let word = localListOfRecipes[indexPath.row].nameOfRecipe
        cell.headerLabel.text = word
        var imageForCell: UIImage?
        concurrentQueue.async {
            if let image = GlobalFunctions.getImage(nameOfImage: "\(self.localListOfRecipes[indexPath.row].nameOfPicture)") {
                imageForCell = image
            }
            if ((imageForCell) != nil) {
                DispatchQueue.main.async {
                    cell.recipeImage.image = imageForCell
                }
            }
        }
        cell.ccalsLabel.text = "\(localListOfRecipes[indexPath.row].countCCalIn100Gram) ккал"
        cell.portionsLabel.text = "\(localListOfRecipes[indexPath.row].countOfPortion) порции"
        cell.timeLabel.text = "\(localListOfRecipes[indexPath.row].timeOfCooking) мин"
        
        
        
//        cell.setNeedsLayout()
//        cell.layoutIfNeeded()
        return cell
    }
}
