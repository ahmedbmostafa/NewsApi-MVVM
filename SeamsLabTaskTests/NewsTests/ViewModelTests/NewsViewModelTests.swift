//
//  NewsViewModelTests.swift
//  SeamsLabTaskTests
//
//  Created by ahmed mostafa on 02/02/2022.
//

import XCTest
@testable import SeamsLabTask

class NewsViewModelTests: XCTestCase {

    var  dataProvider: MockNewsDataProvider!
    var  viewModel: NewsViewModel!
    var  view = MockNewsVC()

    override func setUp() {
        super.setUp()

        dataProvider = MockNewsDataProvider()

        let coordinator = NewsCoordinatorImpl(view: UIViewController())
        viewModel = NewsViewModel(withDataProvider: dataProvider, andCoordinator: coordinator)

        dataProvider.delegate = viewModel
        view.viewModel = viewModel
        view.bindViewModelOutput()
    }

    override func tearDown() {
        super.tearDown()
        dataProvider = nil
        viewModel = nil
    }

    func testGetNewsMethod() {

        dataProvider.closure = { [unowned self] in
            let news = try! JSONDecoder().decode(NewsModel.self, from: newsStub)
            self.dataProvider.delegate?.onSuccess(news)
        }

        viewModel.getNews()

        let cellViewModel = viewModel.getNewsCellViewModel(index: 0)
        XCTAssert(cellViewModel.articleTitle == "Accidental Belichick text at center of coach\'s NFL discrimination lawsuit - CNN")
    }

    func testViewModelNumberOfRows() {

        dataProvider.closure = {  [unowned self] in
            let news = try! JSONDecoder().decode(NewsModel.self, from: newsStub)
            self.dataProvider.delegate?.onSuccess(news)
        }

        viewModel.getNews()

        XCTAssert(viewModel.numberOfNews == 1)

    }

}
