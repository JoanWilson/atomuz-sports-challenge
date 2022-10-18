//
//  SportsDetailView.swift
//  AtomuzSportsTests
//
//  Created by Joan Wilson Oliveira on 18/10/22.
//

import XCTest
@testable import AtomuzSports

final class SportsDetailViewTests: XCTestCase {

    private var sut: SportsDetailView!

    override func setUpWithError() throws {
        let viewModel = SportsDetailViewModel(sport: .mock)
        sut = SportsDetailView(frame: .zero, viewModel: viewModel)
    }

    override func tearDownWithError() throws {
       sut = nil
    }

    func test_layoutSubViews_MustExecuteViewCodingProtocol() {
        sut.layoutSubviews()
        XCTAssertNotNil(sut as ViewCoding)
    }

    func test_requiredInit_ShouldReturnNil() {
        let view = SportsDetailView(coder: NSCoder())
        XCTAssertNil(view)
    }

    func test_sportsDetailViewComponents_MustAssignViewCodingProtocol() {
        let header = SportsDetailAboutView()
        let description = SportsDetailHeaderView()
        header.layoutSubviews()
        description.layoutSubviews()
        XCTAssertNotNil(header as ViewCoding)
        XCTAssertNotNil(description as ViewCoding)
    }

    func test_sportsDetailFactory_MustReturnAnUIView() {
        var viewModel = SportsDetailViewModel(sport: .mock)
        let aboutView = SportsDetailComponentsFactory.aboutView.build(viewModel: viewModel)
        let headerView = SportsDetailComponentsFactory.headerView.build(viewModel: viewModel)
        XCTAssertNotNil(aboutView)
        XCTAssertNotNil(headerView)
    }
}
