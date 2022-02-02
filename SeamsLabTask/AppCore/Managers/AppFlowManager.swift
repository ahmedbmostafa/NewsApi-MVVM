//
//  AppFlowManager.swift
//  SeamsLabTask
//
//  Created by ahmed mostafa on 31/01/2022.
//

import UIKit


class AppFlowManager {

    func start(navigationController: UINavigationController) {
        let vc = creatNewsVC()
        navigationController.pushViewController(vc, animated: false)
    }
}

extension AppFlowManager {

    func creatNewsVC() -> UIViewController {
        let newsVC = NewsVC.instantiate(fromAppStoryboard: .Main)
        let dataProvider = NewsDataProviderImpl()
        dataProvider.newsService = NewsServiceImp()
        let coordinator = NewsCoordinatorImpl(view: newsVC)
        let viewModel = NewsViewModel(withDataProvider: dataProvider, andCoordinator: coordinator)
        dataProvider.delegate = viewModel
        viewModel.dataProvider = dataProvider
        newsVC.viewModel = viewModel
        return newsVC
    }

    func coordinateToArticleVC(article: ArticlesModel?) -> UIViewController {
        let articleVC = ArticleVC.instantiate(fromAppStoryboard: .Main)
        let viewModel = ArticleViewModel(article)
        articleVC.viewModel = viewModel
        return articleVC
    }
}
