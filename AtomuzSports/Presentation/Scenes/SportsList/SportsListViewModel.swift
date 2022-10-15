//
//  SportsListViewModel.swift
//  AtomuzSports
//
//  Created by Joan Wilson Oliveira on 12/10/22.
//

import Foundation
import UIKit

enum SportsListViewModelErrorL: Error {
    case failedGetURL
    case unableToGetImage
    case errorToDownloadAllSports
}

final class SportsListViewModel {
    var sports: ObservableObject<[Sport]> = ObservableObject([])
    var filteredSports: ObservableObject<[Sport]> = ObservableObject([])
    //    var sportsA: [Sport] = []

    private let client: SportsClientProtocol
    public let coordinator: SportsListCoordinator

    init(client: SportsClientProtocol, coordinator: SportsListCoordinator) {
        self.client = client
        self.coordinator = coordinator
        self.downloadAllSports()
    }

    func filterSports(by searchText: String) {
        self.filteredSports.value = []
        if searchText == "" {
            self.filteredSports.value = self.sports.value
        } else {
            for index in self.sports.value where index.strSport.lowercased().contains(searchText.lowercased()) {
                self.filteredSports.value.append(index)
            }
        }
    }

    private func downloadAllSports() {
        print(#function)
        client.fetchSports { [weak self] result in
            guard let self = self else { return }

            switch result {
            case .success(let sports):
                self.filteredSports.value = sports.sports.sorted { $0.strSport < $1.strSport }
                self.sports.value = sports.sports.sorted { $0.strSport < $1.strSport }
            case .failure(let error):
                print(error)
            }
        }
    }

    public func getSportsLength() -> Int {
        return self.filteredSports.value.count
    }

    //    public func getSportsObjectArrayOrdered() -> [Sport] {
    //        return self.sports.value.sports.sorted { $0.strSport < $1.strSport }
    //    }

    //    public func getGreenIconImageSportArray() -> [UIImage] {
    //        return self.sportsGreenIcons.value
    //    }

    public func getSportByIndex(index: Int) -> Sport {
        return self.filteredSports.value[index]
    }

    public func makeSportsTableViewCell(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        guard let sportsCell = tableView.dequeueReusableCell(
            withIdentifier: SportsTableViewCell.indentifier,
            for: indexPath
        ) as? SportsTableViewCell else {
            return UITableViewCell()
        }
        let sports: [Sport] = self.filteredSports.value
        sportsCell.setSport(with: sports[indexPath.section])
        sportsCell.selectionStyle = .none
        return sportsCell
    }

    public func makeViewHeaderForTableViewSection() -> UIView {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        return headerView
    }

    public func showCellDetail(index: Int) {
        self.coordinator.showDetail(for: self.filteredSports.value[index])
    }

}
