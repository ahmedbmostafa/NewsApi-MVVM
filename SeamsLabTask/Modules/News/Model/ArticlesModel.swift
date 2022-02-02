//
//  ArticlesModel.swift
//  SeamsLabTask
//
//  Created by ahmed mostafa on 31/01/2022.
//

import Foundation

struct ArticlesModel: Decodable {
    var source: SourceModel?
    var title: String?
    var description: String?
    var urlToImage: String?
    var publishedAt: String?
    var content: String?
}

struct SourceModel: Decodable {
    var id: String?
    var name : String?
}
