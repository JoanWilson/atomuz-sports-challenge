//
//  SportsListViewModel.swift
//  AtomuzSports
//
//  Created by Joan Wilson Oliveira on 12/10/22.
//

import Foundation

final class SportsListViewModel {
    var sports: ObservableObject<Sports> = ObservableObject(Sports(sports: []))
    private let client: SportsClientProtocol

    init(client: SportsClientProtocol) {
        self.client = client
        downloadAllSports()
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

    public func getSportsName() -> [String] {
        var sportsName: [String] = []
        for index in self.sports.value.sports {
            sportsName.append(index.strSport)
        }
        return sportsName
    }

}
