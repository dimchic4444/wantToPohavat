//
//  Different Sub CategoriesVC.swift
//  Want To Pohavat
//
//  Created by Дмитрий Гришин on 11/12/2019.
//  Copyright © 2019 Дмитрий Гришин. All rights reserved.
//

import UIKit

class DifferentSuBCategoriesVC: UIViewController {
    let tableViewSubCategories = UITableView()
    var differentSubCategories: [String] = []
    
    init() {
        super.init(nibName: nil, bundle: nil)
        self.tabBarItem = UITabBarItem(title: "Категории", image: UIImage(named: "notes"), selectedImage: UIImage(named: "notes"))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        tableViewSubCategories.frame = view.frame
        differentSubCategories = GlobalFunctions.getSubCategories()
        tableViewSubCategories.delegate = self
        tableViewSubCategories.dataSource = self
        self.title = "Категории"
        view.addSubview(tableViewSubCategories)
        tableViewSubCategories.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }

    
}

extension DifferentSuBCategoriesVC: UITableViewDelegate
{
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableViewSubCategories.cellForRow(at: indexPath) {
            let VC = RecipesList(nibName: nil, bundle: nil, recipeList: GlobalFunctions.getRecipesFromChosedCategory(subCategory: differentSubCategories[indexPath.row]))
            navigationController?.pushViewController(VC, animated: true)
            cell.isSelected = false
            
        }
        
    }
    

    
    
}

extension DifferentSuBCategoriesVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return differentSubCategories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = differentSubCategories[indexPath.row]
        
        return cell
    }
}

