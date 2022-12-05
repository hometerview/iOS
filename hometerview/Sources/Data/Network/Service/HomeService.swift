//
//  HomeService.swift
//  hometerview
//
//  Created by Ok Hyeon Kim on 2022/12/04.
//

import Foundation
import Combine

import Alamofire

protocol HomeServiceInterface {
    func homeReview(request: HomeReviewRequest) -> AnyPublisher<HomeReviewDTO, Error>
    func homeCities(request: HomeCitiesRequest) -> AnyPublisher<[HomeCitiesDTO], Error>
}

struct HomeService: HomeServiceInterface {
    private let network: BaseNetwork

    init(baseNetwork: BaseNetwork = BaseNetworkImpl()) {
        self.network = baseNetwork
    }

    func homeReview(request: HomeReviewRequest) -> AnyPublisher<HomeReviewDTO, Error> {
        #warning("homeReview 네트워크 구현 필요")
        let mock = HomeReviewDTO(advantage: "좋음", buildingId: "idasdf", disadvantage: "매우 나쁨", rating: 3.4, reviewId: "reviewId", buildingType: "APARTMENT", buildingName: "아크로텔")

        return Just(mock)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }

    func homeCities(request: HomeCitiesRequest) -> AnyPublisher<[HomeCitiesDTO], Error> {
        #warning("homeReview 네트워크 구현 필요")
        let mock = [HomeCitiesDTO(cityId: "asdfg", cityName: "강남구"), HomeCitiesDTO(cityId: "asddfg", cityName: "서초구"), HomeCitiesDTO(cityId: "dasdfg", cityName: "동작구")]

        return Just(mock)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
}
