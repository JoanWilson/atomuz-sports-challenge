//
//  SportsDetailViewController.swift
//  AtomuzSports
//
//  Created by Joan Wilson Oliveira on 12/10/22.
//

import UIKit

final class SportsDetailViewController: UIViewController {

    private var viewModel: SportsDetailViewModel
    private var contentView: SportsDetailView

    init(viewModel: SportsDetailViewModel) {
        self.viewModel = viewModel
        self.contentView = SportsDetailView(frame: .zero, viewModel: viewModel)
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        return nil
    }

    override func loadView() {
        super.loadView()
        self.view = contentView
        self.contentView.viewModel.delegate = self
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        navigationController?.isNavigationBarHidden = true
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.isNavigationBarHidden = false
    }

}

extension SportsDetailViewController: SportsDetailViewModelDelegate {
    func popToRootView() {
        self.navigationController?.popViewController(animated: true)
    }
}
