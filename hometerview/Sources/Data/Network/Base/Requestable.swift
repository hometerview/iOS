//
//  Requestable.swift
//  hometerview
//
//  Created by Ok Hyeon Kim on 2022/07/14.
//

import Foundation

import Alamofire

public protocol Requestable: URLRequestConvertible {
    var path: String { get }
    var baseURL: String { get }
    var method: HTTPMethod { get }
    var query: [String: AnyHashable]? { get }
    var requestParameters: RequestParams { get }
    var header: [HTTPField: String] { get }
}

extension Requestable {
    func asURLRequest() throws -> URLRequest {
        let endPoint = try baseURL.asURL()

        var urlRequest = try URLRequest(url: endPoint.appendingPathComponent(path), method: method)
        var components = URLComponents(string: endPoint.appendingPathComponent(path).absoluteString)

        for headerType in header {
            urlRequest.setValue(headerType.value, forHTTPHeaderField: headerType.key.description)
        }

        switch requestParameters {
            case .query(let request):
                let params = try request?.toDictionary() ?? [:]
                let queryParams = params.toQueryItems()

                components?.queryItems = queryParams
                urlRequest.url = components?.url
            case .body(let request):
                let params = try request?.toDictionary() ?? [:]
                urlRequest.httpBody = try params.toData()
        }

        return urlRequest
    }
}
