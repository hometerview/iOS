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
}

struct HomeService: HomeServiceInterface {
    private let network: BaseNetwork

    init(baseNetwork: BaseNetwork = BaseNetworkImpl()) {
        self.network = baseNetwork
    }

    func homeReview(request: HomeReviewRequest) -> AnyPublisher<HomeReviewDTO, Error> {
        #warning("homeReview 네트워크 구현 필요")
        let mock = HomeReviewDTO(advantage: "좋음", buildingId: "idasdf", disadvantage: "매우 나쁨", rating: 3.4, reviewId: "reviewId", review: HomeReviewDetailDTO(advantage: "좋음", bookmarkCount: 3, buildingId: "idasdf", certification: ["a", "s"], companyId: "companyId", disadvantage: "매우 나쁨", floor: "3층", id: "reviewId", likeCount: 2, memberId: "memberId", period: 118273698, price: HomeReviewPriceDTO(deposit: "300", maintainFee: "20", monthly: "3"), rating: 3.4))

        return Just(mock)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
}
