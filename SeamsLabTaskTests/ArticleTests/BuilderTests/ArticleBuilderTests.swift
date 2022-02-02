//
//  ArticleBuilderTests.swift
//  SeamsLabTaskTests
//
//  Created by ahmed mostafa on 02/02/2022.
//

import XCTest
@testable import SeamsLabTask

class ArticleBuilderTests: XCTestCase {

    var view: ArticleVC!
    var appFlowManager: AppFlowManager!

    override func setUp() {
        super.setUp()

        appFlowManager = AppFlowManager()
        let news = try! JSONDecoder().decode(NewsModel.self, from: newsStub)
        view = appFlowManager.coordinateToArticleVC(article: news.articles?.first) as! ArticleVC

    }

    override func tearDown() {
        super.tearDown()
        view = nil
    }

    func testBuildViewModel() {
        XCTAssertTrue(view.viewModel != nil)

    }

    func testBuildVC() {
        XCTAssertTrue(view != nil)
    }
}
