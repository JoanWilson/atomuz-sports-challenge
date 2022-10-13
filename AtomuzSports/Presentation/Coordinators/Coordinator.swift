//
//  Coordinator.swift
//  AtomuzSports
//
//  Created by Joan Wilson Oliveira on 12/10/22.
//

import Foundation
import UIKit

public protocol Coordinator {
    var childCoordinators: [Coordinator] { get }
    func start()
}
