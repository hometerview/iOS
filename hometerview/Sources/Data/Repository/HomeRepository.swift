//
//  HomeRepository.swift
//  hometerview
//
//  Created by Ok Hyeon Kim on 2022/12/05.
//

import Foundation
import Combine

struct HomeRepository: HomeRepositoryInterface {
    private let service: HomeServiceInterface

    init(service: HomeServiceInterface = HomeService()) {
        self.service = service
    }

    func homeReview(request: HomeReviewRequest) -> AnyPublisher<HomeReview, Error> {
        return service.homeReview(request: request)
            .map({ $0.toDomain() })
            .eraseToAnyPublisher()
    }

    func homeCities(request: HomeCitiesRequest) -> AnyPublisher<[HomeCities], Error> {
        return service.homeCities(request: request)
            .map({ $0.map({ $0.toDomain() }) })
            .eraseToAnyPublisher()
    }
}
