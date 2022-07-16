//
//  MainService.swift
//  hometerview
//
//  Created by Ok Hyeon Kim on 2022/07/16.
//

import Foundation

import Alamofire

struct MainService {
    let session = AF

    func request(request: HomeRequest) {
        session.request(HomeTarget.home(request))
            .validate(statusCode: 200..<500)
//            .publishDecodable(type: T.self)
    }
}
