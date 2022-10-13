//
//  SportsListViewController.swift
//  AtomuzSports
//
//  Created by Joan Wilson Oliveira on 12/10/22.
//

import UIKit

final class SportsListViewController: UIViewController {

    private var viewModel: SportsListViewModel {
        didSet {
            self.contentView.sportsTableView.reloadData()
        }
    }
    private var isSearch: Bool = false
    private var imageCache = NSCache<NSString, UIImage>()
    private let contentView = SportsListView()

    fileprivate lazy var searchController: UISearchController = {
        let searchController = UISearchController(searchResultsController: nil)

        return searchController
    }()

    init(viewModel: SportsListViewModel) {
        self.viewModel = viewModel

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
    }

    private func addBinders() {
        viewModel.sports.bind { [weak self] _ in
            guard let self else { return }
            DispatchQueue.main.async {
                self.contentView.sportsTableView.reloadData()
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
            NSAttributedString.Key.foregroundColor: UIColor.black,
            NSAttributedString.Key.font: UIFont(name: "AvenirNext-DemiBold", size: 40) as Any
        ]
        navigationItem.standardAppearance = appearance
    }

}

extension SportsListViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        return headerView
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
        guard let sportsCell = tableView.dequeueReusableCell(
            withIdentifier: SportsTableViewCell.indentifier,
            for: indexPath
        ) as? SportsTableViewCell else {
            return UITableViewCell()
        }

        sportsCell.setSport(with: self.viewModel.getSportByIndex(index: indexPath.section))
        sportsCell.selectionStyle = .none
        return sportsCell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.viewModel.coordinator.showDetail(for: self.viewModel.getSportByIndex(index: indexPath.section))
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
        isSearch = false
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        isSearch = false
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        //            if searchText.count == 0 {
        //                isSearch = false
        //                self.maintableView.reloadData()
        //            } else {
        //                filteredTableData = tableData.filter({ (text) -> Bool in
        //                    let tmp: NSString = text as NSString
        //                    let range = tmp.range(of: searchText, options: NSString.CompareOptions.caseInsensitive)
        //                    return range.location != NSNotFound
        //                })
        //                if(filteredTableData.count == 0){
        //                    isSearch = false
        //                } else {
        //                    isSearch = true
        //                }
        //                self.maintableView.reloadData()
        //            }
    }
}
