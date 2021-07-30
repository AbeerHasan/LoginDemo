//
//  ViewController.swift
//  LoginDemoWithMVVM
//
//  Created by Abeer Hasan on 27/07/2021.
//

import UIKit
import SimpleTwoWayBinding

class ViewController: UIViewController {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var emailErrorLabel: UILabel!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordErrorLabel: UILabel!
    
    private let loginViewModel = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }

    func setUp(){
        emailTextField.bind(with: loginViewModel.email)
        passwordTextField.bind(with: loginViewModel.password)
        
        emailErrorLabel.observe(for: loginViewModel.email) {  [unowned self](_) in
            self.emailErrorLabel.text = self.loginViewModel.validateEmail()
            self.emailErrorLabel.isHidden = !self.loginViewModel.emailErrorIsExist
           
        }

        passwordErrorLabel.observe(for: loginViewModel.password) {  [unowned self](_) in
            self.passwordErrorLabel.text = self.loginViewModel.validatePassword()
            self.passwordErrorLabel.isHidden = !self.loginViewModel.passwordErrorIsExist
        }
    }
    
    //----------------- Actions ----------------------------------------------------------------------
    @IBAction func loginButtonClicked(_ sender: Any) {
        if passwordErrorLabel.text == "" && emailErrorLabel.text == "" {
            let error = loginViewModel.isValidUser()
            if  error == "" {
              navigateTo(viewControllerName: "HomeViewController")
            }else {
              showAlert(title: "Error", message: error)
            }
        }
    }
    
    @IBAction func saveButtonClicked(_ sender: Any) {
        if passwordErrorLabel.text == "" && emailErrorLabel.text == "" {
            loginViewModel.saveUser()
            showAlert(title: "Success", message: "You signed up successfully")
        }
    }
    
}
