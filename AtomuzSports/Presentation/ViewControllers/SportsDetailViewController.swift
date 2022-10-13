//
//  SportsDetailViewController.swift
//  AtomuzSports
//
//  Created by Joan Wilson Oliveira on 12/10/22.
//

import UIKit

final class SportsDetailViewController: UIViewController {

    private var viewModel: SportsDetailViewModel

    init(viewModel: SportsDetailViewModel) {
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
        self.viewModel.helloWorld()
    }

}

extension SportsDetailViewController: ViewCoding {
    func setupView() {
        self.addBinders()
        self.view.backgroundColor = .green
    }

    func setupHierarchy() {

    }

    func setupConstraints() {

    }

}
