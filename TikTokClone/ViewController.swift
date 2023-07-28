//
//  ViewController.swift
//  TikTokClone
//
//  Created by Salih Yusuf Göktaş on 28.07.2023.
//

import UIKit

class ViewController: UIViewController {
	@IBOutlet weak var signUpButton: UIButton!
	@IBOutlet weak var facebookButton: UIButton!
	@IBOutlet weak var googleButton: UIButton!
	@IBOutlet weak var logInButton: UIButton!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		setupView()
	}

	
	func setupView() {
		signUpButton.layer.cornerRadius = 18
		facebookButton.layer.cornerRadius = 18
		googleButton.layer.cornerRadius = 18
		logInButton.layer.cornerRadius = 18
	}

}

