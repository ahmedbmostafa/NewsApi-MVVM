//
//  NewsBuilderTests.swift
//  SeamsLabTaskTests
//
//  Created by ahmed mostafa on 02/02/2022.
//

import XCTest
@testable import SeamsLabTask

class NewsBuilderTests: XCTestCase {

    var view: NewsVC!
    var appFlowManager: AppFlowManager!

    override func setUp() {
        super.setUp()
        appFlowManager = AppFlowManager()
        view = appFlowManager.creatNewsVC() as! NewsVC
    }

    override func tearDown() {
        super.tearDown()
        view = nil
    }

    func testBuildViewModel() {
        XCTAssertTrue(view.viewModel != nil)
        XCTAssertTrue(view.viewModel.coordinator != nil)
        XCTAssertTrue(view.viewModel.dataProvider != nil)

    }

    func testBuildVC() {
        XCTAssertTrue(view != nil)
    }


}
