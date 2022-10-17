//
//  SportsClientMock.swift
//  AtomuzSportsTests
//
//  Created by Joan Wilson Oliveira on 12/10/22.
//

import Foundation
@testable import AtomuzSports

public final class SportsClientMock: SportsClientProtocol {

    let shouldFail: Bool

    private let sportsMock: Sports = Sports(sports: [
        Sport(
            idSport: "1",
            strSport: "Soccer",
            strFormat: StrFormat.teamvsTeam,
            strSportThumb: "thumb",
            strSportIconGreen: "soccer",
            strSportDescription: "Soccer description")
    ])

    init() {
        self.shouldFail = false
    }

    public func fetchSports(completion: @escaping (Result<Sports, Error>) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0) {
            completion(.success(self.sportsMock))
        }
    }
}
