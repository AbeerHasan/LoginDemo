//
//  RegaxEnum.swift
//  LoginDemoWithMVVM
//
//  Created by Abeer Hasan on 30/07/2021.
//

import Foundation

enum Regex :String {
       case email = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
       case password = "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{8,}$"
       case phone = "(0)+([0-9]{10})"
       case names = "^[a-zA-Z]*$"
   
}
