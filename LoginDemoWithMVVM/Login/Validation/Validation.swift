//
//  Validation.swift
//  LoginDemoWithMVVM
//
//  Created by Abeer Hasan on 30/07/2021.
//

import Foundation

class Validation {
    static func validateEmail(email: String) -> String {
      
        if email != "" {
            let emailTest = NSPredicate(format: "SELF MATCHES %@", Regex.email.rawValue)
            if !emailTest.evaluate(with: email) {
                return "Not valid email address!"
            }else {
                return ""
            }
        }else {
            return "Required field!"
        }
        
    }
    
    static func validatePassword(password: String) -> String {
        if password != "" {
            let passwordTest = NSPredicate(format: "SELF MATCHES %@", Regex.password.rawValue)
            if !passwordTest.evaluate(with: password) {
                return "Not valid password!"
            }else {
                return""
            }
        }else {
            return "Required field!"
        }
    }
    
}
