//
//  PasswordStatusViewTests.swift
//  PasswordTests
//
//  Created by Artem Marhaza on 07/04/2023.
//

import XCTest

@testable import Password

class PasswordStatusViewTests_ShowCheckmarkOrReset_When_Validation_Is_Inline: XCTestCase {
    
    var statusView: PasswordStatusView!
    let validPassword = "123456Aa!"
    let tooShort = "123Aa!"
    
    override func setUp() {
        super.setUp()
        
        statusView = PasswordStatusView()
        statusView.shouldResetCriteria = true
    }
    
    func testValidPassword() throws {
        statusView.updateDisplay(validPassword)
        XCTAssertTrue(statusView.lengthCriteriaView.isCriteriaMet)
        XCTAssertTrue(statusView.lengthCriteriaView.isCheckmarkImage) // ✅
    }
    
    func isTooShort() throws {
        statusView.updateDisplay(tooShort)
        XCTAssertFalse(statusView.lengthCriteriaView.isCriteriaMet)
        XCTAssertTrue(statusView.lengthCriteriaView.isResetImage) // ⚪️
    }
}

class PasswordStatusViewTests_ShowCheckmarkOrRedX_When_Validation_Is_Loss_Of_Focus: XCTestCase {
    
    var statusView: PasswordStatusView!
    let validPassword = "123456Aa!"
    let tooShort = "123Aa!"
    
    override func setUp() {
        super.setUp()
        
        statusView = PasswordStatusView()
        statusView.shouldResetCriteria = false
    }
    
    func testValidPassword() throws {
        statusView.updateDisplay(validPassword)
        XCTAssertTrue(statusView.lengthCriteriaView.isCriteriaMet)
        XCTAssertTrue(statusView.lengthCriteriaView.isCheckmarkImage) // ✅
    }
    
    func isTooShort() throws {
        statusView.updateDisplay(tooShort)
        XCTAssertFalse(statusView.lengthCriteriaView.isCriteriaMet)
        XCTAssertTrue(statusView.lengthCriteriaView.isXmarkImage) // ❌
    }
}

class PasswordStatusViewTests_Validate_3_of_4_Criteria_Met: XCTestCase {
    
    var statusView: PasswordStatusView!
    let twoOfFour = "12345678A"
    let threeOfFour = "12345678Aa"
    let fourOfFour = "12345678Aa!"
    
    override func setUp() {
        super.setUp()
        
        statusView = PasswordStatusView()
    }
    
    func testTwoOfFour() throws {
        XCTAssertFalse(statusView.validate(twoOfFour))
    }
    
    func testThreeOfFour() throws {
        XCTAssertTrue(statusView.validate(threeOfFour))
    }
    
    func testFourOfFour() throws {
        XCTAssertTrue(statusView.validate(fourOfFour))
    }
}
