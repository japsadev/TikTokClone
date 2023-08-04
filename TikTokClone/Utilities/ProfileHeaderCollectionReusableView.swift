//
//  ProfileHeaderCollectionReusableView.swift
//  TikTokClone
//
//  Created by Salih Yusuf Göktaş on 4.08.2023.
//

import UIKit

class ProfileHeaderCollectionReusableView: UICollectionReusableView {
	@IBOutlet weak var avatar: UIImageView!
	@IBOutlet weak var username: UILabel!
	@IBOutlet weak var editProfileButton: UIButton!
	@IBOutlet weak var favoritesButton: UIButton!
	
	var user: User? {
		didSet {
			updateView()
		}
	}
	
	func updateView() {
		self.username.text = "@" + user!.username!
		guard let profileImageUrl = user!.profileImageUrl else {return}
		self.avatar.loadImage(profileImageUrl)
	}
	
	func setupView() {
		avatar.layer.cornerRadius = 50
		editProfileButton.layer.borderColor = UIColor.lightGray.cgColor
		editProfileButton.layer.borderWidth = 0.8
		editProfileButton.backgroundColor = .white
		editProfileButton.layer.cornerRadius = 5
		favoritesButton.layer.borderColor = UIColor.lightGray.cgColor
		favoritesButton.layer.borderWidth = 0.8
		favoritesButton.backgroundColor = .white
		favoritesButton.layer.cornerRadius = 5
	}
}
