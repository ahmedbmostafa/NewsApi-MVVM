//
//  MockNewsVC.swift
//  SeamsLabTaskTests
//
//  Created by ahmed mostafa on 02/02/2022.
//

import XCTest
@testable import SeamsLabTask

class MockNewsVC: NewsVC {

    var isShowLoaderCalls = false
    var isReloadNewsCalls = false
    var isShowErrorCalls = false

    override func bindViewModelOutput() {
        viewModel.output = { [weak self] output in
            guard let self = self else { return }
            switch output {
            case .reloadNews:
                self.isReloadNewsCalls = true
            case .showActivityIndicator( _):
                self.isShowLoaderCalls = true
            case .showError( _):
                self.isShowErrorCalls = true
            }
        }
    }

}
