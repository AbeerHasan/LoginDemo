//
//  LoginViewMdel.swift
//  LoginDemoWithMVVM
//
//  Created by Abeer Hasan on 27/07/2021.
//

import Foundation
import SimpleTwoWayBinding


enum Regex :String {
       case email = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
       case password = "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{8,}$"
       case phone = "(0)+([0-9]{10})"
       case names = "^[a-zA-Z]*$"
   
}

class LoginViewModel {
    let email: Observable<String> = Observable()
    let password: Observable<String> = Observable()
  
    
    func validateEmail() -> String {
      
        if email.value != "" {
            let emailTest = NSPredicate(format: "SELF MATCHES %@", Regex.email.rawValue)
            if !emailTest.evaluate(with: email.value) {
                return "Not valid email address!"
            }else {
                return ""
            }
        }else {
            return "Required field!"
        }
        
    }
    
    func validatePassword() -> String {
        if password.value != "" {
            let passwordTest = NSPredicate(format: "SELF MATCHES %@", Regex.password.rawValue)
            if !passwordTest.evaluate(with: password.value) {
                return "Not valid password!"
            }else {
                return""
            }
        }else {
            return "Required field!"
        }
    }
    
    func isValidUser() -> String{
        return DataService.instance.validatUser(user: UserLogin(email: email.value!, password: password.value!))
    }
    
    func saveUser(){
        DataService.instance.saveUser(user:  UserLogin(email: email.value!, password: password.value!))
    }
}

