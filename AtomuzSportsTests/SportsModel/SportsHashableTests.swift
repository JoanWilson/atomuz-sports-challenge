//
//  SportsHashableTests.swift
//  AtomuzSportsTests
//
//  Created by Joan Wilson Oliveira on 18/10/22.
//

import XCTest
@testable import AtomuzSports

final class SportsHashableTests: XCTestCase {

    func test_sport_ASportMustBeAbleToBeComparedToAnother() {
        let sportsA = Sports(sports: Sport.mockWithTwoElements)
        let sportsB = Sports(sports: Sport.mockWithTwoElements)
        XCTAssertEqual(sportsA, sportsB)
    }

    func test_sport_ASportMustBeHashable() {
        let sports = Sports(sports: Sport.mockWithTwoElements)
        XCTAssertNotNil(sports as any Hashable)
    }

}
