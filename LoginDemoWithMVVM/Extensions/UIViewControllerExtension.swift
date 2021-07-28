//
//  UIViewControllerExtension.swift
//  LoginDemoWithMVVM
//
//  Created by Abeer Hasan on 28/07/2021.
//

import UIKit

extension UIViewController {
    func showAlert(title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let actionArabic = UIAlertAction(title: "OK", style: .default) { action in
            alert.dismiss(animated: true, completion: nil)
        }
        alert.addAction(actionArabic)
        present(alert, animated: true)
    }
    
    func navigateTo(viewControllerName: String){
        let mainStoryboard = UIStoryboard(name: viewControllerName, bundle: nil)
        let viewController = mainStoryboard.instantiateViewController(identifier: viewControllerName)
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}


