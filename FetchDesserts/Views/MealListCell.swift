//
//  DessertListCell.swift
//  FetchDesserts
//
//  Created by Sachith H on 5/12/22.
//

import UIKit

class MealListCell: UITableViewCell {
    let mealImageView = UIImageView()
    let mealTextLabel = UILabel()
    var mainView = UIView()
    
    var image: UIImage?
    var title: String?
    var mealId: String?

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCellUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpCell(with item: MealItem) {        
        guard let name = item.strMeal, let id = item.idMeal else {
            // No meal name, no show
            isHidden = true
            return
        }
        title = name
        mealId = id
        mealTextLabel.text = title
        
        guard let imageString = item.strMealThumb,
              imageString != "",
              let url = URL(string: imageString),
              let data = try? Data(contentsOf: url) else {
                  // from sf symbols app
            image = UIImage(named: "person.crop.circle.badge.exclamationmark")
            return
        }
        image = UIImage(data: data)
        mealImageView.image = image
    }
    
    func setupCellUI() {
        contentView.addSubview(mainView)
        mainView.backgroundColor = .white
        addMainViewConstraints()
        
        mainView.addSubview(mealImageView)
        mealImageView.contentMode = .scaleAspectFill
        mealImageView.frame.size.height = 60.0
        mealImageView.translatesAutoresizingMaskIntoConstraints = false
        let imageViewConstraints: [NSLayoutConstraint] = [ mealImageView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 20.0), mealImageView.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 10.0), mealImageView.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: -10.0), mealImageView.heightAnchor.constraint(equalTo: mealImageView.widthAnchor)]
        NSLayoutConstraint.activate(imageViewConstraints)
        
        mealTextLabel.textAlignment = .left
        mealTextLabel.font = UIFont.boldSystemFont(ofSize: 18.0)
        mealTextLabel.translatesAutoresizingMaskIntoConstraints = false
        mealTextLabel.lineBreakMode = .byWordWrapping
        mainView.addSubview(mealTextLabel)
        let textLabelConstraints: [NSLayoutConstraint] = [mealTextLabel.leadingAnchor.constraint(equalTo: mealImageView.trailingAnchor, constant: 20.0), mealTextLabel.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -10.0), mealTextLabel.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 10.0), mealTextLabel.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: -10.0)]
        NSLayoutConstraint.activate(textLabelConstraints)
    }
    
    private func addMainViewConstraints() {
        mainView.translatesAutoresizingMaskIntoConstraints = false
        let mainViewConstraints: [NSLayoutConstraint] = [mainView.topAnchor.constraint(equalTo: contentView.topAnchor), mainView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor), mainView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor), mainView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)]
        NSLayoutConstraint.activate(mainViewConstraints)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
