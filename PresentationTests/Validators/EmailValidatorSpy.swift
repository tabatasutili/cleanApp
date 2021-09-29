//
//  EmailValidatorSpy.swift
//  PresentationTests
//
//  Created by Sabrina on 29/09/21.
//

import Foundation
import Presentation

class EmailValidatorSpy: EmailValidator {
    var isValid = true
    var email: String?

    func isValid(email: String) -> Bool {
        self.email = email
        return isValid
    }

    func simulateInvalidEmail() {
           isValid = false
       }
   }
