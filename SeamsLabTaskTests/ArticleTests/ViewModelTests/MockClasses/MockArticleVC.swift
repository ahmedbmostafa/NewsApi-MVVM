//
//  MockArticleVC.swift
//  SeamsLabTaskTests
//
//  Created by ahmed mostafa on 02/02/2022.
//

import XCTest
@testable import SeamsLabTask

class MockArticleVC: ArticleVC {

    var isArticleImage = false
    var isArticleDescription = false
    var isArticleContent = false
    var isArticleDate = false

    override func bindViewModelOutput() {
        viewModel.output = { [weak self] output in
            guard let self = self else { return }

            switch output {
            case .showArticleImage( _):
                self.isArticleImage = true
            case .showArticleeDescription( _):
                self.isArticleDescription = true
            case .showArticleContent( _):
                self.isArticleContent = true
            case .showArticlePublishedAt( _):
                self.isArticleDate = true
            }
        }
    }
}
