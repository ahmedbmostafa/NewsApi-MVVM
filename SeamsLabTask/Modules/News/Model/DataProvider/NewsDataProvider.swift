//
//  NewsDataProvider.swift
//  SeamsLabTask
//
//  Created by ahmed mostafa on 31/01/2022.
//

import Foundation
import Alamofire

protocol NewsDataProviderDelegate: class {
    func onSuccess(_ news: NewsModel)
    func onFailure(_ error: AFError)
    func showLoader(show: Bool)
}

protocol NewsDataProviderProtocol {
    func fetchNews()
    var delegate: NewsDataProviderDelegate? { get set }
}

class NewsDataProviderImpl: NewsDataProviderProtocol {

    var newsService: NewsServiceProtocol!

    private var isFetching = false

    weak var delegate: NewsDataProviderDelegate?

    func fetchNews() {
        isFetching = true
        delegate?.showLoader(show: isFetching)
        newsService.fetchNews { [weak self] result in
            guard let self = self else { return }
            self.isFetching = false
            self.delegate?.showLoader(show: self.isFetching)

            switch result {
            case .success(let results):
                guard let data = results else { return }
                self.delegate?.onSuccess(data)
            case .failure(let error):
                self.delegate?.onFailure(error)
            }
        }
    }
}
