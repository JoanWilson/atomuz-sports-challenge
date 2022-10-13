//
//  SportsClientProtocol.swift
//  AtomuzSports
//
//  Created by Joan Wilson Oliveira on 12/10/22.
//

import Foundation

public protocol SportsClientProtocol {
    func fetchSports(completion: @escaping (Result<Sports, Error>) -> Void)
}
