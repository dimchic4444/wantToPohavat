//
//  Ingridients TableView.swift
//  Want To Pohavat
//
//  Created by Дмитрий Гришин on 08/12/2019.
//  Copyright © 2019 Дмитрий Гришин. All rights reserved.
//

import UIKit

class IngridientsTableView: UIViewController {

    let tableViewIngridients = UITableView()
    var ingridients: [Ingredient] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        tableViewIngridients.frame = view.frame
        tableViewIngridients.delegate = self
        tableViewIngridients.dataSource = self
        tableViewIngridients.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    func setIngridients(ingridientsArray: [Ingredient]) {
        self.ingridients = ingridientsArray
    }
}

extension IngridientsTableView: UITableViewDelegate
{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

extension IngridientsTableView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ingridients.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = ingridients[indexPath.row].nameOfIngredient
        
        return cell
    }
}
