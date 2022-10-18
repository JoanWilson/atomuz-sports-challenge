//
//  SportsTableViewCellTests.swift
//  AtomuzSportsTests
//
//  Created by Joan Wilson Oliveira on 18/10/22.
//

import XCTest
@testable import AtomuzSports

final class SportsTableViewCellTests: XCTestCase {

    private var sut: SportsTableViewCell!

    override func setUpWithError() throws {
        sut = SportsTableViewCell()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func test_layoutSubviews_MustExecuteViewCodingProtocol() {
        sut.layoutSubviews()
        XCTAssertNotNil(sut as ViewCoding)
    }

    func test_prepareForReuse_MustAssignSportsIconImageViewAnUIImage() {
        sut.prepareForReuse()
        XCTAssertNotNil(sut.sportsIconImageView.image! as UIImage)

    }

    func test_setSport_MustChangeTheSportVariable() {
        sut.setSport(with: Sport.mock)
        XCTAssertEqual(sut.sport?.strSport, Sport.mock.strSport)
    }

}
