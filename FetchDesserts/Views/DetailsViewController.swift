//
//  DetailsViewController.swift
//  FetchDesserts
//
//  Created by Sachith H on 5/12/22.
//

import UIKit

class DetailsViewController: UIViewController {
    unowned var coordinator: DetailsViewCoordinator!
    var viewModel: DetailsViewModel!
    var vcTitle: String!
    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var mealImage: UIImageView!
    @IBOutlet var mainView: UIView!
    @IBOutlet var loadingSpinner: UIActivityIndicatorView!
    @IBOutlet var ingredientsLabel: UILabel!
    @IBOutlet var instructionsLabel: UILabel!
    
    static var viewController: DetailsViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle(for: DetailsViewController.self))
        guard let viewController = storyboard.instantiateViewController(withIdentifier: String(describing: DetailsViewController.self)) as? DetailsViewController else {
            fatalError("Could not instantiate ViewController")
        }
        return viewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = vcTitle
        loadingSpinner.startAnimating()
        fetchRecipe()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func fetchRecipe() {
        viewModel.fetchRecipe { [weak self] error in
            guard let self = self else { return }
            guard error == nil else {
                self.showAlert()
                return
            }
            self.loadingSpinner.stopAnimating()
            self.ingredientsLabel.text = self.viewModel.ingredientsAndMeasurements
            self.instructionsLabel.text = self.viewModel.instructions
            self.mealImage.image = self.viewModel.image
        }
    }
    
    private func showAlert() {
        let alertController = UIAlertController(title: "Error!", message: "We had an error loading the recipe, please try again", preferredStyle: .alert)
        let dismissAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alertController.addAction(dismissAction)
        self.navigationController?.present(alertController, animated: true, completion: nil)
    }

    deinit {
        coordinator = nil
    }
}

/*
 Meal name
 Instructions
 Ingredients/measurements
 */
