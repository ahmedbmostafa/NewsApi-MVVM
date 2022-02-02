//
//  ArticleViewModel.swift
//  SeamsLabTask
//
//  Created by ahmed mostafa on 01/02/2022.
//

import Foundation

typealias ArticleModelOutput = (ArticleViewModel.Output) -> ()

protocol ArticleViewModelProtocol {
    var output: ArticleModelOutput? { get set }
    func didLoad()
    func checkRateText(text: String)-> Bool
}

class ArticleViewModel: ArticleViewModelProtocol {

    enum Output {
        case showArticleImage(url: URL)
        case showArticleeDescription(description: String)
        case showArticleContent(content: String)
        case showArticlePublishedAt(date: String)
    }

    var output: ArticleModelOutput?
    private var article: ArticlesModel?

    var imageUrl: URL? {
        return URL(string: article?.urlToImage ?? "")
    }

    var articleDate: String {
        return article?.publishedAt ?? ""
    }

    func didLoad() {
        showImage()
        output?(.showArticleeDescription(description: article?.description ?? ""))
        output?(.showArticleContent(content: article?.content ?? ""))
        output?(.showArticlePublishedAt(date: articleDate.convertDate()))
    }

    init(_ article: ArticlesModel?) {
        self.article = article
    }

    private func showImage() {
        guard let imageUrl = imageUrl else {return}
        output?(.showArticleImage(url: imageUrl))
    }

     func checkRateText(text: String)-> Bool {
        if text.checkRate() {
            return true
        } else {
            return false
        }
    }
}
