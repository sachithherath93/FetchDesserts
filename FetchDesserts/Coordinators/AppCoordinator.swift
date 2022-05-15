//
//  AppCoordinator.swift
//  FetchDesserts
//
//  Created by Sachith H on 5/14/22.
//

import Foundation
import UIKit

// To initiate the app
final class AppCoordinator {
    private let navigationController: UINavigationController
    private var childCoordinator: RecipeListViewCoordinator!
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func initiateViewController(category: Category) {
        let listCoordinator = RecipeListViewCoordinator(navigationController: navigationController, category: category)
        self.childCoordinator = listCoordinator
        self.childCoordinator.showViewController()
    }
}
