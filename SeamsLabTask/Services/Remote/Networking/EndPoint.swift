//
//  EndPoint.swift
//  SeamsLabTask
//
//  Created by ahmed mostafa on 31/01/2022.
//

import Alamofire

enum EndPoint {
    case fetchNews
}

extension EndPoint: TargetType {

    var base: String {
        switch self {
        default:
            return APIConstants.BaseURL
        }
    }
    var path: String {
        switch self {
        case .fetchNews:
            return "top-headlines?country=us&apiKey=\(APIConstants.ApiKey)"
        }
    }

    var method: HTTPMethod {
        switch self {
        case .fetchNews:
            return .get
        }
    }

    var task: Task {
        switch self {
        case .fetchNews:
            return .requestPlain
        }
    }

    var headers: HTTPHeaders {
        switch self {
        default:
            let header: HTTPHeaders = ["Content-Type": "application/json; charset=utf-8"]
            return header
        }
    }
    var sessionManager: Session  {
        switch self {
        default:
            let configuration = URLSessionConfiguration.af.default
            configuration.requestCachePolicy = .returnCacheDataElseLoad
            let responseCacher = ResponseCacher(behavior: .modify { _, response in
                return CachedURLResponse(
                    response: response.response,
                    data: response.data,
                    storagePolicy: .allowed)
            })
            return Session(
                configuration: configuration,
                cachedResponseHandler: responseCacher)
        }
    }
}
