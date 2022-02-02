//
//  NewsCoordinator.swift
//  SeamsLabTask
//
//  Created by ahmed mostafa on 31/01/2022.
//

import Foundation
import UIKit

protocol NewsCoordinatorProtocol {
    func navigateToArticleVC(withArticle article: ArticlesModel?)
}

class NewsCoordinatorImpl: NewsCoordinatorProtocol {
    weak var view: UIViewController?
    var appFlowManager: AppFlowManager?
    init(view: UIViewController?) {
        self.view = view
    }
}

extension NewsCoordinatorImpl {
    func navigateToArticleVC(withArticle article: ArticlesModel?) {
        appFlowManager = AppFlowManager()
        let vc = appFlowManager?.coordinateToArticleVC(article: article)
        view?.navigationController?.pushViewController(vc!, animated: true)
    }
}
