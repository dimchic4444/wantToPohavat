//
//  Different IngridientsVC.swift
//  Want To Pohavat
//
//  Created by Дмитрий Гришин on 09/12/2019.
//  Copyright © 2019 Дмитрий Гришин. All rights reserved.
//

import UIKit

class DifferentIngridientsVC: UIViewController {
    let tableViewIngridients = UITableView()
    var differentIngridients: [String] = []
    var ingridientsThatChoised: [String] = []

    init() {
        super.init(nibName: nil, bundle: nil)
        self.tabBarItem = UITabBarItem(title: "Ингридиенты", image: UIImage(named: "notes"), selectedImage: UIImage(named: "notes"))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        tableViewIngridients.frame = view.frame
        differentIngridients = GlobalFunctions.getDifferentIngridients()
        tableViewIngridients.allowsMultipleSelection = true
        tableViewIngridients.delegate = self
        tableViewIngridients.dataSource = self
        self.title = "Ингридиенты"
        view.addSubview(tableViewIngridients)
        tableViewIngridients.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        //Добавление кнопки переходна к списке рецептов
        let barItem = UIBarButtonItem(barButtonSystemItem: .fastForward, target: self, action: #selector(goToRecipeList))
        navigationItem.rightBarButtonItem = barItem
    }
    @objc
    func goToRecipeList() {
        if (ingridientsThatChoised.count != 0) {
            let VC = RecipesList(nibName: nil, bundle: nil, recipeList: GlobalFunctions.getRecipesWithIngridients(ingridients: ingridientsThatChoised))
            navigationController?.pushViewController(VC, animated: true)

        }
    }


}

extension DifferentIngridientsVC: UITableViewDelegate
{
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableViewIngridients.cellForRow(at: indexPath) {
            if (!ingridientsThatChoised.contains(differentIngridients[indexPath.row])) {
                ingridientsThatChoised.append(differentIngridients[indexPath.row])
            }
//            print(ingridientsThatChoised)
        }

    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        if let cell = tableViewIngridients.cellForRow(at: indexPath) {
            if (ingridientsThatChoised.contains(differentIngridients[indexPath.row])) {
                if let index = ingridientsThatChoised.firstIndex(of: differentIngridients[indexPath.row]) {
                    ingridientsThatChoised.remove(at: index)
                }
            }
//            print(ingridientsThatChoised)
        }
    }
    
  
}

extension DifferentIngridientsVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return differentIngridients.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = differentIngridients[indexPath.row]
        
        return cell
    }
}

