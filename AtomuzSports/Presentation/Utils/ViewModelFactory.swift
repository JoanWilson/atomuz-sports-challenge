//
//  ViewModel.swift
//  AtomuzSports
//
//  Created by Joan Wilson Oliveira on 12/10/22.
//  swiftlint:disable identifier_name

import Foundation

class ViewModel {
    func viewModelDidRemoved() {}

    deinit {
        self.viewModelDidRemoved()
    }
}

class ViewModelFactory {
    required init() {}

    func createViewModel<V: ViewModel>(V: V.Type) -> V? {
        return nil
    }
}

class ViewModelProvider {

    private static let provider = ViewModelProvider()

    fileprivate var map: [String: ViewModel] = [String: ViewModel]()

    static func of(viewModelFactory: ViewModelFactory, model: ViewModel.Type) -> ViewModel? {
        return provider.createViewModelFromFactory(factory: viewModelFactory, model: model)
    }

    fileprivate func createViewModelFromFactory(factory: ViewModelFactory, model: ViewModel.Type) -> ViewModel? {
           let hash = "viewmodelhash_\(model.self)"
            if let cachedV = map[hash] {
                print("called from cache")
                return cachedV
            }

            let viewModel = factory.createViewModel(V: model)
            map[hash] = viewModel
            return viewModel
        }

}
