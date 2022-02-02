//
//  Service.swift
//  SeamsLabTask
//
//  Created by ahmed mostafa on 31/01/2022.
//

import Alamofire

protocol NewsServiceProtocol {
    func fetchNews(completion: @escaping (Result<NewsModel?, AFError>) -> Void)
}

class NewsServiceImp: BaseAPI<EndPoint>, NewsServiceProtocol {

    func fetchNews(completion: @escaping (Result<NewsModel?, AFError>) -> Void) {
        self.fetchNews(target: .fetchNews) { (result) in
            completion(result)
        }
    }
}
