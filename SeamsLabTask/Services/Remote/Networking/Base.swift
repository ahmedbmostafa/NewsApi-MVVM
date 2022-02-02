//
//  Base.swift
//  SeamsLabTask
//
//  Created by ahmed mostafa on 31/01/2022.
//

import Alamofire

class BaseAPI<T: TargetType> {

    let sessionManager = EndPoint.fetchNews.sessionManager

    func fetchNews (target: T, completion: @escaping(Result<NewsModel?, AFError>) -> Void) {
        let method = HTTPMethod(rawValue: target.method.rawValue)
        sessionManager.request(target.base + target.path, method: method, encoding: JSONEncoding.default, headers: target.headers)
            .response { response in
                switch response.result {
                case.success:
                    guard let data = response.value else {return}
                    do {
                        let responseOBj = try JSONDecoder().decode(NewsModel.self, from: data!)
                        completion(.success(responseOBj))
                    }
                    catch let err{
                        debugPrint(err)
                    }
                case .failure(let err):
                    debugPrint(err)
                    completion(.failure(err))
                }
            }
    }
}
