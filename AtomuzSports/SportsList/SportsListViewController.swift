//
//  SportsListViewController.swift
//  AtomuzSports
//
//  Created by Joan Wilson Oliveira on 12/10/22.
//

import UIKit

final class SportsListViewController: UIViewController {

    private var viewModel: SportsListViewModel

    fileprivate lazy var sportsTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false

        return tableView
    }()

    init(viewModel: SportsListViewModel) {
        self.viewModel = viewModel

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.buildLayout()
        self.addBinders()
    }

    private func addBinders() {
        viewModel.sports.bind { [weak self] _ in
            // swiftlint:disable unused_optional_binding
            guard let _ = self else { return }
            DispatchQueue.main.async {
                self?.sportsTableView.reloadData()
            }
        }
    }

}

extension SportsListViewController: ViewCoding {

    func setupView() {
        self.title = "Sports"
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }

    func setupHierarchy() {
        self.view.addSubview(self.sportsTableView)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            self.sportsTableView.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.sportsTableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            self.sportsTableView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            self.sportsTableView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
}

extension SportsListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.getSportsLength()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let sport = self.viewModel.getSportsName()[indexPath.row]
        cell.textLabel?.text = "\(sport)"

        return cell
    }
}
