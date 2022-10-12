//
//  SportsListViewController.swift
//  AtomuzSports
//
//  Created by Joan Wilson Oliveira on 12/10/22.
//

import UIKit
import Combine

final class SportsListViewController: UIViewController {

    private var viewModel: SportsListViewModel

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
    }

    private func addBinders() {
        viewModel.sports.bind { [weak self] sportsResult in
            guard let _ = self else { return }

            sportsResult.sports.forEach { sport in
                print(sport.strSport)
            }
        }
    }

}

extension SportsListViewController: ViewCoding {
    func setupView() {
        self.addBinders()
        self.view.backgroundColor = .green
    }

    func setupHierarchy() {

    }

    func setupConstraints() {
    
    }

}
