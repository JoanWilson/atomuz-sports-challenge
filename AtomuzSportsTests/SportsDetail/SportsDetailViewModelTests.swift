//
//  SportsDetailViewModelTests.swift
//  AtomuzSportsTests
//
//  Created by Joan Wilson Oliveira on 18/10/22.
//

import XCTest
@testable import AtomuzSports

final class SportsDetailViewModelTests: XCTestCase {

    private var sut: SportsDetailViewModel!

    override func setUpWithError() throws {
        sut = SportsDetailViewModel(sport: .mock)
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func test_backToSportsListView_PopViewWithDelegate() {
        let sportsViewController = SportsDetailViewController(viewModel: sut)
        sut.delegate = sportsViewController
        sut.backToSportsListView()
        XCTAssertNotNil(sut.delegate)
    }

}
