//
//  LoginViewControllerTests.swift
//  UITests
//
//  Created by Sabrina on 09/10/21.
//

import XCTest
import UIKit
import Presentation
@testable import UI

class LoginViewControllerTests: XCTestCase {

    func test_loading_is_hidden_on_start()  {
        let sut = makeSut()
        XCTAssertEqual(sut.loadingIndicator?.isAnimating, false)
    }
    
    func test_sut_implements_loadingVIew()  {
        let sut = makeSut()
        XCTAssertNotNil(sut as LoadingView)
    }
    
    func test_sut_implements_alertView()  {
        let sut = makeSut()
        XCTAssertNotNil(sut as AlertView)
    }
    
    func test_loginButton_calls_SignUp_on_tap()  {
        var loginViewModel: LoginRequest?
        let sut = makeSut(loginSpy: { loginViewModel = $0 })
        sut.saveButton?.simulateTap()
        let email = sut.emailTextField?.text
        let password = sut.passwordTextField?.text
        XCTAssertEqual(loginViewModel, LoginRequest(email: email, password: password))
    }
}

extension LoginViewControllerTests {
    
    func makeSut(loginSpy: ((LoginRequest) -> Void)? = nil) -> LoginViewController {
        let sut = LoginViewController.instantiate()
        sut.login = loginSpy
        sut.loadViewIfNeeded()
        //checkMemoryLeak(for: sut)
        return sut
    }
}
