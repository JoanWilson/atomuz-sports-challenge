//
//  SportsClientMock.swift
//  AtomuzSportsTests
//
//  Created by Joan Wilson Oliveira on 12/10/22.
//

import Foundation
@testable import AtomuzSports

public final class SportsClientMock: SportsClientProtocol {

    private let mockSports: Sports

    init(mockSports: Sports) {
        self.mockSports = mockSports
    }

    public func fetchSports(completion: @escaping (Result<Sports, Error>) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            completion(.success(self.mockSports))
        }
    }
}
