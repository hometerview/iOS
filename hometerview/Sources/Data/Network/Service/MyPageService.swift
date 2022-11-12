//
//  MyPageService.swift
//  hometerview
//
//  Created by Ok Hyeon Kim on 2022/09/12.
//

import Foundation

import Alamofire
import Combine

protocol MyPageServiceInterface {
    func myReview(request: MyReviewRequest) -> AnyPublisher<MyReviewWrapper, Error>
}

struct MyPageService: MyPageServiceInterface {
    private let network: BaseNetwork

    init(baseNetwork: BaseNetwork = BaseNetworkImpl()) {
        self.network = baseNetwork
    }

    func myReview(request: MyReviewRequest) -> AnyPublisher<MyReviewWrapper, Error> {
        return network.request(api: request)
            .map{ $0.toDomain() }
            .eraseToAnyPublisher()
    }
}
