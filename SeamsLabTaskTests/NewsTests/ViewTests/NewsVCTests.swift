//
//  NewsVCTests.swift
//  SeamsLabTaskTests
//
//  Created by ahmed mostafa on 02/02/2022.
//

import XCTest
@testable import SeamsLabTask

class NewsVCTests: XCTestCase {

    var viewModel: MockNewsViewModel!
    var view: NewsVC!
    let mockTableView = UITableView()

    override func setUp() {
        super.setUp()
        viewModel = MockNewsViewModel()
        view = NewsVC.instantiate(fromAppStoryboard: .Main)
        view.viewModel = viewModel
        view.loadView()
    }

    override func tearDown() {
        super.tearDown()
        viewModel = nil
        view = nil
    }

    func testNumberOfRowsInSection() {
        _ = view.tableView(view.tableView, numberOfRowsInSection: 1)
        XCTAssertTrue(viewModel.isNumberOfRowsCalls == true)
    }

    func testCellDidSelectForRowAtIndex() {
        let indexPath = IndexPath(row: 0, section: 1)
        view.tableView(view.tableView, didSelectRowAt: indexPath)
        XCTAssertTrue(viewModel.isDidSelectRowCalls == true)
    }

}
