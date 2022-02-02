//
//  NewsModel.swift
//  SeamsLabTask
//
//  Created by ahmed mostafa on 31/01/2022.
//

import Foundation

struct NewsModel: Decodable {
    var status: String?
    var totalResults: Int?
    var articles: [ArticlesModel]?
}
