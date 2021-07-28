//
//  HomeViewController.swift
//  LoginDemoWithMVVM
//
//  Created by Abeer Hasan on 28/07/2021.
//

import UIKit
import SimpleTwoWayBinding

class HomeViewController: UIViewController {

    
    @IBOutlet weak var userNameLabel: UILabel!
    
    private let homeViewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
    
    func setUp(){
        self.userNameLabel.text = homeViewModel.getUserName()
        
    }

}
