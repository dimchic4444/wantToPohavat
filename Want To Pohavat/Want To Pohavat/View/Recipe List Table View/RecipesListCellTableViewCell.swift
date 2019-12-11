//
//  RecipesListCellTableViewCell.swift
//  Want To Pohavat
//
//  Created by Дмитрий Гришин on 06/12/2019.
//  Copyright © 2019 Дмитрий Гришин. All rights reserved.
//

import UIKit

class RecipesListCellTableViewCell: UITableViewCell {
    public static let reusedId = "recipeCell"
    let headerLabel = UILabel()
    let recipeImage = UIImageView()
    let ccalsLabel = UILabel()
    let timeLabel = UILabel()
    let portionsLabel = UILabel()
    
//    var widthScreenFromRecipeList: CGFloat? //Костыль. contentView.frame.width возращает ширину экрана для iphone 5s всегда. данная переменная получает ширину экрана из запускающей ее вьюшки
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        arrangeElementOnCell()
        //Заголовок
        contentView.addSubview(headerLabel)
//        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        headerLabel.font = UIFont.boldSystemFont(ofSize: 17.0)
        headerLabel.numberOfLines = 4
        //Картинка рецепта
        contentView.addSubview(recipeImage)
//        recipeImage.translatesAutoresizingMaskIntoConstraints = false
        recipeImage.contentMode = UIView.ContentMode.scaleAspectFill
        recipeImage.clipsToBounds = true

        //Количество каллорий
        contentView.addSubview(ccalsLabel)
//        ccalsLabel.translatesAutoresizingMaskIntoConstraints = false
        ccalsLabel.font = UIFont.systemFont(ofSize: 12.0)
        ccalsLabel.textAlignment = .left
        //Количество времени
        contentView.addSubview(timeLabel)
//        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        timeLabel.font = UIFont.systemFont(ofSize: 12.0)
        timeLabel.textAlignment = .center
        //Количество порций
        contentView.addSubview(portionsLabel)
//        portionsLabel.translatesAutoresizingMaskIntoConstraints = false
        portionsLabel.font = UIFont.systemFont(ofSize: 12.0)
        portionsLabel.textAlignment = .right
//        self.widthScreenFromRecipeList = widthFromParent
        


    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func arrangeElementOnCell() {
        //По непонятной мне причине contentView.wigth возвращает ширину такую как на айфоне 5s.
        var widthOfCell = contentView.frame.width
        if let width = widthOfScreen {
            widthOfCell = width
        }
        recipeImage.frame = CGRect(x: 5, y: 5, width: 160, height: 160)
        headerLabel.frame = CGRect(x: 175, y: 5, width: widthOfCell - 180, height: 80)
        ccalsLabel.frame = CGRect(x: 5, y: 170, width: widthOfCell/3 - 20, height: 20)
        timeLabel.frame = CGRect(x: widthOfCell/3 - 10, y: 170, width: widthOfCell/3 - 20, height: 20)
        portionsLabel.frame = CGRect(x: widthOfCell/3*2 + 15, y: 170, width: widthOfCell/3 - 20, height: 20)
        
    }
    
    override func updateConstraints() {
//        //Констрейнты для картинки
//        recipeImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5).isActive = true
//        recipeImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5).isActive = true
//        recipeImage.trailingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 190).isActive = true
//        recipeImage.bottomAnchor.constraint(equalTo: ccalsLabel.topAnchor, constant: -5).isActive = true
//        //Констрейнты для загловка
//        headerLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5).isActive = true
//        headerLabel.leadingAnchor.constraint(equalTo: recipeImage.trailingAnchor, constant: 10).isActive = true
//        headerLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -2).isActive = true
//        headerLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5).isActive = true
//        //Констрейнты для количество калорий
//        ccalsLabel.topAnchor.constraint(equalTo: recipeImage.bottomAnchor, constant: 15).isActive = true
//        ccalsLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5).isActive = true
//        ccalsLabel.trailingAnchor.constraint(equalTo: timeLabel.leadingAnchor, constant: 0).isActive = true
//        ccalsLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5).isActive = true
//        //Констрейнты для времени приготовления
//        timeLabel.topAnchor.constraint(equalTo: recipeImage.bottomAnchor, constant: 15).isActive = true
//        timeLabel.leadingAnchor.constraint(equalTo: ccalsLabel.trailingAnchor, constant: 50).isActive = true
//        timeLabel.trailingAnchor.constraint(equalTo: portionsLabel.leadingAnchor, constant: -50).isActive = true
//        timeLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5).isActive = true
//        //Констрейнты для количества порций
//        portionsLabel.topAnchor.constraint(equalTo: recipeImage.bottomAnchor, constant: 15).isActive = true
//        portionsLabel.leadingAnchor.constraint(equalTo: timeLabel.trailingAnchor, constant: 0).isActive = true
//        portionsLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
//        portionsLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5).isActive = true
//
        
        super.updateConstraints()
    }

}
