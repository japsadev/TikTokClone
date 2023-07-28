//
//  SignInVC.swift
//  TikTokClone
//
//  Created by Salih Yusuf Göktaş on 28.07.2023.
//

import UIKit

class SignInVC: UIViewController {

	
	@IBOutlet weak var emailContainerView: UIView!
	@IBOutlet weak var emailTextField: UITextField!
	
	@IBOutlet weak var passwordContainerView: UIView!
	@IBOutlet weak var passwordTextField: UITextField!
	
	@IBOutlet weak var signInButton: UIButton!
	
	override func viewDidLoad() {
        super.viewDidLoad()
		setupNavigationBar()
		setupPasswordTextField()
		setupEmailTextField()
        
    }
    
	func setupNavigationBar() {
		navigationItem.title = "Sign In"
		navigationController?.navigationBar.prefersLargeTitles = true
	}

	func setupPasswordTextField() {
		passwordContainerView.layer.borderWidth = 1
		passwordContainerView.layer.borderColor = CGColor(red: 217/255, green: 217/255, blue: 217/255, alpha: 1)
		passwordContainerView.layer.cornerRadius = 20
		passwordContainerView.clipsToBounds = true
		passwordTextField.borderStyle = .none
	}
	
	func setupEmailTextField() {
		emailContainerView.layer.borderWidth = 1
		emailContainerView.layer.borderColor = CGColor(red: 217/255, green: 217/255, blue: 217/255, alpha: 1)
		emailContainerView.layer.cornerRadius = 20
		emailContainerView.clipsToBounds = true
		emailTextField.borderStyle = .none
	}
	
}
