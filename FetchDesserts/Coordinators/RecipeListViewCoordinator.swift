//
//  RecipeListViewCoordinator.swift
//  FetchDesserts
//
//  Created by Sachith H on 5/14/22.
//

import Foundation
import UIKit

final class RecipeListViewCoordinator {
    private var category: Category!
    private let navigationController: UINavigationController
    private var viewController: RecipeListViewController!
    private var childCoordinator: DetailsViewCoordinator!

    init(navigationController: UINavigationController, category: Category) {
        self.navigationController = navigationController
        self.category = category
    }
    
    func showViewController() {
        let recipeListVC = RecipeListViewController()
        self.viewController = recipeListVC
        recipeListVC.category = category
        recipeListVC.viewModel = RecipeListViewModel(category: category)
        recipeListVC.coordinator = self
        self.navigationController.pushViewController(self.viewController, animated: false)
    }
    
    func showChildViewController(id: String, title: String) {
        let detailsCoordinator = DetailsViewCoordinator(navigationController: navigationController, title: title, id: id)
        self.childCoordinator = detailsCoordinator
        self.childCoordinator.showViewController()
    }
    
    func showAlert() {
        let alertController = UIAlertController(title: "Error!", message: "We had an error loading recipes, please try again", preferredStyle: .alert)
        let dismissAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alertController.addAction(dismissAction)
        self.navigationController.present(alertController, animated: true, completion: nil)
    }
}
