//
//  LoginViewMdel.swift
//  LoginDemoWithMVVM
//
//  Created by Abeer Hasan on 27/07/2021.
//

import Foundation
import SimpleTwoWayBinding


class LoginViewModel {
    let email: Observable<String> = Observable()
    let password: Observable<String> = Observable()
    
    var emailErrorIsExist = false
    var passwordErrorIsExist = false
    
    
    
    func validateEmail() -> String {
        let error = Validation.validateEmail(email: email.value!)
        error == "" ? (emailErrorIsExist = false) : (emailErrorIsExist = true)
        
        return error
    }
    
    func validatePassword() -> String {
        let error = Validation.validatePassword(password: password.value!)
        error == "" ? (passwordErrorIsExist = false) :  (passwordErrorIsExist = true)
        
        return error
    }
    
    func isValidUser() -> String{
        return DataService.instance.validatUser(user: UserLogin(email: email.value!, password: password.value!))
    }
    
    func saveUser(){
        DataService.instance.saveUser(user:  UserLogin(email: email.value!, password: password.value!))
    }
}

