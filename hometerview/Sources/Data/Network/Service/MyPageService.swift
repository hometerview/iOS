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
    let session = AF

    func myReview(request: MyReviewRequest) -> AnyPublisher<MyReviewWrapper, Error> {
        session.request(MyReviewTarget.myReview(request))
            .validate(statusCode: 200..<500)
            .publishDecodable(type: MyReviewWrapperDTO.self)
            .subscribe(on: DispatchQueue.global())
            .receive(on: DispatchQueue.main)
            .tryCompactMap { response -> MyReviewWrapperDTO in
                guard let myReviewWrapperDTO = response.value else {
                    throw NetworkError.unknown
                }

                return myReviewWrapperDTO
            }
            .map({
                $0.toDomain()
            })
            .eraseToAnyPublisher()
    }
}
