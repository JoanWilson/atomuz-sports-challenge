//
//  SportsListViewModelTests.swift
//  AtomuzSportsTests
//
//  Created by Joan Wilson Oliveira on 17/10/22.
//

import XCTest
@testable import AtomuzSports

extension Sport {
    static var mock = Sport(
        idSport: "",
        strSport: "",
        strFormat: StrFormat.teamvsTeam,
        strSportThumb: "",
        strSportIconGreen: "",
        strSportDescription: ""
    )
}

public final class SportsListViewModelTests: XCTestCase {

    private var sut: SportsListViewModel!

    public override func setUpWithError() throws {
        let navigation = UINavigationController()
        let client = SportsClientMock()
        let coordinator = SportsListCoordinator(navigationController: navigation)
        sut = SportsListViewModel(client: client, coordinator: coordinator)
        sut.downloadAllSports()
        sut.filteredSports.value.append(.mock)
    }

    public override func tearDownWithError() throws {
        sut = nil
    }

    func test_downloadAllSports_ShouldReturnNotNil() {
        XCTAssertNotNil(sut.getAllSport())
    }

    func test_filterSports_MustChangeFilteredSportsVariableToZeroWhenNotValid() {
        sut.filterSports(by: "INVALID_SPORT_NAME")
        XCTAssertEqual(sut.filteredSports.value.count, 0)
    }

    func test_getSportsLength_ShouldReturn1() {
        sut.filteredSports.value.append(
            Sport(
                idSport: "",
                strSport: "",
                strFormat: StrFormat.teamvsTeam,
                strSportThumb: "",
                strSportIconGreen: "",
                strSportDescription: ""
            )
        )
        XCTAssertEqual(sut.getSportsLength(), 2)
    }

    func test_makeSportsTableViewCell_ShouldReturnACustomCell() {
        let sportsListViewController = SportsListViewController(viewModel: sut)
        let tableView = sportsListViewController.contentView.sportsTableView

        let cell = sut.makeSportsTableViewCell(tableView: tableView, indexPath: IndexPath(row: 0, section: 0))
        // swiftlint:disable force_cast
        XCTAssertNotNil(cell as! SportsTableViewCell)
    }

    func test_makeSportsTableViewCell_MustReturnANotCustomTableViewCell() {
        let sportsListViewController = SportsListViewController(viewModel: sut)
        let tableView = sportsListViewController.contentView.sportsTableView
        let cell = sut.makeSportsTableViewCell(tableView: tableView, indexPath: IndexPath(row: 0, section: 0))
        XCTAssertNotNil(cell as UITableViewCell)
    }

    func test_makeViewHeaderForTableViewSection_ShoultReturnAnUIView() {
        let header = sut.makeViewHeaderForTableViewSection()
        XCTAssertNotNil(header)
    }

    func test_getSportByIndex_MustReturnADesiredSport() {
        let sport = sut.getSportByIndex(index: 0)
        XCTAssertNotNil(sport)
    }

    func test_filterSports_MustFilteredSportsVariableBeEqualToSportsVariable() {
        sut.filterSports(by: "")
        XCTAssertEqual(sut.filteredSports.value.count, sut.sports.value.count)
    }

    func test_filterSports_MustAppendToFilteredSportsWhenSportsContainsSearchText() {
        sut.sports.value.append(Sport(
            idSport: "",
            strSport: "Test",
            strFormat: StrFormat.eventSport,
            strSportThumb: "nil",
            strSportIconGreen: "nil",
            strSportDescription: "nil")
        )
        sut.filterSports(by: "Test")
        XCTAssertEqual(sut.filteredSports.value[0].strSport, "Test")
    }

    func test_showCellDetail_MustPushToSportsDetailViewController() {
        sut.filteredSports.value.append(
            Sport(
                idSport: "",
                strSport: "",
                strFormat: StrFormat.teamvsTeam,
                strSportThumb: "",
                strSportIconGreen: "",
                strSportDescription: ""
            )
        )
        sut.coordinator.start()
        let firstViewController =  sut.coordinator.navigationController.viewControllers.first
        sut.showCellDetail(index: 0)
        let currentViewController =  sut.coordinator.navigationController.visibleViewController
        XCTAssertEqual(firstViewController, currentViewController)
    }

}
