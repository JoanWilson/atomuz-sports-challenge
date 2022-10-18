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
        sut.viewModel.filteredSports.value.append(.mock)
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

    func test_isTheLoadingFinished_ShouldChangeContentViewProperties() {
        XCTAssertTrue(self.sut.contentView.sportsTableView.isHidden)
        _ = sut.view
        sut.viewDidLoad()
        sut.loadView()
        sut.viewModel.filteredSports.value.append(.mock)
        sut.isTheLoadingFinished()
        DispatchQueue.main.asyncAfter(deadline: .now()+2) {
            XCTAssertFalse(self.sut.contentView.sportsTableView.isHidden)
        }
    }

    func test_tableView_ShouldCreateAViewForHeaderInSection() {
        let view = sut.tableView(sut.contentView.sportsTableView, viewForHeaderInSection: 0)
        XCTAssertNotNil(view)
    }

    func test_tableView_HeightForHeaderInSectionMustReturn3() {
        sut.viewDidLoad()
        sut.viewModel.filteredSports.value.append(.mock)
        let height = sut.tableView(sut.contentView.sportsTableView, heightForHeaderInSection: 1)
        XCTAssertEqual(height, 3)
    }

    func test_tableView_HeightForRowAtMustReturn56() {
        sut.viewDidLoad()
        sut.viewModel.filteredSports.value.append(.mock)
        let height = sut.tableView(sut.contentView.sportsTableView, heightForRowAt: IndexPath(row: 0, section: 0))
        XCTAssertEqual(height, 56)
    }

    func test_numberOfSections_MustReturnViewModelSportsLength() {
        sut.viewDidLoad()
        sut.viewModel.filteredSports.value.append(.mock)
        let numberOfSections = sut.numberOfSections(in: sut.contentView.sportsTableView)
        XCTAssertEqual(numberOfSections, sut.viewModel.getSportsLength())
    }

    func test_tableView_CellForRowAtMustNotReturnNil() {
        sut.viewDidLoad()
        sut.viewModel.filteredSports.value.append(.mock)
        let cell = sut.tableView(sut.contentView.sportsTableView, cellForRowAt: IndexPath(row: 0, section: 0))
        XCTAssertNotNil(cell)
    }

    func test_tableView_DidSelectionRowAt() {
        sut.viewDidLoad()
        sut.viewModel.filteredSports.value.append(.mock)
        let navigationBarProperty = sut.navigationController?.navigationBar.isHidden
        sut.tableView(sut.contentView.sportsTableView, didSelectRowAt: IndexPath(row: 0, section: 0))
        XCTAssertNotEqual(navigationBarProperty, sut.viewModel.coordinator.navigationController.navigationBar.isHidden)

    }

    func test_searchBarTextDidBeginEditing_MustMakeIsSearchVariableToBeTrue() {
        sut.searchBarTextDidBeginEditing(sut.searchController.searchBar)
        XCTAssertTrue(sut.isSearch)
    }

    func test_searchBarTextDidEndEditing_MustMakeIsSearchVariableToBeFalse() {
        sut.searchBarTextDidEndEditing(sut.searchController.searchBar)
        XCTAssertFalse(sut.isSearch)
    }

    func test_searchBarCancelButtonClicked_MustMakeIsSearchVariableToBeFalse() {
        sut.searchBarCancelButtonClicked(sut.searchController.searchBar)
        XCTAssertFalse(sut.isSearch)
    }

    func test_searchBarSearchButtonClicked_MustMakeIsSearchVariableToBeFalse() {
        sut.searchBarSearchButtonClicked(sut.searchController.searchBar)
        XCTAssertFalse(sut.isSearch)
    }

    func test_searchBar_DidChangeMustChangeFilteredSports() {
        for index in Sport.mockWithTwoElements {
            sut.viewModel.filteredSports.value.append(index)
        }
        let filteredSportsLength = sut.viewModel.getSportsLength()
        sut.searchBar(sut.searchController.searchBar, textDidChange: "1")
        XCTAssertNotEqual(filteredSportsLength, sut.viewModel.filteredSports.value.count)
    }

}
