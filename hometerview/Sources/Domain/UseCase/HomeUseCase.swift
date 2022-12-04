//
//  HomeUseCase.swift
//  hometerview
//
//  Created by Ok Hyeon Kim on 2022/12/04.
//

import Foundation
import Combine

protocol HomeUseCaseInterface {
    func fetchHomeReview(requestDTO: HomeReviewRequestDTO) -> AnyPublisher<HomeReview, Error>
}

class HomeUseCase: HomeUseCaseInterface {
    let homeService: HomeServiceInterface

    // HomeService or 영구 저장소 구현 예정
    init(service: HomeServiceInterface) {
        self.homeService = service
    }

    func fetchHomeReview(requestDTO: HomeReviewRequestDTO) -> AnyPublisher<HomeReview, Error> {
        let request = requestDTO.toData()
        return homeService.homeReview(request: request)
    }
}
