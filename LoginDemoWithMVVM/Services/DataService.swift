//
//  DataService.swift
//  LoginDemoWithMVVM
//
//  Created by Abeer Hasan on 28/07/2021.
//

import Foundation

class DataService {
    static let instance = DataService()
    
    var currentUser : UserLogin?
    
    func saveUser(user: UserLogin){
        UserDefaults.standard.setValue(user.password , forKey: user.email)
    }
    
    func validatUser(user: UserLogin) -> String {
        let password = UserDefaults.standard.string(forKey: user.email)
       
        if  password == "" || user.password != password{
             return "Wrong email or password!"
        }else {
            currentUser = user
        }
        return ""
    }
}
