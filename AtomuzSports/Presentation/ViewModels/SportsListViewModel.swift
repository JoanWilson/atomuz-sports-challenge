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
    var sports: ObservableObject<Sports> = ObservableObject(Sports(sports: []))

    private let client: SportsClientProtocol
    public let coordinator: SportsListCoordinator

    init(client: SportsClientProtocol, coordinator: SportsListCoordinator) {
        self.client = client
        self.coordinator = coordinator
        self.downloadAllSports()
    }

    private func downloadAllSports() {
        client.fetchSports { [weak self] result in
            guard let self = self else { return }

            switch result {
            case .success(let sports):
                self.sports.value = sports
            case .failure(let error):
                print(error)
            }
        }
    }

    public func getSportsLength() -> Int {
        return self.sports.value.sports.count
    }

    public func getSportsObjectArrayOrdered() -> [Sport] {
        return self.sports.value.sports.sorted { $0.strSport < $1.strSport }
    }

//    public func getGreenIconImageSportArray() -> [UIImage] {
//        return self.sportsGreenIcons.value
//    }

    public func getSportByIndex(index: Int) -> Sport {
        return self.getSportsObjectArrayOrdered()[index]
    }

}
