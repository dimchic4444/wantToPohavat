//
//  ViewController.swift
//  Want To Pohavat
//
//  Created by Дмитрий Гришин on 25/11/2019.
//  Copyright © 2019 Дмитрий Гришин. All rights reserved.
//

import UIKit

class StartVC: UIViewController {
    let animateView = UIView() //Вьюшка с анимацией

    override func viewDidLoad() {
        super.viewDidLoad()
        widthOfScreen = view.frame.width //Задаем ширину экрана для дальнейшего использованися в классе RecipeListCell
        
//        var ingredients = [IngredientDTO]()
//        ingredients.append(IngredientDTO(isCalculating: true, countOf: 1, nameOfMeasure: "Литр", nameOfIngredient: "Бульон"))
//        ingredients.append(IngredientDTO(isCalculating: true, countOf: 500, nameOfMeasure: "Грамм", nameOfIngredient: "Молодой картофель"))
//        ingredients.append(IngredientDTO(isCalculating: true, countOf: 1, nameOfMeasure: "Горсть", nameOfIngredient: "Молодой свёкла"))
//        ingredients.append(IngredientDTO(isCalculating: true, countOf: 2, nameOfMeasure: "Чайная ложка", nameOfIngredient: "Лимонный сок"))
//        ingredients.append(IngredientDTO(isCalculating: true, countOf: 0.33, nameOfMeasure: "Чайная ложка", nameOfIngredient: "Молотый перец"))
//        ingredients.append(IngredientDTO(isCalculating: true, countOf: 5, nameOfMeasure: "Столовая ложка", nameOfIngredient: "Растительные сливки"))
//         ingredients.append(IngredientDTO(isCalculating: true, countOf: 0.5, nameOfMeasure: "Пучок", nameOfIngredient: "Укроп"))
//
//        var struc = RecipeDTO(nameOfRecipe: "Свекольный суп с картофелем и укропом", ingredients: ingredients, instruction: ["Срезать ботву со свёклы, промыть ее и очистить корнеплод. Листья порубить вместе со стеблями, свёклу тонко нарезать", "Промыть картофель, нарезать и обжарить в течение 5-7 минут в сковороде с маслом. Залить бульоном и довести до кипения", "Готовить минут 8 до мягкости картофеля, затем добавить свёклу и ботву. Готовить еще 1-2 минуты. Приправить солью с перцем при необходимости", "Добавить сок лимона и сливки. Перемешать и добавить порубленный укроп. Подавать"], timeOfCooking: 20, countOfPortion: 4, countCCalIn100Gram: 32, nameOfCategory: "Веган", nameOfSubCategory: "Супы", nameOfPicture: "image1.jpg")
//
//        var ingredients1 = [IngredientDTO]()
//        ingredients1.append(IngredientDTO(isCalculating: true, countOf: 1, nameOfMeasure: "Столовая ложка", nameOfIngredient: "Растительное масло"))
//        ingredients1.append(IngredientDTO(isCalculating: true, countOf: 0.5, nameOfMeasure: "Штук", nameOfIngredient: "Репчатый лук"))
//        ingredients1.append(IngredientDTO(isCalculating: true, countOf: 2, nameOfMeasure: "Штук", nameOfIngredient: "Зубчик чеснока"))
//        ingredients1.append(IngredientDTO(isCalculating: true, countOf: 100, nameOfMeasure: "Грамм", nameOfIngredient: "Булгур"))
//        ingredients1.append(IngredientDTO(isCalculating: true, countOf: 1, nameOfMeasure: "Чайная ложка", nameOfIngredient: "Куркума"))
//        ingredients1.append(IngredientDTO(isCalculating: true, countOf: 1, nameOfMeasure: "Щепотка", nameOfIngredient: "Шафран"))
//        ingredients1.append(IngredientDTO(isCalculating: true, countOf: 1, nameOfMeasure: "Столовая ложка", nameOfIngredient: "Паприка"))
//        ingredients1.append(IngredientDTO(isCalculating: true, countOf: 0.5, nameOfMeasure: "Чайной ложка", nameOfIngredient: "Молотый кумин"))
//        ingredients1.append(IngredientDTO(isCalculating: true, countOf: 1, nameOfMeasure: "Литр", nameOfIngredient: "Овощной бульон"))
//        ingredients1.append(IngredientDTO(isCalculating: true, countOf: 1, nameOfMeasure: "Банка", nameOfIngredient: "Белая фасоль"))
//        ingredients1.append(IngredientDTO(isCalculating: true, countOf: 800, nameOfMeasure: "Грамм", nameOfIngredient: "Томаты консервированные"))
//        ingredients1.append(IngredientDTO(isCalculating: true, countOf: 1, nameOfMeasure: "Горсть", nameOfIngredient: "Базилик"))
//
//
//        var struc1 = RecipeDTO(nameOfRecipe: "Суп с булгуром и фасолью", ingredients: ingredients1, instruction: ["Добавить оливковое масло в кастрюлю, туда же масло и нарезанный лук. Жарить до карамелизации, затем добавить чеснок и жарить еще 30-60 секунд", "Добавить булгур и специи. Жарить 1 минуту, залить бульоном и добавить фасоль и томаты, вместе с содержимым банок", "Довести до кипения, затем снизить пламя, добавить соль с перцем и зелень. Продолжать варить под крышкой еще 30 минут"], timeOfCooking: 40, countOfPortion: 4, countCCalIn100Gram: 62, nameOfCategory: "Веган", nameOfSubCategory: "Супы", nameOfPicture: "image2.jpg")
//
//
//
//        var ingredients2 = [IngredientDTO]()
//        ingredients2.append(IngredientDTO(isCalculating: true, countOf: 1, nameOfMeasure: "Кочан", nameOfIngredient: "Цветная капуста"))
//        ingredients2.append(IngredientDTO(isCalculating: true, countOf: 1, nameOfMeasure: "Кочан", nameOfIngredient: "Брокколи"))
//        ingredients2.append(IngredientDTO(isCalculating: true, countOf: 2, nameOfMeasure: "Штук", nameOfIngredient: "Репчатый лук"))
//        ingredients2.append(IngredientDTO(isCalculating: true, countOf: 0.5, nameOfMeasure: "Головка", nameOfIngredient: "Чеснок"))
//        ingredients2.append(IngredientDTO(isCalculating: true, countOf: 8, nameOfMeasure: "Чашка", nameOfIngredient: "Овощной бульон"))
//        ingredients2.append(IngredientDTO(isCalculating: true, countOf: 1, nameOfMeasure: "Чашка", nameOfIngredient: "Кокосовое молоко"))
//        ingredients2.append(IngredientDTO(isCalculating: false, countOf: 1, nameOfMeasure: "По вкусу", nameOfIngredient: "Соль"))
//        ingredients2.append(IngredientDTO(isCalculating: false, countOf: 1, nameOfMeasure: "По вкусу", nameOfIngredient: "Перец"))
//
//        var struc2 = RecipeDTO(nameOfRecipe: "Суп с цветной капустой и брокколи", ingredients: ingredients2, instruction: ["Разогреть духовку до 230 градусов. Выложить брокколи и цветную капусту на противень. Полить маслом и посыпать солью и перцем. Переместить в духовку и выпекать 25-30 минут, до мягкости", "В большой кастрюле обжарить лук и чеснок в течение 5 минут, до появления аромата", "Добавить 4 чашки бульона, половину капусты и брокколи. Накрыть и оставить тушиться на 20 минут, затем снять с огня. Дать остыть в течение 5 минут и затем пюрировать. Добавить оставшуюся капусту, брокколи и бульон. Довести до кипения. Уменьшить огонь и влить кокосовое молоко. Готовить, пока суп не начнет густеть. Добавить соль и перец по вкусу", "Подавать суп горячим, можно добавить тертый веганский сыр"], timeOfCooking: 60, countOfPortion: 8, countCCalIn100Gram: 48, nameOfCategory: "Веган", nameOfSubCategory: "Супы", nameOfPicture: "image3.jpg")
//
//
//
//        var ingredients3 = [IngredientDTO]()
//        ingredients3.append(IngredientDTO(isCalculating: true, countOf: 700, nameOfMeasure: "Грамм", nameOfIngredient: "Цветная капуста"))
//        ingredients3.append(IngredientDTO(isCalculating: true, countOf: 1, nameOfMeasure: "Штук", nameOfIngredient: "Репчатый лук"))
//        ingredients3.append(IngredientDTO(isCalculating: true, countOf: 1, nameOfMeasure: "Штук", nameOfIngredient: "Зубчик чеснока"))
//        ingredients3.append(IngredientDTO(isCalculating: false, countOf: 1, nameOfMeasure: "По вкусу", nameOfIngredient: "Оливковое масло"))
//        ingredients3.append(IngredientDTO(isCalculating: false, countOf: 1, nameOfMeasure: "По вкусу", nameOfIngredient: "Овощной бульон"))
//        ingredients3.append(IngredientDTO(isCalculating: true, countOf: 1, nameOfMeasure: "Чайная ложка", nameOfIngredient: "Майоран"))
//        ingredients3.append(IngredientDTO(isCalculating: true, countOf: 0.5, nameOfMeasure: "Чашка", nameOfIngredient: "Белая фасоль"))
//        ingredients3.append(IngredientDTO(isCalculating: true, countOf: 200, nameOfMeasure: "Миллилитр", nameOfIngredient: "Растительные сливки"))
//        ingredients3.append(IngredientDTO(isCalculating: true, countOf: 1, nameOfMeasure: "Штук", nameOfIngredient: "Цедра лимона"))
//        ingredients3.append(IngredientDTO(isCalculating: true, countOf: 1, nameOfMeasure: "Штук", nameOfIngredient: "Сок лимона"))
//        ingredients3.append(IngredientDTO(isCalculating: false, countOf: 1, nameOfMeasure: "По вкусу", nameOfIngredient: "Соль"))
//        ingredients3.append(IngredientDTO(isCalculating: false, countOf: 1, nameOfMeasure: "По вкусу", nameOfIngredient: "Перец"))
//
//        var struc3 = RecipeDTO(nameOfRecipe: "Крем суп из цветной капусты с лимоном", ingredients: ingredients3, instruction: ["Нарезать капусту и лук. Обжарить лук в течение пары минут в оливковом масле, добавить капусту и чеснок, немного потушить и залить бульоном. Довести до кипения и варить до мягкости капусты", "Добавить фасоль и майоран, тушить пару минут", "Пюрировать суп и добавить сливки, цедру и сок лимона по вкусу. Перемешать и приправить по вкусу"], timeOfCooking: 25, countOfPortion: 4, countCCalIn100Gram: 51, nameOfCategory: "Веган", nameOfSubCategory: "Супы", nameOfPicture: "image4.jpg")
//
//        var ingredients4 = [IngredientDTO]()
//        ingredients4.append(IngredientDTO(isCalculating: true, countOf: 270, nameOfMeasure: "Грамм", nameOfIngredient: "Копченый тофу"))
//        ingredients4.append(IngredientDTO(isCalculating: true, countOf: 2, nameOfMeasure: "Столовая ложка", nameOfIngredient: "Растительное масло"))
//        ingredients4.append(IngredientDTO(isCalculating: true, countOf: 1, nameOfMeasure: "Штук", nameOfIngredient: "Репчатый лук"))
//        ingredients4.append(IngredientDTO(isCalculating: true, countOf: 1, nameOfMeasure: "Штук", nameOfIngredient: "Зубчик чеснока"))
//        ingredients4.append(IngredientDTO(isCalculating: true, countOf: 6, nameOfMeasure: "Штук", nameOfIngredient: "Картофель"))
//        ingredients4.append(IngredientDTO(isCalculating: true, countOf: 4, nameOfMeasure: "Штук", nameOfIngredient: "Морковь"))
//        ingredients4.append(IngredientDTO(isCalculating: true, countOf: 1, nameOfMeasure: "Литр", nameOfIngredient: "Вода"))
//        ingredients4.append(IngredientDTO(isCalculating: true, countOf: 2, nameOfMeasure: "Штук", nameOfIngredient: "Бульонный кубик"))
//        ingredients4.append(IngredientDTO(isCalculating: true, countOf: 4, nameOfMeasure: "Штук", nameOfIngredient: "Горошина перца"))
//        ingredients4.append(IngredientDTO(isCalculating: true, countOf: 1, nameOfMeasure: "Чайная ложка", nameOfIngredient: "Сушеный укроп"))
//        ingredients4.append(IngredientDTO(isCalculating: true, countOf: 200, nameOfMeasure: "Миллилитр", nameOfIngredient: "Растительные сливки"))
//        ingredients4.append(IngredientDTO(isCalculating: false, countOf: 1, nameOfMeasure: "По вкусу", nameOfIngredient: "Свежий укроп"))
//
//        var struc4 = RecipeDTO(nameOfRecipe: "Суп с тофу", ingredients: ingredients4, instruction: ["Нарезать тофу, лук, чеснок, картофель и морковь", "Разогреть 1 столовую ложку масла в сотейнике, добавить лук с чесноком и жарить минуту", "Добавить картофель, воду, кубики, специи и укроп. Варить пару минут и добавить морковь. Продолжать готовить до мягкости овощей", "Разогреть масло в сковороде и обжарить тофу до золотистости", "Добавить в суп тофу и сливки и подавать с укропом"], timeOfCooking: 50, countOfPortion: 4, countCCalIn100Gram: 57, nameOfCategory: "Веган", nameOfSubCategory: "Супы", nameOfPicture: "image5.jpg")
//
//        var ingredients5 = [IngredientDTO]()
//        ingredients5.append(IngredientDTO(isCalculating: true, countOf: 3, nameOfMeasure: "Чашка", nameOfIngredient: "Мускатная тыква"))
//        ingredients5.append(IngredientDTO(isCalculating: true, countOf: 1, nameOfMeasure: "Чашка", nameOfIngredient: "Нарезанный лук"))
//        ingredients5.append(IngredientDTO(isCalculating: true, countOf: 1.5, nameOfMeasure: "Чашка", nameOfIngredient: "Нутовая мука"))
//        ingredients5.append(IngredientDTO(isCalculating: true, countOf: 0.5, nameOfMeasure: "Столовая ложка", nameOfIngredient: "Измельченный чеснок"))
//        ingredients5.append(IngredientDTO(isCalculating: true, countOf: 1, nameOfMeasure: "Чайная ложка", nameOfIngredient: "Лимонный сок"))
//        ingredients5.append(IngredientDTO(isCalculating: true, countOf: 3, nameOfMeasure: "Столовая ложка", nameOfIngredient: "Петрушка"))
//        ingredients5.append(IngredientDTO(isCalculating: false, countOf: 1, nameOfMeasure: "По вкусу", nameOfIngredient: "Масло для жарки"))
//        ingredients5.append(IngredientDTO(isCalculating: true, countOf: 1, nameOfMeasure: "Чайная ложка", nameOfIngredient: "Молотый тмин"))
//        ingredients5.append(IngredientDTO(isCalculating: true, countOf: 0.25, nameOfMeasure: "Чайная ложка", nameOfIngredient: "Молотая куркума"))
//        ingredients5.append(IngredientDTO(isCalculating: true, countOf: 0.5, nameOfMeasure: "Чайная ложка", nameOfIngredient: "Кайенский перец"))
//        ingredients5.append(IngredientDTO(isCalculating: true, countOf: 0.5, nameOfMeasure: "Чайная ложка", nameOfIngredient: "Соль"))
//
//        var struc5 = RecipeDTO(nameOfRecipe: "Котлеты из нута и тыквы", ingredients: ingredients5, instruction: ["В большой миске смешать тертую тыкву, лук, нутовую муку, специи, лимонный сок и петрушку. Перемешать вилкой", "Смазать маслом сковороду", "Сформировать котлеты и выложить на сковороду. Обжаривать 3-4 минуты, перевернуть и готовить еще минуты 2-3", "Снять с огня и переложить на бумажные полотенца", "Посыпать петрушкой и подавать"], timeOfCooking: 30, countOfPortion: 5, countCCalIn100Gram: 194, nameOfCategory: "Веган", nameOfSubCategory: "Вторые блюда", nameOfPicture: "image6.jpg")
//
//        var ingredients6 = [IngredientDTO]()
//        ingredients6.append(
//            IngredientDTO(isCalculating: true, countOf: 1, nameOfMeasure: "Штук", nameOfIngredient: "Репчатый лук"))
//        ingredients6.append(
//            IngredientDTO(isCalculating: true, countOf: 0.5, nameOfMeasure: "Штук", nameOfIngredient: "Красный болгарский перец"))
//        ingredients6.append(
//            IngredientDTO(isCalculating: true, countOf: 1, nameOfMeasure: "Чашка", nameOfIngredient: "Картофель"))
//        ingredients6.append(
//            IngredientDTO(isCalculating: true, countOf: 0.5, nameOfMeasure: "Чашка", nameOfIngredient: "Красная чечевица"))
//        ingredients6.append(
//            IngredientDTO(isCalculating: true, countOf: 1.5, nameOfMeasure: "Чашка", nameOfIngredient: "Вода"))
//        ingredients6.append(
//            IngredientDTO(isCalculating: true, countOf: 1, nameOfMeasure: "Штук", nameOfIngredient: "Лавровый лист"))
//        ingredients6.append(
//            IngredientDTO(isCalculating: true, countOf: 1, nameOfMeasure: "Щепотка", nameOfIngredient: "Молотый кумин"))
//        ingredients6.append(
//            IngredientDTO(isCalculating: true, countOf: 1, nameOfMeasure: "Щепотка", nameOfIngredient: "Петрушка"))
//        ingredients6.append(
//            IngredientDTO(isCalculating: true, countOf: 3, nameOfMeasure: "Столовая ложка", nameOfIngredient: "Томатная паста"))
//        ingredients6.append(
//            IngredientDTO(isCalculating: false, countOf: 1, nameOfMeasure: "По вкусу", nameOfIngredient: "Лимонный сок"))
//        ingredients6.append(
//            IngredientDTO(isCalculating: false, countOf: 1, nameOfMeasure: "По вкусу", nameOfIngredient: "Растительное масло"))
//        ingredients6.append(
//            IngredientDTO(isCalculating: false, countOf: 1, nameOfMeasure: "По вкусу", nameOfIngredient: "Соль"))
//        ingredients6.append(
//            IngredientDTO(isCalculating: false, countOf: 1, nameOfMeasure: "По вкусу", nameOfIngredient: "Перец"))
//
//
//        var struc6 = RecipeDTO(nameOfRecipe: "Рагу с картофелем и чечевицей", ingredients: ingredients6, instruction: ["Нарезать лук и обжарить в сотейнике до полупрозрачности", "Добавить картофель к луку, затем перец, чечевицу, воду, томатную пасту, кумин и лавровый лист. Перемешать и тушить минут 20 под крышкой на слабом огне", "Удалить лавровый лист, добавить петрушку и немного лимонного сока. Подавать"], timeOfCooking: 30, countOfPortion: 2, countCCalIn100Gram: 109, nameOfCategory: "Веган", nameOfSubCategory: "Вторые блюда", nameOfPicture: "image7.jpg")
//
//
//
//        var arrayOfRecipes = RecipeDTOResponse(items: [struc, struc1, struc2, struc3, struc4, struc5, struc6])
//        let encodedData = try? JSONEncoder().encode(arrayOfRecipes)
//         print(String(data: encodedData!, encoding: .utf8)!)

        
        
        
        
        //Настройка вьюшки в которой будут анимации
        animateView.frame = CGRect(x: view.center.x, y: view.center.y, width: 150, height: 150)
        animateView.center = view.center
        //        animateView.layer.borderColor = UIColor.black.cgColor
        //        animateView.layer.borderWidth = 1.0
        animateView.backgroundColor = .white
        view.addSubview(animateView)
        view.backgroundColor = .purple
        //        if let image = GlobalFunctions.loadImage(stringUrl: "\(imagesLink)image1.jpg") {print(image)}
        let orbitBounds = CGRect(x: 0, y: 0, width: 120, height: 120) // границы орбиты
        var orbits: [CAKeyframeAnimation] = []
        var squares: [UIView] = []
        var speedOfRolling: Double = 1.0
        for i in 0...9 {
            squares.append(UIView(frame: CGRect(origin: .zero, size: CGSize(width: 20, height: 20))))
            squares[i].backgroundColor = .lightGray
            orbits.append(CAKeyframeAnimation(keyPath: "position"))
            orbits[i].path = CGPath(ellipseIn: orbitBounds, transform: nil)
            orbits[i].isAdditive = true
            orbits[i].repeatCount = HUGE // количество повторений
            orbits[i].calculationMode = .paced // постоянная скорость
            orbits[i].rotationMode = nil // вращается ли объект относительно оси Х. Если nil - то не вращается
            speedOfRolling = speedOfRolling + 0.1
            orbits[i].duration = speedOfRolling
            animateView.addSubview(squares[i])
            squares[i].layer.add(orbits[i], forKey: "orbit")
        }
        
       
        
    }
    override func viewDidAppear(_ animated: Bool) {
        
            
        
        let myGroup = DispatchGroup()
        myGroup.enter()
        if (GlobalFunctions.loadListOfRecipes()) {
            //Создаем вьюшки и настраиваем их
            let navVCForAllRecipeList = UINavigationController()
            let navVCForChooseIngridients = UINavigationController()
            let navVCForChooseSubCategory = UINavigationController()
            let allRecipesListVC = RecipesList(nibName: nil, bundle: nil, recipeList: listOfRecipes)
            let choseIngridientsVC = DifferentIngridientsVC()
            let chooseSubCategoryVC = DifferentSuBCategoriesVC()
            allRecipesListVC.modalPresentationStyle = .fullScreen
            choseIngridientsVC.modalPresentationStyle = .fullScreen
            chooseSubCategoryVC.modalPresentationStyle = .fullScreen
            navVCForAllRecipeList.viewControllers = [allRecipesListVC]
            navVCForChooseIngridients.viewControllers = [choseIngridientsVC]
            navVCForChooseSubCategory.viewControllers = [chooseSubCategoryVC]
            let tabBar = UITabBarController()
            tabBar.viewControllers = [navVCForAllRecipeList, navVCForChooseIngridients, navVCForChooseSubCategory]
            tabBar.modalPresentationStyle = .fullScreen
            tabBar.modalTransitionStyle = .crossDissolve
            myGroup.leave()
            myGroup.notify(queue: DispatchQueue.main) {
                UIView.animate(withDuration: 1, animations: {
                    self.animateView.frame.size = CGSize(width: 20.0 * self.animateView.frame.width, height: 20.0 * self.animateView.frame.height)
                    self.animateView.center = self.view.center
                }) { (bool) in
                    self.present(tabBar, animated: true)
//                print(GlobalFunctions.getDifferentIngridients())
                }
            }
        } else {
            //Здесь надо вывести сообщение об ошибке загрузки
            print("Не удалось запустить приложение")
            let alertController = UIAlertController(title: "Внимание", message: "Вероятно, отсутсвует подключение к интернету", preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "ОК", style: .cancel) { (alert) in
                
            }
            alertController.addAction(alertAction)
            present(alertController, animated: true)
        }
        
    }


}


