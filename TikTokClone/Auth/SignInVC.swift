//
//  SignInVC.swift
//  TikTokClone
//
//  Created by Salih Yusuf Göktaş on 28.07.2023.
//

import UIKit
import ProgressHUD

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
    
	
	@IBAction func signInDidTapped(_ sender: Any) {
		self.validateFields()
		self.view.endEditing(true)
		self.signIn {
			let scene = UIApplication.shared.connectedScenes.first
			if let sd: SceneDelegate = (scene?.delegate as? SceneDelegate) {
				sd.configureInitialViewController()
			}
		} onError: { errorMessage in
			ProgressHUD.showError(errorMessage)
		}
	}
	
}

extension SignInVC {
	func signIn(onSuccess: @escaping() -> Void, onError: @escaping(_ errorMessage: String) -> Void ) {
		ProgressHUD.show("Loading...")
		Api.User.signIn(email: self.emailTextField.text!, password: self.passwordTextField.text!) {
			ProgressHUD.dismiss()
			onSuccess()
		} onError: { errorMessage in
			onError(errorMessage)
		}


	}
	
	func validateFields() {
		guard let email = self.emailTextField.text, !email.isEmpty else {
			ProgressHUD.showError("Please enter an email")
			return
		}
		guard let password = self.passwordTextField.text, !password.isEmpty else {
			ProgressHUD.showError("Please enter an password")
			return
		}
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
