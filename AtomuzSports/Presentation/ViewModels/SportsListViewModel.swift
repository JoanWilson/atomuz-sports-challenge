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
    var sportsGreenIcons: ObservableObject<[UIImage]> = ObservableObject([])
    var finishFetching: ObservableObject<Bool> = ObservableObject(false)
    private let client: SportsClientProtocol

    init(client: SportsClientProtocol) {
        self.client = client
        self.downloadAllSports()
        self.fetchImageForGreenIconImageSportArray()
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

    public func getIconImageSport(for sport: Sport) -> UIImage? {
        let urlString = sport.strSportIconGreen
        guard let url = URL(string: urlString) else {
            print("Failed to get URL")
            return nil
        }

        do {
            let data = try Data(contentsOf: url)
            return UIImage(data: data)
        } catch {
            print("Failed to get image from url \(error)")
            return nil
        }
    }

    private func fetchImageForGreenIconImageSportArray() {
        DispatchQueue.global().async {
            let sports = self.getSportsObjectArrayOrdered()
            for index in sports {
                let greenIconImage = self.getIconImageSport(for: index)
                self.sportsGreenIcons.value.append(greenIconImage!)
            }
            self.finishFetching.value = true
        }

    }

    public func getGreenIconImageSportArray() -> [UIImage] {
        return self.sportsGreenIcons.value
    }

}
