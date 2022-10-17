//
//  ViewControllerFactory.swift
//  AtomuzSports
//
//  Created by Joan Wilson Oliveira on 17/10/22.
//

import Foundation
import UIKit

enum SportsDetailComponentsFactory {
    case aboutView
    case headerView
}

extension SportsDetailComponentsFactory {
    func build(viewModel: SportsDetailViewModel) -> UIView {
        switch self {
        case .aboutView:
            return buildAboutView(viewModel: viewModel)
        case .headerView:
            return buildHeadertView(viewModel: viewModel)
        }
    }
}

extension SportsDetailComponentsFactory {
    private func buildAboutView(viewModel: SportsDetailViewModel) -> UIView {

        let view = SportsDetailAboutView()
        view.sportDescriptionLabel.text = viewModel.sport.strSportDescription
        view.sportFormatLabel.text = viewModel.sport.strFormat.rawValue
        view.sportGreenIcon.load(url: URL(string: viewModel.sport.strSportIconGreen)!)
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }

    private func buildHeadertView(viewModel: SportsDetailViewModel) -> UIView {

        let headerView = SportsDetailHeaderView()
        headerView.sportsHeaderImage.load(url: URL(string: viewModel.sport.strSportThumb)!)
        headerView.headerLabel.text = viewModel.sport.strSport
        headerView.translatesAutoresizingMaskIntoConstraints = false

        return headerView
    }
}
