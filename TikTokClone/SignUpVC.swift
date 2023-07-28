//
//  SignUpVC.swift
//  TikTokClone
//
//  Created by Salih Yusuf Göktaş on 28.07.2023.
//

import UIKit

class SignUpVC: UIViewController {

	@IBOutlet weak var avatar: UIImageView!
	
	@IBOutlet weak var usernameContainerView: UIView!
	@IBOutlet weak var usernameTextField: UITextField!
	
	@IBOutlet weak var emailContainerView: UIView!
	@IBOutlet weak var emailTextField: UITextField!
	
	@IBOutlet weak var passwordContainerView: UIView!
	@IBOutlet weak var passwordTextField: UITextField!
	
	@IBOutlet weak var signUpButton: UIButton!
	
	
	
	override func viewDidLoad() {
        super.viewDidLoad()
		setupNavigationBar()
		setupUsernameTextField()
		setupEmailTextField()
		setupPasswordTextField()
		setupView()

       
    }
    
	func setupNavigationBar() {
		navigationItem.title = "Create New Account"
		navigationController?.navigationBar.prefersLargeTitles = true
	}

	func setupUsernameTextField() {
		usernameContainerView.layer.borderWidth = 1
		usernameContainerView.layer.borderColor = CGColor(red: 217/255, green: 217/255, blue: 217/255, alpha: 1)
		usernameContainerView.layer.cornerRadius = 20
		usernameContainerView.clipsToBounds = true
		usernameTextField.borderStyle = .none
	}
	
	func setupEmailTextField() {
		emailContainerView.layer.borderWidth = 1
		emailContainerView.layer.borderColor = CGColor(red: 217/255, green: 217/255, blue: 217/255, alpha: 1)
		emailContainerView.layer.cornerRadius = 20
		emailContainerView.clipsToBounds = true
		emailTextField.borderStyle = .none
	}
	
	func setupPasswordTextField() {
		passwordContainerView.layer.borderWidth = 1
		passwordContainerView.layer.borderColor = CGColor(red: 217/255, green: 217/255, blue: 217/255, alpha: 1)
		passwordContainerView.layer.cornerRadius = 20
		passwordContainerView.clipsToBounds = true
		passwordTextField.borderStyle = .none
	}
    
	func setupView() {
		avatar.layer.cornerRadius = 60
		signUpButton.layer.cornerRadius = 18
	}

}
