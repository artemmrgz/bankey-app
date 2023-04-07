//
//  ViewControllerTests.swift
//  PasswordTests
//
//  Created by Artem Marhaza on 07/04/2023.
//

import XCTest

@testable import Password

class ViewControllerTests_NewPassword_Validation: XCTestCase {
    
    var vc: ViewController!
    let validPassword = "12345678Aa!"
    let invalidPassword = "12345678Aa+"
    let tooShort = "123Aa!"
    
    override func setUp() {
        super.setUp()
        vc = ViewController()
    }
    
    func testEmptyPassword() throws {
        vc.newPasswordText = ""
        vc.resetPasswordButtonTapped(sender: UIButton())
        XCTAssertEqual(vc.newPasswordTextField.errorMessageLabel.text!, "Enter your password")
    }
    
    func testInvalidPassword() throws {
        vc.newPasswordText = invalidPassword
        vc.resetPasswordButtonTapped(sender: UIButton())
        XCTAssertEqual(vc.newPasswordTextField.errorMessageLabel.text!, "Enter valid special characters (.,@:?!()$\\/#) with no spaces")
    }
    
    func testCriteriaNotMet() throws {
        vc.newPasswordText = tooShort
        vc.resetPasswordButtonTapped(sender: UIButton())
        XCTAssertEqual(vc.newPasswordTextField.errorMessageLabel.text!, "Your password must meet the requirements below")
    }
    
    func testValidPassword() throws {
        vc.newPasswordText = validPassword
        vc.resetPasswordButtonTapped(sender: UIButton())
        XCTAssertEqual(vc.newPasswordTextField.errorMessageLabel.text!, "")
    }
}

class ViewControllerTests_ConfirmPassword_Validation: XCTestCase {
    
    var vc: ViewController!
    let validPassword = "12345678Aa!"
    let tooShort = "123Aa!"
    
    override func setUp() {
        super.setUp()
        vc = ViewController()
    }
    
    func testEmptyPassword() throws {
        vc.confirmPasswordText = ""
        vc.resetPasswordButtonTapped(sender: UIButton())
        XCTAssertEqual(vc.confirmPasswordTextField.errorMessageLabel.text!, "Enter your password")
    }
    
    func testPasswordsDoNotMatch() throws {
        vc.newPasswordText = validPassword
        vc.confirmPasswordText = tooShort
        vc.resetPasswordButtonTapped(sender: UIButton())
        XCTAssertEqual(vc.confirmPasswordTextField.errorMessageLabel.text!, "Password do not match")
    }
    
    func testPasswordsMatch() throws {
        vc.newPasswordText = validPassword
        vc.confirmPasswordText = validPassword
        vc.resetPasswordButtonTapped(sender: UIButton())
        XCTAssertEqual(vc.confirmPasswordTextField.errorMessageLabel.text!, "")
    }
}

class ViewControllerTests_Show_Alert: XCTestCase {
    
    var vc: ViewController!
    let validPassword = "12345678Aa!"
    let tooShort = "123Aa!"
    
    override func setUp() {
        super.setUp()
        vc = ViewController()
    }
    
    func testShowSuccess() throws {
        vc.newPasswordText = validPassword
        vc.confirmPasswordText = validPassword
        vc.resetPasswordButtonTapped(sender: UIButton())
        
        XCTAssertNotNil(vc.alert)
        XCTAssertEqual(vc.alert!.title, "Success") // increases coupling
    }
    
    func testShowError() throws {
        vc.newPasswordText = validPassword
        vc.confirmPasswordText = tooShort
        vc.resetPasswordButtonTapped(sender: UIButton())
        
        XCTAssertNil(vc.alert)
    }
}
