//
//  HomeRepositoryInterface.swift
//  hometerview
//
//  Created by Ok Hyeon Kim on 2022/12/05.
//

import Foundation
import Combine

protocol HomeRepositoryInterface {
    func homeReview(request: HomeReviewRequest) -> AnyPublisher<HomeReview, Error>
}
