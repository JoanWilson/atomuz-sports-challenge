//
//  SportsListViewControllerTests.swift
//  AtomuzSportsTests
//
//  Created by Joan Wilson Oliveira on 17/10/22.
//

import XCTest
@testable import AtomuzSports

final class SportsListViewControllerTests: XCTestCase {

    private var sut: SportsListViewController!

    override func setUpWithError() throws {
        let client = SportsClientMock()
        let coordinator = SportsListCoordinator(navigationController: UINavigationController())
        let viewModel = SportsListViewModel(client: client, coordinator: coordinator)
        sut = SportsListViewController(viewModel: viewModel)
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func test_viewDidLoad_MustLoadAndConfigureTheController() {
        _ = sut.view
        sut.viewDidLoad()
        XCTAssertTrue(sut.isViewLoaded)
    }

    func test_addBinders_MustLoadTheTableView() {
        sut.viewDidLoad()
        sut.viewModel.filteredSports.value.append(Sport(
            idSport: "",
            strSport: "Test",
            strFormat: StrFormat.eventSport,
            strSportThumb: "",
            strSportIconGreen: "",
            strSportDescription: "")
        )
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            XCTAssertGreaterThan(0, self.sut.viewModel.getSportsLength())
            XCTAssertTrue(self.sut.contentView.progressView.isHidden)
            XCTAssertFalse(self.sut.contentView.sportsTableView.isHidden)
        }
    }

    func test_requiredInit_ShouldReturnAViewController() {
        let someView = SportsListViewController(coder: NSCoder())
        XCTAssertNil(someView)
    }

}
