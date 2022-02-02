//
//  ArticleViewModelTests.swift
//  SeamsLabTaskTests
//
//  Created by ahmed mostafa on 02/02/2022.
//

import XCTest
@testable import SeamsLabTask

class ArticleViewModelTests: XCTestCase {

    var  viewModel: ArticleViewModelProtocol!
    var  view = MockArticleVC()

    override func setUp() {
        super.setUp()
        let news = try! JSONDecoder().decode(NewsModel.self, from: newsStub)
        viewModel = ArticleViewModel(news.articles?.first)
        view.viewModel = viewModel
        view.bindViewModelOutput()
    }

    override func tearDown() {
        super.tearDown()
        viewModel = nil
    }

    func testViewDidLoad() {

        viewModel.didLoad()

        XCTAssertTrue(view.isArticleImage == true)
        XCTAssertTrue(view.isArticleDescription == true)
        XCTAssertTrue(view.isArticleContent == true)
        XCTAssertTrue(view.isArticleDate == true)
    }
}
