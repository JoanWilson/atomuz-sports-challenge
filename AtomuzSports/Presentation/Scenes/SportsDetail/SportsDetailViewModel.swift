//
//  SportsDetailViewModel.swift
//  AtomuzSports
//
//  Created by Joan Wilson Oliveira on 12/10/22.
//

import Foundation

protocol SportsDetailViewModelDelegate: AnyObject {
    func popToRootView()
}

class SportsDetailViewModel {

    weak var delegate: SportsDetailViewModelDelegate?

    public var sport: Sport

    init(sport: Sport) {
        self.sport = sport
    }

    @objc func backToSportsListView() {
        delegate?.popToRootView()
    }

}
