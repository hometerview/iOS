//
//  MyPageRepositoryInterface.swift
//  hometerview
//
//  Created by Ok Hyeon Kim on 2022/12/05.
//

import Foundation
import Combine

protocol MyPageRepositoryInterface{
    func myReview(request: MyReviewRequest) -> AnyPublisher<MyReviewWrapper, Error>
}
