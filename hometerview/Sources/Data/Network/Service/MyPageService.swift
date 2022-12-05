//
//  MyPageService.swift
//  hometerview
//
//  Created by Ok Hyeon Kim on 2022/09/12.
//

import Foundation
import Combine

import Alamofire

protocol MyPageServiceInterface {
    func myReview(request: MyReviewRequest) -> AnyPublisher<MyReviewWrapperDTO, Error>
}

struct MyPageService: MyPageServiceInterface {
    private let network: BaseNetwork

    init(baseNetwork: BaseNetwork = BaseNetworkImpl()) {
        self.network = baseNetwork
    }

    func myReview(request: MyReviewRequest) -> AnyPublisher<MyReviewWrapperDTO, Error> {
        return network.request(api: request)
            .eraseToAnyPublisher()
    }
}
