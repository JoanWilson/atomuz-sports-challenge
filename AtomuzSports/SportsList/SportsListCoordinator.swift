//
//  SportsListCoordinator.swift
//  AtomuzSports
//
//  Created by Joan Wilson Oliveira on 12/10/22.
//

import Foundation
import UIKit

final class SportsListCoordinator: Coordinator {

    private(set) var childCoordinators: [Coordinator] = []

    private let navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let sportsListViewModel = SportsListViewModel()
        let sportsListViewController = SportsListViewController(viewModel: sportsListViewModel)
        navigationController.setViewControllers([sportsListViewController], animated: false)
    }

}
