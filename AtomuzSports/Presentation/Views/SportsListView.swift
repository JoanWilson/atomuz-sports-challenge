//
//  SportsListView.swift
//  AtomuzSports
//
//  Created by Joan Wilson Oliveira on 13/10/22.
//

import UIKit

class SportsListView: UIView {

    let loading: UIActivityIndicatorView = {
        let loadingView = UIActivityIndicatorView(style: .medium)
        loadingView.startAnimating()
        loadingView.translatesAutoresizingMaskIntoConstraints = false

        return loadingView
    }()

    lazy var sportsTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.register(SportsTableViewCell.self, forCellReuseIdentifier: SportsTableViewCell.indentifier)
        tableView.separatorColor = .clear
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.isHidden = true

        return tableView
    }()

    override func layoutSubviews() {
        super.layoutSubviews()
        self.buildLayout()
    }

}

extension SportsListView: ViewCoding {

    func setupView() {
        self.backgroundColor = .white

    }

    func setupHierarchy() {
        self.addSubview(self.sportsTableView)
        self.addSubview(self.loading)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            self.sportsTableView.topAnchor.constraint(equalTo: self.topAnchor),
            self.sportsTableView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
            self.sportsTableView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            self.sportsTableView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),

            self.loading.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.loading.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
}
