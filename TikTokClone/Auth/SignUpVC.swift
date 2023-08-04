//
//  SignUpVC.swift
//  TikTokClone
//
//  Created by Salih Yusuf Göktaş on 28.07.2023.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase
import PhotosUI
import FirebaseStorage
import ProgressHUD

class SignUpVC: UIViewController {
	
	@IBOutlet weak var avatar: UIImageView!
	
	@IBOutlet weak var usernameContainerView: UIView!
	@IBOutlet weak var usernameTextField: UITextField!
	
	@IBOutlet weak var emailContainerView: UIView!
	@IBOutlet weak var emailTextField: UITextField!
	
	@IBOutlet weak var passwordContainerView: UIView!
	@IBOutlet weak var passwordTextField: UITextField!
	
	@IBOutlet weak var signUpButton: UIButton!
	
	var image: UIImage? = nil
	
	
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
		avatar.clipsToBounds = true
		avatar.isUserInteractionEnabled = true
		let tapGesture = UITapGestureRecognizer(target: self, action: #selector(presentPicker))
		avatar.addGestureRecognizer(tapGesture)
	}
	
	func validateFields() {
		guard let username = self.usernameTextField.text, !username.isEmpty else {
			ProgressHUD.showError("Please enter an username")
			return
		}
		guard let email = self.emailTextField.text, !email.isEmpty else {
			ProgressHUD.showError("Please enter an email")
			return
		}
		guard let password = self.passwordTextField.text, !password.isEmpty else {
				ProgressHUD.showError("Please enter an password")
			return
		}
}
	
	
	@IBAction func signUpDidTapped(_ sender: Any) {
		self.validateFields()
		self.signUp {
			let scene = UIApplication.shared.connectedScenes.first
			if let sd: SceneDelegate = (scene?.delegate as? SceneDelegate) {
				sd.configureInitialViewController()
			}
		} onError: { errorMessage in
			ProgressHUD.showError(errorMessage)
		}

		
	}
}

extension SignUpVC: PHPickerViewControllerDelegate {
	func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
		for item in results {
			item.itemProvider.loadObject(ofClass: UIImage.self) { image, error in
				if let imageSelected = image as? UIImage {
					DispatchQueue.main.async {
						self.avatar.image = imageSelected
						self.image = imageSelected
					}
				}
			}
		}
		dismiss(animated: true)
	}
	
	@objc func presentPicker() {
		var configuration: PHPickerConfiguration = PHPickerConfiguration()
		configuration.filter = PHPickerFilter.images
		configuration.selectionLimit = 1
		
		let picker: PHPickerViewController = PHPickerViewController(configuration: configuration)
		picker.delegate = self
		self.present(picker, animated: true)
		
	}

}

extension SignUpVC {
	func signUp(onSuccess: @escaping() -> Void, onError: @escaping(_ errorMessage: String) -> Void ) {
		ProgressHUD.show("Loading...")
		Api.User.signUp(withUsername: self.usernameTextField.text!, email: self.emailTextField.text!, password: self.passwordTextField.text!, image: self.image) {
			ProgressHUD.dismiss()
			onSuccess()
		} onError: { errorMessage in
			onError(errorMessage)
		}

	}
}
