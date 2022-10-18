//
//  Sports.swift
//  AtomuzSports
//
//  Created by Joan Wilson Oliveira on 13/10/22.
//

import Foundation
import UIKit

public struct Sports: Codable {
    var sports: [Sport]
}

extension Sports: Hashable {

    public static func == (lhs: Sports, rhs: Sports) -> Bool {
        return true
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(0)
    }
}
