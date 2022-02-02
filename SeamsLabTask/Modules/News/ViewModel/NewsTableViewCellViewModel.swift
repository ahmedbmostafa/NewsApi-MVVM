//
//  NewsTableViewCellViewModel.swift
//  SeamsLabTask
//
//  Created by ahmed mostafa on 31/01/2022.
//

import Foundation

class NewsTableViewCellViewModel {

    var articleTitle: String
    var articleImage: String
    var articleSourceName: String
    var article: ArticlesModel?

    init(_ article: ArticlesModel?){
        self.article = article
        self.articleTitle = article?.title ?? ""
        self.articleImage = article?.urlToImage ?? ""
        self.articleSourceName = article?.source?.name ?? ""
    }
    
}
