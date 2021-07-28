//
//  HomeViewModel.swift
//  LoginDemoWithMVVM
//
//  Created by Abeer Hasan on 28/07/2021.
//

import Foundation
import SimpleTwoWayBinding

class HomeViewModel {
    
    func getUserName() -> String {
        let email = DataService.instance.currentUser?.email
        return "Hi \(email!.prefix(upTo: email!.firstIndex(of: "@")!))"
    }
}
