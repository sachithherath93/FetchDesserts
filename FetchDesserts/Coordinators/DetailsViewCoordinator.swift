//
//  DetailsViewCoordinator.swift
//  FetchDesserts
//
//  Created by Sachith H on 5/14/22.
//

import Foundation
import UIKit

final class DetailsViewCoordinator {
    private var id: String!
    private var title: String!
    private let navigationController: UINavigationController
    private var viewController: DetailsViewController!

    init(navigationController: UINavigationController, title: String, id: String) {
        self.navigationController = navigationController
        self.title = title
        self.id = id
    }
    
    func showViewController() {
        let detailsVC = DetailsViewController.viewController
        self.viewController = detailsVC
        detailsVC.vcTitle = title
        detailsVC.viewModel = DetailsViewModel(mealId: id)
        detailsVC.coordinator = self
        self.navigationController.pushViewController(self.viewController, animated: false)
    }
    
    func showAlert() {
        let alertController = UIAlertController(title: "Error!", message: "We had an error loading this recipe, please try again", preferredStyle: .alert)
        let dismissAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alertController.addAction(dismissAction)
        self.navigationController.present(alertController, animated: true, completion: nil)
    }
}
