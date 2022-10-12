//
//  AppCoordinator.swift
//  AtomuzSports
//
//  Created by Joan Wilson Oliveira on 12/10/22.
//

import Foundation
import UIKit

final class AppCoordinator: Coordinator {

    private(set) var childCoordinators: [Coordinator] = []

    private let window: UIWindow

    init(window: UIWindow) {
        self.window = window
    }

    public func start() {
        let navigationController = UINavigationController()
        let sportsListCoordinator = SportsListCoordinator(navigationController: navigationController)

        self.childCoordinators.append(sportsListCoordinator)

        sportsListCoordinator.start()

        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }

}
