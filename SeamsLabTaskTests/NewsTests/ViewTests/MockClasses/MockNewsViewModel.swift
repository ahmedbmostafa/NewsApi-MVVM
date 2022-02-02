//
//  MockNewsViewModel.swift
//  SeamsLabTaskTests
//
//  Created by ahmed mostafa on 02/02/2022.
//

import XCTest
@testable import SeamsLabTask

class MockNewsViewModel: NewsViewModelProtocol {

    var dataProvider: NewsDataProviderProtocol!
    var coordinator: NewsCoordinatorProtocol!
    
    var isNumberOfRowsCalls = false
    var isGetNewsCellViewModelCalls = false
    var isDidSelectRowCalls = false

    var numberOfNews: Int {
        isNumberOfRowsCalls = true
        return 1
    }

    var output: NewsViewModelOutput?

    func getNewsCellViewModel(index: Int) -> NewsTableViewCellViewModel {
        isGetNewsCellViewModelCalls = true
        let news = try! JSONDecoder().decode(NewsModel.self, from: newsStub)
        return NewsTableViewCellViewModel(news.articles?.first )
    }

    func didSelectNews(index: Int) {
        isDidSelectRowCalls = true
    }

    func didLoad() {

    }
}
