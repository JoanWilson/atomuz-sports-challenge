//
//  SportsListViewModelTests.swift
//  AtomuzSportsTests
//
//  Created by Joan Wilson Oliveira on 17/10/22.
//

import XCTest
@testable import AtomuzSports

public final class SportsListViewModelTests: XCTestCase {

    private var sut: SportsListViewModel!

    public override func setUpWithError() throws {
        let navigation = UINavigationController()
        let client = SportsClientMock()
        let coordinator = SportsListCoordinator(navigationController: navigation)
        sut = SportsListViewModel(client: client, coordinator: coordinator)
        sut.downloadAllSports()
        sut.filteredSports.value.append(
            Sport(
                idSport: "",
                strSport: "",
                strFormat: StrFormat.teamvsTeam,
                strSportThumb: "",
                strSportIconGreen: "",
                strSportDescription: ""
            ))
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

    func test_makeSportsTableViewCell_ShouldReturnACell() {
        let sportsListViewController = SportsListViewController(viewModel: sut)
        let tableView = sportsListViewController.contentView.sportsTableView

        let cell = sut.makeSportsTableViewCell(tableView: tableView, indexPath: IndexPath(row: 0, section: 0))
        XCTAssertNotNil(cell)
    }

    func test_makeViewHeaderForTableViewSection_ShoultReturnAnUIView() {
        let header = sut.makeViewHeaderForTableViewSection()
        XCTAssertNotNil(header)
    }
}
