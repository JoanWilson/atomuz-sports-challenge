//
//  SportsClientMock.swift
//  AtomuzSportsTests
//
//  Created by Joan Wilson Oliveira on 12/10/22.
//

import Foundation
@testable import AtomuzSports

enum ClientErrors: Error {
    case unableToFetch
}

public final class SportsClientMock: SportsClientProtocol {

    public var shouldFail: Bool
    private let sportsMock: Sports = Sports(sports: Sport.mockWithTwoElements)

    init() {
        self.shouldFail = false
    }

    public func fetchSports(completion: @escaping (Result<Sports, Error>) -> Void) {

        DispatchQueue.main.asyncAfter(deadline: .now() + 0) {
            if self.shouldFail == false {
                completion(.success(self.sportsMock))
            } else {
                completion(.failure(ClientErrors.unableToFetch))
            }

        }
    }
}
