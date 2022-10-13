//
//  SportsUseCase.swift
//  AtomuzSports
//
//  Created by Joan Wilson Oliveira on 13/10/22.
//

import Foundation

protocol SportsUseCasesProtocol: AnyObject {
    func fetchAllSports(completion: @escaping (Sports) -> Void)
    func getSportsResponse() -> Sports?
    func fetchAnImageFromUrl(_ urlString: String) -> Data?
}

public final class SportsUseCase: SportsUseCasesProtocol {

    private var response: Sports?
    private let service: SportsClientProtocol

    init(service: SportsClientProtocol) {
        self.service = service
    }

    public func fetchAllSports(completion: @escaping (Sports) -> Void) {
        service.fetchSports { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let sports):
                self.response = sports
                completion(sports)
            case .failure(let error):
                print(error)
            }
        }
    }

    public func fetchAnImageFromUrl(_ urlString: String) -> Data? {
        guard let url = URL(string: urlString) else {
            print("Failed to get URL")
            return nil
        }

        do {
            let data = try Data(contentsOf: url)
            return data
        } catch {
            print("Failed to get image from url \(error)")
            return nil
        }

    }

    public func getSportsResponse() -> Sports? {
        guard let sportsResponse = self.response else {
            return nil
        }
        return sportsResponse
    }

}
