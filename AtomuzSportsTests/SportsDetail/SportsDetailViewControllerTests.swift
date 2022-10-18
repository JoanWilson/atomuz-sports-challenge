//
//  SportsDetailViewControllerTests.swift
//  AtomuzSportsTests
//
//  Created by Joan Wilson Oliveira on 18/10/22.
//

import XCTest
@testable import AtomuzSports

final class SportsDetailViewControllerTests: XCTestCase {

    private var sut: SportsDetailViewController!

    override func setUpWithError() throws {
        let viewModel = SportsDetailViewModel(sport: .mock)
        sut = SportsDetailViewController(viewModel: viewModel)
        sut.loadView()
        sut.viewDidLoad()
        sut.viewWillLayoutSubviews()
        sut.viewDidLayoutSubviews()
        sut.viewWillDisappear(true)
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func test_loadView_MustAssignSportsDetailViewModelDelegate() {
        sut.loadView()
        sut.popToRootView()
        XCTAssertNotNil(sut as SportsDetailViewModelDelegate)
    }

    func test_requiredInit_ShouldReturnNil() {
        sut = SportsDetailViewController(coder: NSCoder.init())
        XCTAssertNil(sut)
    }

}
