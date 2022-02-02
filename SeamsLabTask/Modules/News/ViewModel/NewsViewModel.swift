//
//  NewsViewModel.swift
//  SeamsLabTask
//
//  Created by ahmed mostafa on 31/01/2022.
//

import Foundation
import Alamofire

typealias NewsViewModelOutput = (NewsViewModel.Output) -> ()

protocol NewsViewModelProtocol {
    var dataProvider: NewsDataProviderProtocol! {get}
    var coordinator: NewsCoordinatorProtocol! {get}
    var numberOfNews: Int { get }
    var output: NewsViewModelOutput? { get set }
    func getNewsCellViewModel(index : Int) -> NewsTableViewCellViewModel
    func didSelectNews(index : Int)
    func didLoad()
}

class NewsViewModel: NewsViewModelProtocol{

    enum Output {
        case reloadNews
        case showActivityIndicator(show: Bool)
        case showError(error: Error)
    }

    var dataProvider: NewsDataProviderProtocol!
    var coordinator: NewsCoordinatorProtocol!

    init(withDataProvider dataProvider: NewsDataProviderProtocol,andCoordinator coordinator: NewsCoordinatorProtocol) {
        self.dataProvider = dataProvider
        self.coordinator = coordinator
    }

    var output: NewsViewModelOutput?

    private var allNewsViewModels = [NewsTableViewCellViewModel]() {
        didSet {
            output?(.reloadNews)
        }
    }

    private var newsDataSourceViewModels: [NewsTableViewCellViewModel] {
        return allNewsViewModels
    }

    var numberOfNews: Int {
        return newsDataSourceViewModels.count
    }

    func getNewsCellViewModel(index: Int) -> NewsTableViewCellViewModel {
        return newsDataSourceViewModels[index]
    }

    func didSelectNews(index: Int) {
        coordinator.navigateToArticleVC(withArticle: getNewsCellViewModel(index: index).article)
    }

    func didLoad() {
        getNews()
    }

    func getNews() {
        dataProvider.fetchNews()
    }
}

extension NewsViewModel: NewsDataProviderDelegate {

    func showLoader(show: Bool) {
        output?(.showActivityIndicator(show: show))
    }

    func onSuccess(_ news: NewsModel) {
        guard let articles = news.articles else { return }
        allNewsViewModels.append(contentsOf: articles.map { NewsTableViewCellViewModel.init($0) })
    }

    func onFailure(_ error: AFError) {
         output?(.showError(error: error))
    }
}
