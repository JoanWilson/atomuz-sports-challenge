//
//  FavoritesViewModel.swift
//  AtomuzSports
//
//  Created by Joan Wilson Oliveira on 19/10/22.
//  swiftlint:disable line_length

import Foundation
import UIKit

final class FavoritesViewModel {

    var favoriteSports: ObservableObject<[Sport]> = ObservableObject([Sport(idSport: "Test", strSport: "Test", strFormat: StrFormat.eventSport, strSportThumb: "test", strSportIconGreen: "test", strSportDescription: "test")])

    init() {
        self.downloadFavoriteSports()
    }

    public func downloadFavoriteSports() {

    }

    public func makeSportsTableViewCell(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        guard let sportsCell = tableView.dequeueReusableCell(
            withIdentifier: SportsTableViewCell.indentifier,
            for: indexPath
        ) as? SportsTableViewCell else {
            return UITableViewCell()
        }
        let sports: [Sport] = self.favoriteSports.value
        sportsCell.setSport(with: sports[indexPath.section])
        sportsCell.selectionStyle = .none
        return sportsCell
    }

    public func getSportsLength() -> Int {
        return self.favoriteSports.value.count
    }

    public func makeViewHeaderForTableViewSection() -> UIView {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        return headerView
    }

//    public func showCellDetail(index: Int) {
//
//    }
}
