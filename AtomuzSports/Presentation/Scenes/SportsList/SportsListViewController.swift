//
//  SportsListViewController.swift
//  AtomuzSports
//
//  Created by Joan Wilson Oliveira on 12/10/22.
//

import UIKit

final class SportsListViewController: UIViewController {

    var viewModel: SportsListViewModel
    var isSearch: Bool = false
    let contentView = SportsListView()

    lazy var searchController: UISearchController = {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.tintColor = UIColor(red: 0.039, green: 0.561, blue: 0.333, alpha: 1)
        searchController.searchBar.isHidden = true

        return searchController
    }()

    init(viewModel: SportsListViewModel) {
        self.viewModel = viewModel

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        return nil
    }

    override func loadView() {
        super.loadView()
        self.view = contentView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureNavigationController()
        self.addBinders()
        self.contentView.sportsTableView.delegate = self
        self.contentView.sportsTableView.dataSource = self
        self.searchController.searchBar.delegate = self

    }

    private func addBinders() {
        viewModel.filteredSports.bind { [weak self] _ in
            guard let self else { return }
            DispatchQueue.main.async {
                self.contentView.sportsTableView.reloadData()
                self.isTheLoadingFinished()
            }
        }
    }

    public func isTheLoadingFinished() {
        DispatchQueue.global().async {
            if self.viewModel.getSportsLength() >= 0 {
                DispatchQueue.main.async {
                    self.contentView.progressView.isHidden = true
                    self.contentView.sportsTableView.isHidden = false
                    self.searchController.searchBar.isHidden = false

                }
            }
        }
    }

    private func configureNavigationController() {
        self.title = "Sports"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.searchController = self.searchController
        searchController.searchBar.setImage(UIImage(), for: .search, state: .normal)
        searchController.searchBar.searchTextField.font = UIFont(name: "AvenirNext-Regular", size: 20)
        let appearance = UINavigationBarAppearance(idiom: .phone)
        appearance.largeTitleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.label,
            NSAttributedString.Key.font: UIFont(name: "AvenirNext-DemiBold", size: 40) as Any
        ]
        navigationItem.standardAppearance = appearance
    }

}

extension SportsListViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        self.viewModel.makeViewHeaderForTableViewSection()
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 3
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return self.viewModel.getSportsLength()
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 56
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        self.viewModel.makeSportsTableViewCell(tableView: tableView, indexPath: indexPath)
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.viewModel.showCellDetail(index: indexPath.section)
    }

}

extension SportsListViewController: UISearchBarDelegate {
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        isSearch = true
    }

    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        isSearch = false
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        viewModel.filterSports(by: "")
        isSearch = false
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        isSearch = false
    }

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.filterSports(by: searchBar.text?.trimmingCharacters(in: .whitespaces) ?? "")
    }
}
