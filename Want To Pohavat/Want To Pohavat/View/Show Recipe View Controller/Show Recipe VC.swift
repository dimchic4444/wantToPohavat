//
//  Show Recipe VC.swift
//  Want To Pohavat
//
//  Created by Дмитрий Гришин on 08/12/2019.
//  Copyright © 2019 Дмитрий Гришин. All rights reserved.
//

import UIKit

class ShowRecipeVC: UIViewController {
    
    var currentRecipe: Recipe?
    
    let nameOfRecipeTextView = UITextView()
    var ingridientsTextViews: [UITextView] = []
    var instructionTextViews: [UITextView] = []
    let timeOfCookingLabel = UILabel()
    let countOfPortionLabel = UILabel()
    let countOfCCalLabel = UILabel()
    let nameOfCategoryLabel = UILabel()
    let nameOfSubcategoryLabel = UILabel()
    let imageOfRecipe = UIImageView()
    
    let ingridientsLabel = UITextView()
    let cookingLabel = UITextView()
    
    
    override func viewDidLoad() {
        view.backgroundColor = .white
    }
    
    func initialRecipe(recipe: Recipe) {
        self.currentRecipe = recipe
        buildPage()
    }
    
    private func buildPage() {
        if let recipe = self.currentRecipe {
            let scrollView = UIScrollView(frame: CGRect(x: 0, y: 90, width: view.frame.width, height: view.frame.height - 90))
            //Есть проблема с тем, что на старых айфонах получается слишком большой отступ сверху потому что отступ что для Х что для 5с одинаковый, а у старых нет челки. как решить пока думаю 
            let subView = UIView()
            
            var yPadding: CGFloat = 5 //Переменная хранит расстояние на котором создавтаь новый элемент по Y
            //Настройка имени рецепта
            nameOfRecipeTextView.frame = CGRect(x: 5, y: yPadding, width: view.frame.width - 10, height: 25)
            nameOfRecipeTextView.text = recipe.nameOfRecipe
            nameOfRecipeTextView.textColor = .black
            nameOfRecipeTextView.font = UIFont.boldSystemFont(ofSize: 20)
            nameOfRecipeTextView.isEditable = false
            nameOfRecipeTextView.isSelectable = false
            adjustUITextViewHeight(arg: nameOfRecipeTextView)
            yPadding = yPadding + nameOfRecipeTextView.frame.height + 5
            subView.addSubview(nameOfRecipeTextView)
            //Настройка картинки рецепта
            imageOfRecipe.frame = CGRect(x: 0, y: yPadding, width: view.frame.width, height: view.frame.width)
            imageOfRecipe.contentMode = UIView.ContentMode.scaleAspectFill
            imageOfRecipe.clipsToBounds = true //Чтобы изображение не увеличивалось при маштабировпнии
            var imageForCell: UIImage?
            concurrentQueue.async {
                if let image = GlobalFunctions.loadImage(stringUrl: "\(imagesLink)\(recipe.nameOfPicture)") {
                    imageForCell = image
                }
                if ((imageForCell) != nil) {
                    DispatchQueue.main.async {
                        self.imageOfRecipe.image = imageForCell
                    }
                }
            }
            subView.addSubview(imageOfRecipe)
            yPadding = yPadding + view.frame.width + 5
            //Количество калорий
            countOfCCalLabel.frame = CGRect(x: 5, y: yPadding, width: view.frame.width/3 - 20, height: 20)
            countOfCCalLabel.textAlignment = .left
            countOfCCalLabel.text = "\(recipe.countCCalIn100Gram) ккал"
            countOfCCalLabel.font = UIFont.systemFont(ofSize: 14)
            subView.addSubview(countOfCCalLabel)
            //Время
            timeOfCookingLabel.frame = CGRect(x: view.frame.width/3 + 10, y: yPadding, width: view.frame.width/3 - 20, height: 20)
            timeOfCookingLabel.textAlignment = .center
            timeOfCookingLabel.text = "\(recipe.timeOfCooking) мин"
            timeOfCookingLabel.font = UIFont.systemFont(ofSize: 14)
            subView.addSubview(timeOfCookingLabel)
            //Порции
            countOfPortionLabel.frame = CGRect(x: view.frame.width/3*2 + 15, y: yPadding, width: view.frame.width/3 - 20, height: 20)
            countOfPortionLabel.textAlignment = .right
            countOfPortionLabel.text = "\(recipe.countOfPortion) порции"
            countOfPortionLabel.font = UIFont.systemFont(ofSize: 14)
            subView.addSubview(countOfPortionLabel)
            yPadding = yPadding + 25
            //Создание метки "ингридиенты"
            ingridientsLabel.frame = CGRect(x: 0, y: yPadding, width: view.frame.width, height: 30)
            ingridientsLabel.backgroundColor = .groupTableViewBackground
            ingridientsLabel.textColor = .darkGray
            ingridientsLabel.text = "Ингридиенты"
            ingridientsLabel.isEditable = false
            ingridientsLabel.isSelectable = false
            subView.addSubview(ingridientsLabel)
            yPadding = yPadding + 35
            //Вывод инггридиентов
            for i in 0...recipe.ingredients.count - 1 { //НЕ ТЕСТИРОВАЛОСЬ НА НЕСКОЛЬКИХ РЕЦЕПТАХ
                ingridientsTextViews.append(UITextView())
                 ingridientsTextViews[i].textAlignment = .center
                ingridientsTextViews[i].frame = CGRect(x: 5, y: yPadding, width: view.frame.width - 10, height: 25)
                ingridientsTextViews[i].text = "\(recipe.ingredients[i].nameOfIngredient) - \(NSString(format: "%.2f", recipe.ingredients[i].countOf)) \(recipe.ingredients[i].nameOfMeasure)"
                ingridientsTextViews[i].textColor = .black
                ingridientsTextViews[i].font = UIFont.boldSystemFont(ofSize: 16)
                adjustUITextViewHeight(arg: ingridientsTextViews[i])
                yPadding = yPadding + ingridientsTextViews[i].frame.height + 5
                ingridientsTextViews[i].isEditable = false
                ingridientsTextViews[i].isSelectable = false
                subView.addSubview(ingridientsTextViews[i])
            }
            //Вывод метки "Инструкция"
            cookingLabel.frame = CGRect(x: 0, y: yPadding, width: view.frame.width, height: 30)
            cookingLabel.backgroundColor = .groupTableViewBackground
            cookingLabel.textColor = .darkGray
            cookingLabel.text = "Инструкция"
            cookingLabel.isEditable = false
            cookingLabel.isSelectable = false
            subView.addSubview(cookingLabel)
            yPadding = yPadding + 35
            //Вывод инструкции
            for i in 0...recipe.instruction.count - 1 { //НЕ ТЕСТИРОВАЛОСЬ НА НЕСКОЛЬКИХ РЕЦЕПТАХ
                instructionTextViews.append(UITextView())
                instructionTextViews[i].textAlignment = .center
                instructionTextViews[i].frame = CGRect(x: 5, y: yPadding, width: view.frame.width - 10, height: 25)
                instructionTextViews[i].text = "Шаг - \(i + 1)\n\(recipe.instruction[i])"
                instructionTextViews[i].textColor = .black
                instructionTextViews[i].font = UIFont.boldSystemFont(ofSize: 16)
                adjustUITextViewHeight(arg: instructionTextViews[i])
                yPadding = yPadding + instructionTextViews[i].frame.height + 5
                instructionTextViews[i].isEditable = false
                instructionTextViews[i].isSelectable = false
                subView.addSubview(instructionTextViews[i])
            }
            scrollView.addSubview(subView)
            scrollView.contentSize = CGSize(width: view.frame.width, height: yPadding)
            view.addSubview(scrollView)
        }
        
    }
    func adjustUITextViewHeight(arg : UITextView) //Меняем размер TextView в зависимости от текста, который в нем
    {
        arg.translatesAutoresizingMaskIntoConstraints = true
        arg.sizeToFit()
        arg.isScrollEnabled = false
    }
}
