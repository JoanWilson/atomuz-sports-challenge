//
//  SportsDetailCoordinator.swift
//  AtomuzSports
//
//  Created by Joan Wilson Oliveira on 12/10/22.
//

import Foundation
import UIKit

final class SportsDetailCoordinator: Coordinator {

    private(set) var childCoordinators: [Coordinator] = []

    private let navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
//        let sportsDetailViewModel = SportsDetailViewModel()
//        let sportsDetailViewController = SportsDetailViewController(viewModel: sportsDetailViewModel)
//        navigationController.setViewControllers([sportsDetailViewController], animated: false)
    }

}
