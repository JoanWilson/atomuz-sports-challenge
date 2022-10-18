//
//  SportsClientTests.swift
//  AtomuzSportsTests
//
//  Created by Joan Wilson Oliveira on 12/10/22.
//

import XCTest
@testable import AtomuzSports

final class SportsClientTests: XCTestCase {

    func test_responseClient() {
        let sut = SportsClientMock()
        var _: Sports = Sports(sports: [])
        sut.fetchSports { response in
            XCTAssertNotNil(response)
        }

    }

}
