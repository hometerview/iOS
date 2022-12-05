//
//  MyPageUseCase.swift
//  hometerview
//
//  Created by Ok Hyeon Kim on 2022/09/12.
//

import Foundation
import Combine

protocol MyPageUseCaseInterface {
    func fetchMyReview(requestDTO: MyReviewRequestDTO) -> AnyPublisher<MyReviewWrapper, Error>
}

class MyPageUseCase: MyPageUseCaseInterface {
    let myPageRepository: MyPageRepositoryInterface

    init(repository: MyPageRepositoryInterface = MyPageRepository()) {
        self.myPageRepository = repository
    }

    func fetchMyReview(requestDTO: MyReviewRequestDTO) -> AnyPublisher<MyReviewWrapper, Error> {
        let request = requestDTO.toData()
        return myPageRepository.myReview(request: request)
    }
}
