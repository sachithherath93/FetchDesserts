//
//  ViewController.swift
//  FetchDesserts
//
//  Created by Sachith H on 5/12/22.
//

import UIKit

class RecipeListViewController: UIViewController {
    unowned var coordinator: RecipeListViewCoordinator!
    var category: Category!
    var viewModel: RecipeListViewModel!
    private let cellReuseId = "MealListCell"
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(MealListCell.self, forCellReuseIdentifier: cellReuseId)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 80.0
        tableView.tableFooterView = UIView()
        return tableView
    }()
    
    lazy var loadingSpinner: UIActivityIndicatorView = {
        let loadingSpinner = UIActivityIndicatorView()
        loadingSpinner.hidesWhenStopped = true
        return loadingSpinner
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = category.rawValue
        view.addSubview(tableView)
        tableView.pinToSuperView(view)
        tableView.addSubview(loadingSpinner)
        addSpinnerConstraints()
        loadingSpinner.startAnimating()
        fetchMeals()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    private func addSpinnerConstraints() {
        loadingSpinner.translatesAutoresizingMaskIntoConstraints = false
        loadingSpinner.frame.size.height = 20.0
        let spinnerConstraints: [NSLayoutConstraint] = [loadingSpinner.centerXAnchor.constraint(equalTo: view.centerXAnchor), loadingSpinner.centerYAnchor.constraint(equalTo: view.centerYAnchor), loadingSpinner.heightAnchor.constraint(equalTo: loadingSpinner.widthAnchor)]
        NSLayoutConstraint.activate(spinnerConstraints)
    }
    
    private func fetchMeals() {
        viewModel.fetchMealList { [weak self] error in
            guard let self = self else { return }
            guard error == nil else {
                self.coordinator.showAlert()
                return
            }
            self.loadingSpinner.stopAnimating()
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    deinit {
        coordinator = nil
    }
}

extension RecipeListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseId, for: indexPath) as? MealListCell else {
            return UITableViewCell()
        }
        let item = viewModel.mealList[indexPath.row]
        cell.setUpCell(with: item)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.mealList.count
    }
}

extension RecipeListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let item = viewModel.mealList[indexPath.row]
        guard let recipeId = item.idMeal, let title = item.strMeal else { return }
        coordinator.showChildViewController(id: recipeId, title: title)
    }
}
