//
//  MyPageRepository.swift
//  hometerview
//
//  Created by Ok Hyeon Kim on 2022/12/05.
//

import Foundation
import Combine

struct MyPageRepository: MyPageRepositoryInterface {
    private let service: MyPageServiceInterface

    init(service: MyPageServiceInterface = MyPageService()) {
        self.service = service
    }

    func myReview(request: MyReviewRequest) -> AnyPublisher<MyReviewWrapper, Error> {
        return service.myReview(request: request)
            .map({ $0.toDomain() })
            .eraseToAnyPublisher()
    }
}
