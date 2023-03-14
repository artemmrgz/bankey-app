//
//  AccountSummaryViewControllerTests.swift
//  BankeyUnitTests
//
//  Created by Artem Marhaza on 14/03/2023.
//

import Foundation
import XCTest

@testable import Bankey

class AccountSummaryViewControllerTests: XCTestCase {
    var vc: AccountSummaryViewController!
    
    override func setUp() {
        super.setUp()
        vc = AccountSummaryViewController()
    }
    
    func testTitleAndMessageForServerError() throws {
        let titleAndMessage = vc.titleAndMessageForTesting(for: .serverError)
        XCTAssertEqual(titleAndMessage.0, "Server Error")
        XCTAssertEqual(titleAndMessage.1, "Ensure you are connected to the internet. Please try again.")
    }
    
    func testTitleAndMessageForDecodingError() throws {
        let titleAndMessage = vc.titleAndMessageForTesting(for: .decodingError)
        XCTAssertEqual(titleAndMessage.0, "Network Error")
        XCTAssertEqual(titleAndMessage.1, "We could not process your request. Please try again.")
    }
}
