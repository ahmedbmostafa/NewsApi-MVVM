//
//  MockNewsDataProvider.swift
//  SeamsLabTaskTests
//
//  Created by ahmed mostafa on 02/02/2022.
//

import XCTest
@testable import SeamsLabTask

class MockNewsDataProvider: NewsDataProviderProtocol {

    var delegate: NewsDataProviderDelegate?

    var closure: (() -> ())?

    func fetchNews() {
        closure?()
    }
}
